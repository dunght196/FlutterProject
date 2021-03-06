import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mp_chart/mp/chart/scatter_chart.dart';
import 'package:mp_chart/mp/controller/scatter_chart_controller.dart';
import 'package:mp_chart/mp/core/animator.dart';
import 'package:mp_chart/mp/core/common_interfaces.dart';
import 'package:mp_chart/mp/core/data/scatter_data.dart';
import 'package:mp_chart/mp/core/data_interfaces/i_scatter_data_set.dart';
import 'package:mp_chart/mp/core/data_provider/scatter_data_provider.dart';
import 'package:mp_chart/mp/core/data_set/scatter_data_set.dart';
import 'package:mp_chart/mp/core/description.dart';
import 'package:mp_chart/mp/core/entry/entry.dart';
import 'package:mp_chart/mp/core/enums/legend_horizontal_alignment.dart';
import 'package:mp_chart/mp/core/enums/legend_orientation.dart';
import 'package:mp_chart/mp/core/enums/legend_vertical_alignment.dart';
import 'package:mp_chart/mp/core/enums/scatter_shape.dart';
import 'package:mp_chart/mp/core/highlight/highlight.dart';
import 'package:mp_chart/mp/core/image_loader.dart';
import 'package:mp_chart/mp/core/poolable/point.dart';
import 'package:mp_chart/mp/core/render/i_shape_renderer.dart';
import 'package:mp_chart/mp/core/render/scatter_chart_renderer.dart';
import 'package:mp_chart/mp/core/render/x_shape_renderer.dart';
import 'package:mp_chart/mp/core/utils/color_utils.dart';
import 'package:mp_chart/mp/core/value_formatter/default_axis_value_formatter.dart';
import 'package:mp_chart/mp/core/value_formatter/my_value_formatter.dart';
import 'package:mp_chart/mp/core/value_formatter/value_formatter.dart';
import 'package:mp_chart/mp/core/view_port.dart';
import '../action_state.dart';
import '../util.dart';

class OtherChartScatterPlot extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OtherChartScatterPlotState();
  }
}

