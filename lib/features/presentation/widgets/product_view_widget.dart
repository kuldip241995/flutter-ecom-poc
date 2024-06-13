import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_poc/core/constants/color.dart';
import 'package:flutter_poc/core/constants/constants.dart';
import 'package:flutter_poc/core/constants/paddingConstant.dart';

class ProductView extends StatelessWidget {
  final int productId;
  final String imageUrl;
  final String productName;
  final String productDescription;
  final int price;
  final double discountPercentage;
  final List<String> images;
  final bool isWidthRequired;
  final double discountedPrice;
  final VoidCallback? onProductDetailsPress;

  ProductView(
      {required this.productId,
      required this.imageUrl,
      required this.productName,
      required this.productDescription,
      required this.price,
      required this.discountPercentage,
      required this.images,
      required this.isWidthRequired,
      required this.discountedPrice,
      required this.onProductDetailsPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onProductDetailsPress,
      child: Container(
        width:
            isWidthRequired ? HeightConstants.PRODUCT_VIEW_WIDGET_WIDTH : null,
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(BorderRadiusConstants.MEDIUM_BORDER_RADIUS),
          color: AppColors.white,
          boxShadow: const [
            BoxShadow(color: AppColors.lightGrayBorder, spreadRadius: 1),
          ],
        ),
        margin: kProductViewWidgetEdgeInsets,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(
                          BorderRadiusConstants.MEDIUM_BORDER_RADIUS),
                      topRight: Radius.circular(
                          BorderRadiusConstants.MEDIUM_BORDER_RADIUS)),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    height: HeightConstants.PRODUCT_VIEW_WIDGET_HEIGHT,
                    width: isWidthRequired
                        ? HeightConstants.PRODUCT_VIEW_WIDGET_WIDTH
                        : null,
                    fit: BoxFit.fill,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.favorite_border,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    // Handle favorite button press
                  },
                ),
              ],
            ),
            const SizedBox(height: PaddingConstants.SMALL_PADDING),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: PaddingConstants.SMALL_PADDING),
              child: Text(
                productName,
                style: kProductTitle,
                maxLines: 1,
              ),
            ),
            const SizedBox(height: PaddingConstants.SMALL_PADDING),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: PaddingConstants.SMALL_PADDING),
                  child: Text(
                    '\$${price.toStringAsFixed(2)}',
                    style: kProductDiscountedPrice,
                  ),
                ),
                Text(
                  '\$${discountedPrice.toStringAsFixed(2)}',
                  style: kProductPrice,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
