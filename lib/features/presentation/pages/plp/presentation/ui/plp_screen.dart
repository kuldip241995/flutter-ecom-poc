import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_poc/core/constants/paddingConstant.dart';
import 'package:flutter_poc/core/services/firebase_service.dart';
import 'package:flutter_poc/features/domain/entities/models/product.dart';
import 'package:flutter_poc/features/presentation/pages/plp/data/repositories/plp_repo.dart';
import 'package:flutter_poc/features/presentation/pages/plp/presentation/bloc/plp_bloc.dart';
import 'package:flutter_poc/features/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_poc/features/presentation/widgets/product_view_widget.dart';
import 'package:flutter_poc/core/constants/string.dart';
import 'package:flutter_poc/features/presentation/widgets/search_bar_widget.dart';

SliverGridDelegate _gridDelegate =
    const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 10.0,
        mainAxisExtent: 240);

class PLPScreen extends StatelessWidget {
  void firebaseAnalyticsProductEvent(
      productName, productDescription, productId, price) async {
    FirebaseService().sendCustomLogEvents(
      'product_details_event',
      {
        'screenName': 'Product Details',
        'productName': productName,
        'productDescription': productDescription,
        'productId': productId,
        'price': price
      },
    );
  }

  Widget _loadingIndicator() {
    return const SizedBox(
      height: 60,
      child: Center(
        child: CircularProgressIndicator(
          color: Colors.blueAccent,
        ),
      ),
    );
  }

  Widget _errorWidget(BuildContext context, String errorMessage) {
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).padding;
    double newheight = height - padding.top - padding.bottom;
    return Expanded(
        child: SizedBox(
      height: newheight,
      child: Center(child: Text(errorMessage)),
    ));
  }

  @override
  Widget build(BuildContext context) {
    List<Product> arrNewProductsItems = [];
    return BlocProvider<PLPBloc>(
      create: (context) => PLPBloc(PLPRepo())..add(PLPScreenProductEvent()),
      child: Scaffold(
        appBar: CustomAppBar(headerTitle: Strings.productsListTitle),
        body: BlocBuilder<PLPBloc, PLPState>(
          builder: (context, state) {
            if (state is PLPProductSuccessState) {
              arrNewProductsItems = state.arrProductsItems;
            }
            var isLoading = state is PLPProductLoadingState;
            return Column(
              children: [
                SearchBarWidget(
                  onChanged: (text) {
                    BlocProvider.of<PLPBloc>(context)
                        .add(PLPSearchProductsEvent(searchTerm: text));
                  },
                ),
                Expanded(
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (notification) {
                      if (notification is ScrollEndNotification &&
                          notification.metrics.extentAfter == 0) {
                        BlocProvider.of<PLPBloc>(context)
                            .add(PLPLoadMoreEvent());
                      }
                      return false;
                    },
                    child: Column(
                      children: [
                        if (state is PLPProductFailureState)
                          _errorWidget(context, Strings.someThingWentWrong),
                        arrNewProductsItems.isEmpty &&
                                state is PLPProductSuccessState
                            ? _errorWidget(context,
                                isLoading ? "" : Strings.noProductsAvailable)
                            : Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(
                                      PaddingConstants.MEDIUM_PADDING),
                                  child: GridView.builder(
                                    itemCount: arrNewProductsItems.length,
                                    gridDelegate: _gridDelegate,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final product =
                                          arrNewProductsItems[index];
                                      return ProductView(
                                        productId: product.id,
                                        imageUrl: product.thumbnail,
                                        productName: product.title,
                                        productDescription: product.description,
                                        price: product.price,
                                        images: product.images,
                                        discountPercentage:
                                            product.discountPercentage,
                                        isWidthRequired: false,
                                        discountedPrice:
                                            product.findDiscountedPrice(
                                                product.price,
                                                product.discountPercentage),
                                        onProductDetailsPress: () {
                                          firebaseAnalyticsProductEvent(
                                              product.title,
                                              product.description,
                                              product.id,
                                              product.price as int);
                                          Navigator.pushNamed(
                                            context,
                                            '/pdp_screen',
                                            arguments: {
                                              'productId': product.id,
                                              'productName': product.title,
                                              'productDescription':
                                                  product.description,
                                              'productImages': product.images,
                                            },
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              )
                      ],
                    ),
                  ),
                ),
                if (isLoading) _loadingIndicator()
              ],
            );
          },
        ),
      ),
    );
  }
}
