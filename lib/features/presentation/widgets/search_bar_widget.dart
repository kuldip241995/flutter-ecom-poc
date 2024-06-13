import 'package:flutter/material.dart';
import 'package:flutter_poc/core/constants/color.dart';
import 'package:flutter_poc/core/constants/constants.dart';
import 'package:flutter_poc/core/constants/paddingConstant.dart';
import 'package:flutter_poc/core/constants/string.dart';

class SearchBarWidget extends StatelessWidget {
  final Function(String) onChanged;
  const SearchBarWidget({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: kSearchBarWidgetEdgeInsets,
      decoration: BoxDecoration(
        color: AppColors.border,
        borderRadius:
            BorderRadius.circular(BorderRadiusConstants.MEDIUM_BORDER_RADIUS),
      ),
      child: Padding(
        padding: const EdgeInsets.all(GapConstants.SMALL_GAP / 2),
        child: TextField(
          style: const TextStyle(color: Colors.black),
          onChanged: onChanged,
          decoration: const InputDecoration(
            hintText: Strings.productSearchPlaceholder,
            hintStyle: TextStyle(color: Colors.black),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
