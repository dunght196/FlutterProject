import 'dart:math';
import 'dart:ui';


import 'package:flutter/material.dart';
import 'package:mp_chart/mp/chart/combined_chart.dart';
import 'package:mp_chart/mp/controller/combined_chart_controller.dart';
import 'package:mp_chart/mp/core/data/bar_data.dart';
import 'package:mp_chart/mp/core/data/bubble_data.dart';
import 'package:mp_chart/mp/core/data/candle_data.dart';
import 'package:mp_chart/mp/core/data/combined_data.dart';
import 'package:mp_chart/mp/core/data/line_data.dart';
import 'package:mp_chart/mp/core/data/scatter_data.dart';
import 'package:mp_chart/mp/core/data_set/bar_data_set.dart';
import 'package:mp_chart/mp/core/data_set/bubble_data_set.dart';
import 'package:mp_chart/mp/core/data_set/candle_data_set.dart';
import 'package:mp_chart/mp/core/data_set/line_data_set.dart';
import 'package:mp_chart/mp/core/data_set/scatter_data_set.dart';
import 'package:mp_chart/mp/core/description.dart';
import 'package:mp_chart/mp/core/entry/bar_entry.dart';
import 'package:mp_chart/mp/core/entry/bubble_entry.dart';
import 'package:mp_chart/mp/core/entry/candle_entry.dart';
import 'package:mp_chart/mp/core/entry/entry.dart';
import 'package:mp_chart/mp/core/enums/axis_dependency.dart';
import 'package:mp_chart/mp/core/enums/legend_horizontal_alignment.dart';
import 'package:mp_chart/mp/core/enums/legend_orientation.dart';
import 'package:mp_chart/mp/core/enums/legend_vertical_alignment.dart';
import 'package:mp_chart/mp/core/enums/mode.dart';
import 'package:mp_chart/mp/core/enums/x_axis_position.dart';
import 'package:mp_chart/mp/core/image_loader.dart';
import 'package:mp_chart/mp/core/utils/color_utils.dart';
import 'package:mp_chart/mp/core/value_formatter/value_formatter.dart';
import 'package:mp_chart/mp/painter/combined_chart_painter.dart';

import 'mpchart/action_state.dart';
import 'mpchart/util.dart';


class OtherChartCombined extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OtherChartCombinedState();
  }
}

class OtherChartCombinedState extends CombinedActionState<OtherChartCombined> {
  int _count = 12;
  var random = Random(1);

  @override
  void initState() {
//    _initController();
    _initCombinedData();
    super.initState();
  }

  @override
  String getTitle() => "Other Chart Combined";

  @override
  Widget getBody() {
    return Stack(
      children: <Widget>[
        Positioned(
            right: 0,
            left: 0,
            top: 0,
            bottom: 0,
            child: CombinedChart(controller)),
      ],
    );
  }

//  void _initController() {
//    var desc = Description()..enabled = false;
//    controller = (
//        axisLeftSettingFunction: (axisLeft, controller) {
//          axisLeft
//            ..drawGridLines = (false)
//            ..setAxisMinimum(0);
//        },
//        axisRightSettingFunction: (axisRight, controller) {
//          axisRight
//            ..drawGridLines = (false)
//            ..setAxisMinimum(0);
//        },
//        legendSettingFunction: (legend, controller) {
//          legend
//            ..wordWrapEnabled = (true)
//            ..verticalAlignment = (LegendVerticalAlignment.BOTTOM)
//            ..horizontalAlignment = (LegendHorizontalAlignment.CENTER)
//            ..orientation = (LegendOrientation.HORIZONTAL)
//            ..drawInside = (false);
//        },
//        xAxisSettingFunction: (xAxis, controller) {
//          xAxis
//            ..position = (XAxisPosition.BOTH_SIDED)
//            ..setAxisMinimum(0)
//            ..setGranularity(1)
//            ..setValueFormatter(A())
//            ..setAxisMaximum(
//                controller.data == null ? 0 : controller.data.xMax + 0.25);
//        },
//        drawGridBackground: false,
//        drawBarShadow: false,
//        highlightFullBarEnabled: false,
//        dragXEnabled: true,
//        dragYEnabled: true,
//        scaleXEnabled: true,
//        scaleYEnabled: true,
//        pinchZoomEnabled: false,
//        maxVisibleCount: 60,
//        description: desc,
//        drawOrder: List()
//          ..add(DrawOrder.BAR)
//          ..add(DrawOrder.BUBBLE)
//          ..add(DrawOrder.CANDLE)
//          ..add(DrawOrder.LINE)
//          ..add(DrawOrder.SCATTER));
//  }

