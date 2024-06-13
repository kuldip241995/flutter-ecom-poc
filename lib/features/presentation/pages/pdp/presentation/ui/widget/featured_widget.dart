import 'package:flutter/material.dart';
import 'package:flutter_poc/core/constants/color.dart';
import 'package:flutter_poc/core/constants/paddingConstant.dart';
import 'package:flutter_poc/core/constants/string.dart';
import 'package:flutter_poc/features/presentation/widgets/divider_widget.dart';
import 'package:flutter_poc/features/presentation/widgets/featured_item_widget.dart';

class FeaturedWidget extends StatelessWidget {
  const FeaturedWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: GapConstants.MEDIUM_GAP),
      decoration: BoxDecoration(border: Border.all(color: AppColors.border)),
      child: Column(
        children: <Widget>[
          FeaturedItemWidget(
              featuredTitle: Strings.bandColorLabel,
              featuredValue: ProductFeaturesDummyValues.bandColorLabel),
          const DividerWidget(),
          FeaturedItemWidget(
              featuredTitle: Strings.bandMaterialLabel,
              featuredValue: ProductFeaturesDummyValues.bandMaterialLabel),
          const DividerWidget(),
          FeaturedItemWidget(
              featuredTitle: Strings.bandWidthLabel,
              featuredValue: ProductFeaturesDummyValues.bandColorLabel),
          const DividerWidget(),
          FeaturedItemWidget(
              featuredTitle: Strings.bezelFunctionLabel,
              featuredValue: ProductFeaturesDummyValues.bezelFunctionLabel),
          const DividerWidget(),
          FeaturedItemWidget(
              featuredTitle: Strings.brandLabel,
              featuredValue: ProductFeaturesDummyValues.brandLabel),
          const DividerWidget(),
          FeaturedItemWidget(
              featuredTitle: Strings.calendarTypeLabel,
              featuredValue: ProductFeaturesDummyValues.calendarTypeLabel),
          const DividerWidget(),
          FeaturedItemWidget(
              featuredTitle: Strings.caseDiameterLabel,
              featuredValue: ProductFeaturesDummyValues.caseDiameterLabel),
        ],
      ),
    );
  }
}
