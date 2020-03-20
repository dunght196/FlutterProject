import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mp_chart/mp/chart/bar_chart.dart';
import 'package:mp_chart/mp/chart/scatter_chart.dart';
import 'package:mp_chart/mp/controller/bar_chart_controller.dart';
import 'package:mp_chart/mp/controller/horizontal_bar_chart_controller.dart';
import 'package:mp_chart/mp/controller/scatter_chart_controller.dart';
import 'package:mp_chart/mp/core/data/bar_data.dart';
import 'package:mp_chart/mp/core/data/scatter_data.dart';
import 'package:mp_chart/mp/core/data_interfaces/i_bar_data_set.dart';
import 'package:mp_chart/mp/core/data_interfaces/i_scatter_data_set.dart';
import 'package:mp_chart/mp/core/data_set/bar_data_set.dart';
import 'package:mp_chart/mp/core/data_set/scatter_data_set.dart';
import 'package:mp_chart/mp/core/description.dart';
import 'package:mp_chart/mp/core/entry/bar_entry.dart';
import 'package:mp_chart/mp/core/entry/entry.dart';
import 'package:mp_chart/mp/core/image_loader.dart';
import 'package:mp_chart/mp/core/utils/color_utils.dart';
import 'dart:ui' as ui;
import 'package:mp_chart/mp/core/value_formatter/stacked_value_formatter.dart';
import 'package:mp_chart/mp/core/value_formatter/value_formatter.dart';

import 'mpchart/action_state.dart';
import 'mpchart/util.dart';

final double widthBorderChart = 1;
final double heightMarkerBaby = 15;
final double widthMarkerBaby = 12;
final double widthItemChart = 0.26;

final Color colorBorder = Colors.grey[400];
final Color colorGrumpy = Colors.grey[350];
final Color colorPettish = Colors.pink[50];

class ChartCombined extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChartCombinedState();
  }
}

class ChartCombinedState extends State<ChartCombined> {
  BarChartController controllerBarChart;

  @override
  void initState() {
    super.initState();
    _initControllerBarChart();
    _initBarData();
  }

  @override
  Widget build(BuildContext context) {
    return BarChart(controllerBarChart);
  }

  void _initControllerBarChart() {
    var desc = Description()..enabled = false;
    controllerBarChart = BarChartController(
        backgroundColor: Colors.transparent,
        axisLeftSettingFunction: (axisLeft, controller) {
          axisLeft
            ..drawGridLines = false
            ..setAxisMinimum(0)
            ..setAxisMaximum(7);
        },
        axisRightSettingFunction: (axisRight, controller) {
          axisRight.enabled = (false);
        },
        legendSettingFunction: (legend, controller) {
          legend..enabled = false;
        },
        xAxisSettingFunction: (xAxis, controller) {
          xAxis.drawGridLines = false;
          xAxis.setAxisMaximum(12.4);
          xAxis.setAxisMinimum(-0.4);
        },
        drawGridBackground: false,
//        dragXEnabled: false,
//        dragYEnabled: false,
//        scaleXEnabled: false,
//        scaleYEnabled: false,
//        pinchZoomEnabled: false,
//        maxVisibleCount: 60,
//        fitBars: false,
//        highlightFullBarEnabled: false,
//        drawValueAboveBar: false,
//        doubleTapToZoomEnabled: false,
        description: desc);
  }

  void _initBarData() {
    List<BarEntry> values = List();
    List<BarEntry> values1 = List();

    values.add(BarEntry.fromListYVals(
      x: 2,
      vals: List()..add(1)..add(1)..add(1),
    ));

    values1.add(BarEntry.fromListYVals(
      x: 3,
      vals: List()..add(1)..add(1)..add(1),
    ));

    BarDataSet set1;
    BarDataSet set2;

    set1 = BarDataSet(values, "Statistics Vienna 2014");
    set1.setDrawIcons(false);
    set1.setBarBorderColor(colorBorder);
    set1.setBarBorderWidth(widthBorderChart);
    set1.setColors1(_getColors());
    set1.setDrawValues(false);

    set2 = BarDataSet(values1, "Statistics Vienna 2014");
    set2.setDrawIcons(false);
    set2.setColors1(_getColors1());
    set2.setDrawValues(false);

    List<IBarDataSet> dataSets = List();
    dataSets.add(set1);
    dataSets.add(set2);

    BarData d = BarData(dataSets);
    d.barWidth = 0.26;

    controllerBarChart.data = d;
    controllerBarChart.drawGridBackground = false;
//    controller.data
//      ..setValueFormatter(StackedValueFormatter(false, "", 1));
//      ..setValueTextColor(ColorUtils.WHITE);

    setState(() {});
  }