class OtherChartScatterPlotState
    extends ScatterActionState<OtherChartScatterPlot>
    implements OnChartValueSelectedListener {
  var random = Random(1);
  int _count = 45;
  double _range = 100.0;

  @override
  void initState() {
    _initController();
    _initScatterData(_count, _range);
    super.initState();
  }

  @override
  String getTitle() => "Other Chart Scatter Plot";

  @override
  Widget getBody() {
    return Stack(
      children: <Widget>[
        Positioned(
            right: 0,
            left: 0,
            top: 0,
            bottom: 100,
            child: ScatterChart(controller)),
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
                            max: 500,
                            onChanged: (value) {
                              _count = value.toInt();
                              _initScatterData(_count, _range);
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
                              _initScatterData(_count, _range);
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

  void _initController() {
    var desc = Description()..enabled = false;
    controller = ScatterChartController(
        axisLeftSettingFunction: (axisLeft, controller) {
          axisLeft
            ..drawGridLines = (false)
            ..setAxisMinimum(-0.4)
            ..setAxisMaximum(12.4)
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
            ..setAxisMinimum(0)
            ..setAxisMaximum(7)
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
        selectionListener: this,
        description: desc);
  }

  void _initScatterData(int count, double range) async {
    List<ui.Image> imgs = List(3);
//    imgs[0] = await ImageLoader.loadImage('assets/img/star.png');
//    imgs[1] = await ImageLoader.loadImage('assets/img/add.png');
//    imgs[2] = await ImageLoader.loadImage('assets/img/star.png');

    imgs[0] = await ImageLoader.loadImage('assets/img/cloud.png');
    imgs[1] = await ImageLoader.loadImage('assets/img/sunny.png');

    List<Entry> values1 = List();
    List<Entry> values2 = List();
    List<Entry> values3 = List();
    List<Entry> values4 = List();

//    for (int i = 0; i < count; i++) {
//      double val = (random.nextDouble() * range) + 3;
//      values1.add(Entry(x: i.toDouble(), y: val, icon: imgs[0]));
//    }

    values1.add(Entry(x: 1, y: 12, icon: imgs[0]));
    values1.add(Entry(x: 2, y: 12, icon: imgs[1]));

    values1.add(Entry(x: 2, y: 11, icon: imgs[1], ));
    values1.add(Entry(x: 3, y: 10.3, icon: imgs[0]));
    values1.add(Entry(x: 2, y: 9, icon: imgs[1]));
    values1.add(Entry(x: 6, y: 8, icon: imgs[0]));
    values1.add(Entry(x: 3, y: 9, icon: imgs[1]));
    values1.add(Entry(x: 5, y: 8, icon: imgs[0]));


//    for (int i = 0; i < count; i++) {
//      double val = (random.nextDouble() * range) + 3;
//      values2.add(Entry(x: i + 0.33, y: val, icon: imgs[1]));
//    }
//
//    for (int i = 0; i < count; i++) {
//      double val = (random.nextDouble() * range) + 3;
//      values3.add(Entry(x: i + 0.66, y: val, icon: imgs[2]));
//    }

    // create a dataset and give it a type
    ScatterDataSet set1 = ScatterDataSet(values1, "DS 1");
    set1.setColor1(ColorUtils.COLORFUL_COLORS[0]);
    set1.setValueFormatter(CustomScatterShapeRenderer());
    set1.setDrawIcons(true);
    set1.setDrawValues(false);
    set1.setScatterShapeSize(0);

    ScatterDataSet set2 = ScatterDataSet(values2, "DS 2");
    set2.setColor1(ColorUtils.COLORFUL_COLORS[0]);
    set2.setValueFormatter(CustomScatterShapeRenderer());
    set2.setDrawIcons(true);
    set2.setDrawValues(false);
    set2.setScatterShapeSize(0);

    ScatterDataSet set3= ScatterDataSet(values3, "DS 3");
    set3.setColor1(ColorUtils.COLORFUL_COLORS[0]);
    set3.setValueFormatter(CustomScatterShapeRenderer());
    set3.setDrawIcons(true);
    set3.setDrawValues(false);
    set3.setScatterShapeSize(0);

    ScatterDataSet set4= ScatterDataSet(values4, "DS 4");
    set4.setColor1(ColorUtils.COLORFUL_COLORS[0]);
    set4.setValueFormatter(CustomScatterShapeRenderer());
    set4.setDrawIcons(true);
    set4.setDrawValues(false);
    set4.setScatterShapeSize(0);


    List<IScatterDataSet> dataSets = List();
    dataSets.add(set1); // add the data sets
//    dataSets.add(set2); // add the data sets
//    dataSets.add(set3);
//    dataSets.add(set4);

    // create a data object with the data sets
    controller.data = ScatterData.fromList(dataSets);
    controller.data.setValueTypeface(Util.LIGHT);

    setState(() {});
  }

  @override
  void onNothingSelected() {}

  @override
  void onValueSelected(Entry e, Highlight h) {}
}


//class CustomScatterShapeRenderer implements IShapeRenderer {
//  @override
//  void renderShape(
//      Canvas c,
//      IScatterDataSet dataSet,
//      ViewPortHandler viewPortHandler,
//      double posX,
//      double posY,
//      Paint renderPaint) {
//    final double shapeHalf = dataSet.getScatterShapeSize() / 2;
//
//    c.drawLine(Offset(posX - shapeHalf, posY - shapeHalf),
//        Offset(posX + shapeHalf, posY + shapeHalf), renderPaint);
//  }
//}

class CustomScatterShapeRenderer extends ValueFormatter {
  @override
  String getPointLabel(Entry entry) {
    return entry.mData;
  }
}
