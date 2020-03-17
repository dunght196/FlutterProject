
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mp_chart/mp/chart/bar_chart.dart';
import 'package:mp_chart/mp/controller/bar_chart_controller.dart';
import 'package:mp_chart/mp/controller/horizontal_bar_chart_controller.dart';
import 'package:mp_chart/mp/core/data/bar_data.dart';
import 'package:mp_chart/mp/core/data_interfaces/i_bar_data_set.dart';
import 'package:mp_chart/mp/core/data_set/bar_data_set.dart';
import 'package:mp_chart/mp/core/description.dart';
import 'package:mp_chart/mp/core/entry/bar_entry.dart';
import 'package:mp_chart/mp/core/utils/color_utils.dart';

import 'mpchart/action_state.dart';
import 'mpchart/util.dart';

class ChartCombined extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChartCombinedState();
  }
}

class ChartCombinedState extends State<ChartCombined> {
  BarChartController controller;

  @override
  void initState() {
    super.initState();
    _initController();
    _initBarData();
  }

  @override
  Widget build(BuildContext context) {
    return BarChart(controller);
  }

  void _initController() {
    var desc = Description()..enabled = false;
    controller = HorizontalBarChartController(
        axisLeftSettingFunction: (axisLeft, controller) {
          axisLeft
            ..drawGridLines = (false)
            ..setAxisMinimum(0)
            ..typeface = Util.LIGHT;
        },
        axisRightSettingFunction: (axisRight, controller) {
          axisRight.enabled = (false);
        },
        legendSettingFunction: (legend, controller) {
          legend
            ..enabled = (false);
        },
        xAxisSettingFunction: (xAxis, controller) {
          xAxis
            ..drawGridLines = (false)
            ..typeface = Util.LIGHT;
        },
        drawGridBackground: false,
        dragXEnabled: true,
        dragYEnabled: true,
        scaleXEnabled: true,
        scaleYEnabled: true,
        pinchZoomEnabled: true,
        maxVisibleCount: 200,
        maxHighlightDistance: 50,
        description: desc);
  }

 /* void _initCombinedData() {
    controller.data = CombinedData();
    controller.data
      ..setData2(generateStackBar())
      ..setValueTypeface(Util.LIGHT);
  }*/

  void _initBarData() {
    List<BarEntry> values = List();
    List<BarEntry> values1 = List();

    values.add(BarEntry.fromListYVals(
      x: 1,
      vals: List()..add(10)..add(20)..add(30),
    ));

    values1.add(BarEntry.fromListYVals(
      x: 2,
      vals: List()..add(10)..add(20)..add(30),
    ));


    BarDataSet set1;
    BarDataSet set2;

    set1 = BarDataSet(values, "Statistics Vienna 2014");
    set1.setDrawIcons(false);
//    set1.setColors1(_getColors());
    set1.setDrawValues(false);

    set2 = BarDataSet(values1, "Statistics Vienna 2014");
    set2.setDrawIcons(false);
//    set2.setColors1(_getColors1());
    set2.setDrawValues(false);

    List<IBarDataSet> dataSets = List();
    dataSets.add(set1);
    dataSets.add(set2);

    controller.data = BarData(dataSets);
    controller.data
      ..setValueTextColor(ColorUtils.WHITE);

    setState(() {}
    );
  }

}