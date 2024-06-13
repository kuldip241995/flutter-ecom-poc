import 'package:flutter/material.dart';
import 'package:flutter_poc/core/constants/color.dart';
import 'package:flutter_poc/core/constants/constants.dart';
import 'package:flutter_poc/core/constants/paddingConstant.dart';
import 'package:flutter_poc/core/constants/string.dart';
import 'package:flutter_poc/features/presentation/pages/pdp/presentation/ui/widget/featured_widget.dart';
import 'package:flutter_poc/features/presentation/pages/pdp/presentation/ui/widget/specification_widget.dart';
import 'package:flutter_poc/features/presentation/widgets/carousel_slider_widget.dart';
import 'package:flutter_poc/features/presentation/widgets/custom_app_bar.dart';

class PDPScreen extends StatefulWidget {
  final int productId;
  final String productName;
  final String productDescription;
  final List<String> productImages;
  PDPScreen({
    required this.productId,
    required this.productName,
    required this.productDescription,
    required this.productImages,
  });
  @override
  State<PDPScreen> createState() => _PDPScreenState();
}

class _PDPScreenState extends State<PDPScreen> {
  bool isFeaturedSelect = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(headerTitle: widget.productName),
      body: ListView(
        children: <Widget>[
          CarouselSliderWidget(
              arrProductBannersList: widget.productImages,
              bannerHeight: HeightConstants.PDP_BANNER_HEIGHT),
          const SizedBox(height: GapConstants.MEDIUM_GAP),
          Container(
            margin: const EdgeInsets.symmetric(
                horizontal: PaddingConstants.MEDIUM_PADDING),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  BorderRadiusConstants.SMALL_BORDER_RADIUS),
              color: AppColors.white,
              boxShadow: const [
                BoxShadow(color: AppColors.lightGrayBorder, spreadRadius: 1),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(left: 16.0, top: 8.0, right: 16.0),
                  child: Text(
                    Strings.productNameLabel,
                    style: kProductTitleHeader,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, bottom: 8.0, top: 2.0),
                  child: Text(
                    widget.productName,
                    style: kProductTitleValue,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: GapConstants.MEDIUM_GAP),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: GapConstants.MEDIUM_GAP),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  BorderRadiusConstants.SMALL_BORDER_RADIUS),
              color: AppColors.white,
              boxShadow: const [
                BoxShadow(color: AppColors.lightGrayBorder, spreadRadius: 1),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: kProductTitleHeaderEdgeInsets,
                  child: Text(
                    Strings.productDescriptionLabel,
                    style: kProductTitleHeader,
                  ),
                ),
                Padding(
                  padding: kProductDescriptionHeaderEdgeInsets,
                  child: Text(
                    widget.productDescription,
                    style: kProductTitleValue,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: GapConstants.MEDIUM_GAP),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: GapConstants.MEDIUM_GAP),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  BorderRadiusConstants.SMALL_BORDER_RADIUS),
              color: AppColors.white,
              boxShadow: const [
                BoxShadow(color: AppColors.lightGrayBorder, spreadRadius: 1),
              ],
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isFeaturedSelect = true;
                        });
                      },
                      child: Text(
                        Strings.featuresTitle,
                        style: isFeaturedSelect
                            ? kProductDetailsSelectedTab
                            : kProductDetailsUnSelectedTab,
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.black38,
                  width: 1,
                  height: HeightConstants.PDP_SPECIFICATION_FEATURES_SEP_HEIGHT,
                ),
                Expanded(
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isFeaturedSelect = false;
                        });
                      },
                      child: Text(
                        Strings.specificationTitle,
                        style: isFeaturedSelect
                            ? kProductDetailsUnSelectedTab
                            : kProductDetailsSelectedTab,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: GapConstants.MEDIUM_GAP),
          // Conditionally load widgets based on isFeaturedSelect
          if (isFeaturedSelect)
            const FeaturedWidget()
          else
            const SpecificationWidget()
        ],
      ),
    );
  }
}
