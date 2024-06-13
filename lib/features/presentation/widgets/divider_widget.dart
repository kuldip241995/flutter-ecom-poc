import 'package:flutter/material.dart';
import 'package:flutter_poc/core/constants/color.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColors.separator,
      height: 0.5,
    );
  }
}
