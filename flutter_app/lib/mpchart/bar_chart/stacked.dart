import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mp_chart/mp/chart/bar_chart.dart';
import 'package:mp_chart/mp/controller/bar_chart_controller.dart';
import 'package:mp_chart/mp/controller/horizontal_bar_chart_controller.dart';
import 'package:mp_chart/mp/core/common_interfaces.dart';
import 'package:mp_chart/mp/core/data/bar_data.dart';
import 'package:mp_chart/mp/core/data_interfaces/i_bar_data_set.dart';
import 'package:mp_chart/mp/core/data_set/bar_data_set.dart';
import 'package:mp_chart/mp/core/description.dart';
import 'package:mp_chart/mp/core/entry/bar_entry.dart';
import 'package:mp_chart/mp/core/entry/entry.dart';
import 'package:mp_chart/mp/core/enums/legend_form.dart';
import 'package:mp_chart/mp/core/enums/legend_horizontal_alignment.dart';
import 'package:mp_chart/mp/core/enums/legend_orientation.dart';
import 'package:mp_chart/mp/core/enums/legend_vertical_alignment.dart';
import 'package:mp_chart/mp/core/enums/x_axis_position.dart';
import 'package:mp_chart/mp/core/highlight/highlight.dart';
import 'package:mp_chart/mp/core/image_loader.dart';
import 'package:mp_chart/mp/core/utils/color_utils.dart';
import 'package:mp_chart/mp/core/value_formatter/my_value_formatter.dart';
import 'package:mp_chart/mp/core/value_formatter/stacked_value_formatter.dart';
import '../action_state.dart';
import '../util.dart';

class BarChartStacked extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BarChartStackedState();
  }
}

class BarChartStackedState extends BarActionState<BarChartStacked>
    implements OnChartValueSelectedListener {
  var random = Random(1);
  int _count = 12;
  double _range = 100.0;

  @override
  void initState() {
    _initController();
    _initBarData(_count, _range);
    super.initState();
  }

  @override
  String getTitle() => "Bar Chart Stacked";

  @override
  Widget getBody() {
    return Stack(
      children: <Widget>[
        Positioned(
          right: 0,
          left: 0,
          top: 0,
          bottom: 100,
          child: BarChart(controller),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Center(
                        child: Slider(
                            value: _count.toDouble(),
                            min: 0,
                            max: 1500,
                            onChanged: (value) {
                              _count = value.toInt();
                              _initBarData(_count, _range);
                            })),
                  ),
                  Container(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Text(
                        "$_count",
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: ColorUtils.BLACK,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Center(
                        child: Slider(
                            value: _range,
                            min: 0,
                            max: 200,
                            onChanged: (value) {
                              _range = value;
                              _initBarData(_count, _range);
                            })),
                  ),
                  Container(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Text(
                        "${_range.toInt()}",
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: ColorUtils.BLACK,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  void _initBarData(int count, double range) async {
    var img = await ImageLoader.loadImage('assets/img/star.png');
    List<BarEntry> values = List();
    List<BarEntry> values1 = List();

/*    for (int i = 0; i < count; i++) {
      double mul = (range + 1);
      double val1 = (random.nextDouble() * mul) + mul / 3;
      double val2 = (random.nextDouble() * mul) + mul / 3;
      double val3 = (random.nextDouble() * mul) + mul / 3;

      values.add(BarEntry.fromListYVals(
          x: i.toDouble(),
          vals: List()..add(val1)..add(val2)..add(val3),
          icon: img));
    }*/


    var val1 = BarEntry(x: 1, y: 10);
    var val2 = BarEntry(x: 1, y: 20);
    var val3 = BarEntry(x: 1, y: 30);

    values.add(BarEntry.fromListYVals(
      x: 1,
      vals: List()..add(1)..add(1)..add(1)..add(1),
    ));

    values1.add(BarEntry.fromListYVals(
      x: 2,
      vals: List()..add(1)..add(1)..add(1),
    ));

//    values.add(val1);
//    values.add(val2);
//    values.add(val3);

    BarDataSet set1;
    BarDataSet set2;

    set1 = BarDataSet(values, "Statistics Vienna 2014");
    set1.setDrawIcons(false);
    set1.setColors1(_getColors());

    set2 = BarDataSet(values1, "Statistics Vienna 2014");
    set2.setDrawIcons(false);
    set2.setColors1(_getColors1());

    List<IBarDataSet> dataSets = List();
    dataSets.add(set1);
    dataSets.add(set2);

    controller.data = BarData(dataSets);
    controller.data
      ..setValueFormatter(StackedValueFormatter(false, "", 1))
      ..setValueTextColor(ColorUtils.WHITE);

    setState(() {}
    );
  }

  List<Color> _getColors() {
    return List()
      ..add(ColorUtils.MATERIAL_COLORS[0])
      ..add(ColorUtils.MATERIAL_COLORS[1])
      ..add(ColorUtils.MATERIAL_COLORS[2])
      ..add(ColorUtils.MATERIAL_COLORS[3]);
  }

  List<Color> _getColors1() {
    return List()
      ..add(Colors.grey)
      ..add(Colors.blue)
      ..add(Colors.pink);
  }

  void _initController() {
    var desc = Description()..enabled = false;
    controller = HorizontalBarChartController(
        axisLeftSettingFunction: (axisLeft, controller) {
          axisLeft
//            ..setValueFormatter(MyValueFormatter("K"))
            ..drawGridLines = false
            ..setAxisMinimum(0)
            ..setAxisMaximum(7);
        },
        axisRightSettingFunction: (axisRight, controller) {
          axisRight.enabled = (false);
        },
        legendSettingFunction: (legend, controller) {
          legend
            ..enabled = false
            ..verticalAlignment = (LegendVerticalAlignment.BOTTOM)
            ..horizontalAlignment = (LegendHorizontalAlignment.RIGHT)
            ..orientation = (LegendOrientation.HORIZONTAL)
            ..drawInside = (false)
            ..shape = (LegendForm.SQUARE)
            ..formSize = (8)
            ..formToTextSpace = (4)
            ..xEntrySpace = (6);
        },
        xAxisSettingFunction: (xAxis, controller) {
          xAxis.drawGridLines = false;
          xAxis.position = (XAxisPosition.TOP);
          xAxis.setAxisMaximum(12);
          xAxis.setAxisMinimum(0);
        },
//        drawGridBackground: false,
//        dragXEnabled: true,
//        dragYEnabled: true,
//        scaleXEnabled: true,
//        scaleYEnabled: true,
//        pinchZoomEnabled: false,
//        maxVisibleCount: 60,
//        fitBars: true,
//        selectionListener: this,
//        drawBarShadow: false,
//        highlightFullBarEnabled: false,
//        drawValueAboveBar: false,
        description: desc);
  }

  @override
  void onNothingSelected() {}

  @override
  void onValueSelected(Entry e, Highlight h) {}
}