  void _initCombinedData() {
    controller.data = CombinedData();
    controller.data

      ..setData2(generateBarData())
      ..setData3(generateScatterData())
      ..setValueTypeface(Util.LIGHT);
  }

  double getRandom(double range, double start) {
    return (random.nextDouble() * range) + start;
  }

  BarData generateBarData() {
    List<BarEntry> entries1 = List();
    List<BarEntry> entries2 = List();

    for (int index = 0; index < _count; index++) {
      entries1.add(BarEntry(x: 0, y: getRandom(25, 25)));

      // stacked
      entries2.add(BarEntry.fromListYVals(
          x: 0,
          vals: List<double>()
            ..add(getRandom(13, 12))
            ..add(getRandom(13, 12))));
    }

    BarDataSet set1 = BarDataSet(entries1, "Bar 1");
    set1.setColor1(Color.fromARGB(255, 60, 220, 78));
    set1.setValueTextColor(Color.fromARGB(255, 60, 220, 78));
    set1.setValueTextSize(10);
    set1.setAxisDependency(AxisDependency.LEFT);

    BarDataSet set2 = BarDataSet(entries2, "");
    set2.setStackLabels(List<String>()..add("Stack 1")..add("Stack 2"));
    set2.setColors1(List<Color>()
      ..add(Color.fromARGB(255, 61, 165, 255))
      ..add(Color.fromARGB(255, 23, 197, 255)));
    set2.setValueTextColor(Color.fromARGB(255, 61, 165, 255));
    set2.setValueTextSize(10);
    set2.setAxisDependency(AxisDependency.LEFT);

    double groupSpace = 0.06;
    double barSpace = 0.02; // x2 dataset
    double barWidth = 0.45; // x2 dataset
    // (0.45 + 0.02) * 2 + 0.06 = 1.00 -> interval per "group"

    BarData d = BarData(List()..add(set1)..add(set2));
    d.barWidth = (barWidth);

    // make this BarData object grouped
    d.groupBars(0, groupSpace, barSpace); // start at x = 0

    return d;
  }

  ScatterData generateScatterData() {

    ScatterData d = ScatterData();

    List<Entry> entries = List();

    for (double index = 0; index < _count; index += 0.5)
      entries.add(Entry(x: index + 0.25, y: getRandom(10, 55), data: Text('a')));

    ScatterDataSet set = ScatterDataSet(entries, "Scatter DataSet");
//    set.setColors1(ColorUtils.MATERIAL_COLORS);
//    set.setScatterShapeSize(7.5);
//    set.setLabel('a');
//    set.setValueTextSize(10);
    d.addDataSet(set);

    return d;
  }


}

final List<String> months = List()
  ..add("Jan")
  ..add("Feb")
  ..add("Mar")
  ..add("Apr")
  ..add("May")
  ..add("Jun")
  ..add("Jul")
  ..add("Aug")
  ..add("Sep")
  ..add("Okt")
  ..add("Nov")
  ..add("Dec");

class A extends ValueFormatter {
  @override
  String getFormattedValue1(double value) {
    return months[value.toInt() % months.length];
  }
}
