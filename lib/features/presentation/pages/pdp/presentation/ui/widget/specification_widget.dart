import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_poc/core/constants/color.dart';
import 'package:flutter_poc/core/constants/constants.dart';
import 'package:flutter_poc/core/constants/paddingConstant.dart';
import 'package:flutter_poc/core/constants/string.dart';
import 'package:flutter_poc/features/presentation/widgets/divider_widget.dart';

class SpecificationWidget extends StatelessWidget {
  const SpecificationWidget({super.key});

  Widget _buildLeftContent() {
    return Row(
      children: <Widget>[
        ClipRRect(
          child: CachedNetworkImage(
            imageUrl: ProductSpecificationDummyValues.specificationImageUrl,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            height: HeightConstants.PDP_SPECIFICATION_IMAGE_HEIGHT_WIDTH,
            width: HeightConstants.PDP_SPECIFICATION_IMAGE_HEIGHT_WIDTH,
            fit: BoxFit.fill,
          ),
        ),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.all(GapConstants.SMALL_GAP),
            child: Text(
              ProductSpecificationDummyValues.specificationTitle,
              style: kProductTitle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRightContent() {
    return Row(
      children: <Widget>[
        const Expanded(
          child: Padding(
            padding: EdgeInsets.all(GapConstants.SMALL_GAP),
            child: Text(
              ProductSpecificationDummyValues.specificationTitle,
              style: kProductTitle,
            ),
          ),
        ),
        ClipRRect(
          child: CachedNetworkImage(
            imageUrl: ProductSpecificationDummyValues.specificationImageUrl,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            height: HeightConstants.PDP_SPECIFICATION_IMAGE_HEIGHT_WIDTH,
            width: HeightConstants.PDP_SPECIFICATION_IMAGE_HEIGHT_WIDTH,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // Widget for when isFeaturedSelect is false
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
        color: AppColors.border,
      )),

      margin: const EdgeInsets.symmetric(horizontal: GapConstants.MEDIUM_GAP),
      child: Column(children: <Widget>[
        _buildLeftContent(),
        const DividerWidget(),
        _buildRightContent(),
        const DividerWidget(),
        _buildLeftContent(),
        const DividerWidget(),
        _buildRightContent(),
      ]),
      // Add your widget details here
    );
  }
}
