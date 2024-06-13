import 'package:flutter/material.dart';
import 'package:flutter_poc/core/components/theme_button.dart';
import 'package:flutter_poc/core/constants/color.dart';
import 'package:flutter_poc/core/constants/paddingConstant.dart';
import 'package:flutter_poc/core/constants/string.dart';
import 'package:flutter_poc/core/drawer_menu.dart';
import 'package:flutter_poc/features/presentation/widgets/custom_app_bar.dart';

class MoreSettingsScreen extends StatelessWidget {
  const MoreSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerMenuWidget(),
        appBar: CustomAppBar(
          headerTitle: Strings.moreSettingsText,
        ),
        backgroundColor: AppColors.white,
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ThemeButton(
                  title: Strings.chartsExampleTitle,
                  colour: AppColors.black,
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/charts_screen',
                    );
                  },
                ),
                const SizedBox(
                  height: PaddingConstants.MEDIUM_PADDING,
                ),
                ThemeButton(
                  title: Strings.imageEditorExampleTitle,
                  colour: AppColors.black,
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/image_editor',
                    );
                  },
                ),
                const SizedBox(
                  height: PaddingConstants.MEDIUM_PADDING,
                ),
                ThemeButton(
                  title: Strings.razorPayExampleTitle,
                  colour: AppColors.black,
                  onPressed: () async {
                    Navigator.pushNamed(
                      context,
                      '/razorpay_example_screen',
                    );
                  },
                )
              ]),
        ));
  }
}
