import 'package:flutter/material.dart';
import 'package:flutter_poc/core/constants/constants.dart';
import 'package:flutter_poc/core/constants/paddingConstant.dart';
import 'package:flutter_poc/core/services/firebase_service.dart';
import 'package:flutter_poc/features/domain/entities/models/product.dart';
import 'package:flutter_poc/features/presentation/widgets/product_view_widget.dart';
import 'package:flutter_poc/core/constants/string.dart';

class ProductListItemWidget extends StatefulWidget {
  final List<Product> arrProductsList;
  final String headerTitle;

  ProductListItemWidget(
      {required this.arrProductsList, required this.headerTitle});
  @override
  State<ProductListItemWidget> createState() => _ProductListItemWidgetState();
}

class _ProductListItemWidgetState extends State<ProductListItemWidget> {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kProductListItemWidgetEdgeInsets,
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              widget.headerTitle,
              style: kHomeProductHeaderTitle,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/plp_screen');
              },
              child: const Text(
                Strings.seeMore,
                style: kHomeSeeMoreTitle,
              ),
            )
          ],
        ),
        const SizedBox(
          height: GapConstants.SMALL_GAP,
        ),
        Container(
          height: HeightConstants.PRODUCT_VIEW_ITEM_WIDGET_HEIGHT,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: widget.arrProductsList.length,
            itemBuilder: (context, index) {
              Product product = widget.arrProductsList[index];
              return ProductView(
                productId: product.id,
                imageUrl: product.thumbnail,
                productName: product.title,
                productDescription: product.description,
                price: product.price as int,
                images: product.images,
                discountPercentage: product.discountPercentage,
                isWidthRequired: true,
                discountedPrice: product.findDiscountedPrice(
                    product.price, product.discountPercentage),
                onProductDetailsPress: () {
                  firebaseAnalyticsProductEvent(product.title,
                      product.description, product.id, product.price as int);
                  Navigator.pushNamed(
                    context,
                    '/pdp_screen',
                    arguments: {
                      'productId': product.id,
                      'productName': product.title,
                      'productDescription': product.description,
                      'productImages': product.images,
                    },
                  );
                },
              );
            },
          ),
        )
      ]),
    );
  }
}
