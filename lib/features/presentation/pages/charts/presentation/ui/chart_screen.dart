import 'package:flutter/material.dart';
import 'package:flutter_poc/core/constants/color.dart';
import 'package:flutter_poc/core/constants/string.dart';
import 'package:flutter_poc/features/presentation/pages/charts/presentation/ui/bar_chart_widget.dart';
import 'package:flutter_poc/features/presentation/pages/charts/presentation/ui/line_chart.dart';
import 'package:flutter_poc/features/presentation/pages/charts/presentation/ui/pie_chart.dart';
import 'package:flutter_poc/features/presentation/widgets/custom_app_bar.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(headerTitle: Strings.chartsTitle),
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                BarChartSample(),
                const LineChartSample(),
                const PieChartSample()
              ],
            ),
          ),
        ));
  }
}