  List<Color> _getColors() {
    return List()
      ..add(Colors.transparent)
      ..add(Colors.transparent)
      ..add(Colors.transparent);
  }

  List<Color> _getColors1() {
    return List()..add(Colors.green)..add(Colors.amber)..add(Colors.black87);
  }
}

class CustomScatterShapeRenderer extends ValueFormatter {
  @override
  String getPointLabel(Entry entry) {
    return entry.mData;
  }
}

class ChartCombined1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChartCombinedState1();
  }
}

class ChartCombinedState1 extends State<ChartCombined1> {
  ScatterChartController controllerScatterChart;

  @override
  void initState() {
    super.initState();
    _initControllerScatterChart();
    _initScatterData();
  }

  @override
  Widget build(BuildContext context) {
    return ScatterChart(controllerScatterChart);
  }

  void _initControllerScatterChart() {
    var desc = Description()..enabled = false;
    controllerScatterChart = ScatterChartController(
        axisLeftSettingFunction: (axisLeft, controller) {
          axisLeft
            ..drawGridLines = (false)
            ..setAxisMinimum(-0.4)
            ..setAxisMaximum(12.4)
            ..typeface = Util.LIGHT;
        },
        axisRightSettingFunction: (axisRight, controller) {
          axisRight.enabled = (false);
//          ..drawGridLines = (false)
//          ..setAxisMinimum(-0.4)
//          ..setAxisMaximum(12.4)
//          ..typeface = Util.LIGHT;
        },
        legendSettingFunction: (legend, controller) {
          legend
            ..enabled = (false);
        },
        xAxisSettingFunction: (xAxis, controller) {
          xAxis
            ..drawGridLines = (false)
            ..setAxisMinimum(0)
            ..setAxisMaximum(7)
            ..typeface = Util.LIGHT;
        },
        drawGridBackground: false,
//        dragXEnabled: false,
//        dragYEnabled: false,
//        scaleXEnabled: false,
//        scaleYEnabled: false,
//        pinchZoomEnabled: false,
//        maxVisibleCount: 60,
//        highlightFullBarEnabled: false,
//        drawValueAboveBar: false,
//        doubleTapToZoomEnabled: false,
        description: desc);
  }

  void _initScatterData() async {
    List<ui.Image> imgs = List(3);
    imgs[0] = await ImageLoader.loadImage('assets/img/star.png');

    List<Entry> values1 = List();
    List<Entry> values2 = List();
    List<Entry> values3 = List();

//    for (int i = 0; i < count; i++) {
//      double val = (random.nextDouble() * range) + 3;
//      values1.add(Entry(x: i.toDouble(), y: val, icon: imgs[0]));
//    }

    values1.add(Entry(x: 1, y: 10, icon: imgs[0], data: '0'));
    values1.add(Entry(x: 1, y: 11, icon: imgs[0], data: '1'));

    // create a dataset and give it a type
    ScatterDataSet set1 = ScatterDataSet(values1, "DS 1");
//    set1.setScatterShape(ScatterShape.SQUARE);
    set1.setColor1(ColorUtils.COLORFUL_COLORS[0]);
    set1.setValueFormatter(CustomScatterShapeRenderer());
    set1.setDrawIcons(true);

    set1.setScatterShapeSize(0);
//    set2.setScatterShapeSize(8);
//    set3.setScatterShapeSize(8);

    List<IScatterDataSet> dataSets = List();
    dataSets.add(set1); // add the data sets
//    dataSets.add(set2);
//    dataSets.add(set3);

    // create a data object with the data sets
    controllerScatterChart.data = ScatterData.fromList(dataSets);
    controllerScatterChart.data.setValueTypeface(Util.LIGHT);
    controllerScatterChart.drawGridBackground = false;

    setState(() {});
  }

}
