import 'package:flutter/material.dart';
import 'package:flutter_poc/core/constants/color.dart';
import 'package:flutter_poc/core/constants/constants.dart';
import 'package:flutter_poc/core/constants/paddingConstant.dart';

class FeaturedItemWidget extends StatefulWidget {
  final String featuredTitle;
  final String featuredValue;

  FeaturedItemWidget(
      {required this.featuredTitle, required this.featuredValue});

  @override
  State<FeaturedItemWidget> createState() => _FeaturedItemWidgetState();
}

class _FeaturedItemWidgetState extends State<FeaturedItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                color: AppColors.border,
                padding: const EdgeInsets.all(GapConstants.MEDIUM_GAP),
                child: Text(
                  widget.featuredTitle,
                  style: kProductPrice,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(GapConstants.MEDIUM_GAP),
                child: Text(widget.featuredValue, style: kProductTitle),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
