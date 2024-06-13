import 'package:flutter/material.dart';
import 'package:flutter_poc/core/constants/images.dart';
import 'package:flutter_poc/core/constants/paddingConstant.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String headerTitle;
  final VoidCallback? onPersonIconPressed;
  final bool isShowProfile;
  CustomAppBar({
    Key? key,
    this.onPersonIconPressed,
    required this.headerTitle,
    this.isShowProfile = false,
  }) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    List<Widget> actions = [];
    if (isShowProfile) {
      actions.add(
        Padding(
          padding: const EdgeInsets.only(right: GapConstants.MEDIUM_GAP),
          child: GestureDetector(
            onTap: onPersonIconPressed,
            child: CircleAvatar(
              radius: 20,
              child: ClipOval(
                child: Image.asset(
                  Images.imgDummyUser,
                  fit: BoxFit.cover,
                  width: 36,
                  height: 36,
                ),
              ),
            ),
          ),
        ),
      );
    }
    return AppBar(
      actions: actions,
      title: Text(headerTitle),
    );
  }
}
