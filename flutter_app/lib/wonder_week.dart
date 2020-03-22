import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/data_chart_wonderweek.dart';
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
import 'dart:ui' as ui;
import 'package:mp_chart/mp/core/value_formatter/value_formatter.dart';
import 'mpchart/util.dart';

final double widthBorderChart = 1;
final double heightMarkerBaby = 15;
final double widthMarkerBaby = 12;
final double widthItemChart = 0.26;
final double spaceInsertValue = 0.3;

final Color colorBorder = Colors.grey[400];
final Color colorGrumpy = Colors.grey[350];
final Color colorPettish = Colors.pink[50];
final Color colorComfort = Colors.transparent;

class BuildWonderWeek extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BuildWonderWeekState();
  }
}

class _BuildWonderWeekState extends State<BuildWonderWeek> {
  BarChartController controllerBarChart;
  ScatterChartController controllerScatterChart;

  @override
  void initState() {
    super.initState();
    _initControllerBarChart();
    _initControllerScatterChart();
    _initBarData();
    _initScatterData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1100,
      child: Stack(
        children: [
          BarChart(controllerBarChart),
          ScatterChart(controllerScatterChart)
        ],
      ),
    );
  }

  void _initControllerBarChart() {
    var desc = Description()..enabled = false;
    controllerBarChart = HorizontalBarChartController(
        backgroundColor: Colors.transparent,
        axisLeftSettingFunction: (axisLeft, controller) {
          axisLeft
            ..enabled = false
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
          xAxis.enabled = false;
          xAxis.setAxisMaximum(12.4);
          xAxis.setAxisMinimum(0.6);
        },
        drawGridBackground: false,
        description: desc);
  }

  void _initControllerScatterChart() {
    var desc = Description()..enabled = false;
    controllerScatterChart = ScatterChartController(
        backgroundColor: Colors.transparent,
        axisLeftSettingFunction: (axisLeft, controller) {
          axisLeft
            ..enabled = false
            ..drawGridLines = (false)
            ..setAxisMinimum(0.6)
            ..setAxisMaximum(12.4);
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
            ..enabled = false
            ..drawGridLines = (false)
            ..setAxisMinimum(0)
            ..setAxisMaximum(7)
            ..typeface = Util.LIGHT;
        },
        drawGridBackground: false,
        description: desc);
  }


  void _initBarData() {
    List<BarEntry> values = List();
    List<BarEntry> values1 = List();
    List<BarEntry> values2 = List();
    List<BarEntry> values3 = List();
    List<BarEntry> values4 = List();
    List<BarEntry> values5 = List();
    List<BarEntry> values6 = List();
    List<BarEntry> values7 = List();
    List<BarEntry> values8 = List();
    List<BarEntry> values9 = List();
    List<BarEntry> values10 = List();
    List<BarEntry> values11 = List();

    values.add(BarEntry.fromListYVals(
      x: 12,
      vals: week7data,
    ));

    values1.add(BarEntry.fromListYVals(
      x: 11,
      vals: week14data,
    ));

    values2.add(BarEntry.fromListYVals(
      x: 10,
      vals: week21data,
    ));

    values3.add(BarEntry.fromListYVals(
      x: 9,
      vals: week28data,
    ));

    values4.add(BarEntry.fromListYVals(
      x: 8,
      vals: week35data,
    ));

    values5.add(BarEntry.fromListYVals(
      x: 7,
      vals: week42data,
    ));

    values6.add(BarEntry.fromListYVals(
      x: 6,
      vals: week49data,
    ));

    values7.add(BarEntry.fromListYVals(
      x: 5,
      vals: week56data,
    ));

    values8.add(BarEntry.fromListYVals(
      x: 4,
      vals: week63data,
    ));

    values9.add(BarEntry.fromListYVals(
      x: 3,
      vals: week70data,
    ));

    values10.add(BarEntry.fromListYVals(
      x: 2,
      vals: week77data,
    ));

    values11.add(BarEntry.fromListYVals(
      x: 1,
      vals: week84data,
    ));

    BarDataSet set;
    BarDataSet set1;
    BarDataSet set2;
    BarDataSet set3;
    BarDataSet set4;
    BarDataSet set5;
    BarDataSet set6;
    BarDataSet set7;
    BarDataSet set8;
    BarDataSet set9;
    BarDataSet set10;
    BarDataSet set11;

    set = BarDataSet(values, "Week7");
    set.setDrawIcons(false);
    set.setBarBorderColor(colorBorder);
    set.setBarBorderWidth(widthBorderChart);
    set.setColors1(_getColorsWeek7());
    set.setDrawValues(false);

    set1 = BarDataSet(values1, "Week14");
    set1.setDrawIcons(false);
    set1.setBarBorderColor(colorBorder);
    set1.setBarBorderWidth(widthBorderChart);
    set1.setColors1(_getColorsWeek14());
    set1.setDrawValues(false);

    set2 = BarDataSet(values2, "Week21");
    set2.setDrawIcons(false);
    set2.setBarBorderColor(colorBorder);
    set2.setBarBorderWidth(widthBorderChart);
    set2.setColors1(_getColorsWeek21());
    set2.setDrawValues(false);

    set3 = BarDataSet(values3, "Week28");
    set3.setDrawIcons(false);
    set3.setBarBorderColor(colorBorder);
    set3.setBarBorderWidth(widthBorderChart);
    set3.setColors1(_getColorsWeek28());
    set3.setDrawValues(false);

    set4 = BarDataSet(values4, "Week35");
    set4.setDrawIcons(false);
    set4.setBarBorderColor(colorBorder);
    set4.setBarBorderWidth(widthBorderChart);
    set4.setColors1(_getColorsWeek35());
    set4.setDrawValues(false);

    set5 = BarDataSet(values5, "Week42");
    set5.setDrawIcons(false);
    set5.setBarBorderColor(colorBorder);
    set5.setBarBorderWidth(widthBorderChart);
    set5.setColors1(_getColorsWeek42());
    set5.setDrawValues(false);

    set6 = BarDataSet(values6, "Week49");
    set6.setDrawIcons(false);
    set6.setBarBorderColor(colorBorder);
    set6.setBarBorderWidth(widthBorderChart);
    set6.setColors1(_getColorsWeek49());
    set6.setDrawValues(false);

    set7 = BarDataSet(values7, "Week56");
    set7.setDrawIcons(false);
    set7.setBarBorderColor(colorBorder);
    set7.setBarBorderWidth(widthBorderChart);
    set7.setColors1(_getColorsWeek56());
    set7.setDrawValues(false);

    set8 = BarDataSet(values8, "Week63");
    set8.setDrawIcons(false);
    set8.setBarBorderColor(colorBorder);
    set8.setBarBorderWidth(widthBorderChart);
    set8.setColors1(_getColorsWeek63());
    set8.setDrawValues(false);

    set9 = BarDataSet(values9, "Week70");
    set9.setDrawIcons(false);
    set9.setBarBorderColor(colorBorder);
    set9.setBarBorderWidth(widthBorderChart);
    set9.setColors1(_getColorsWeek70());
    set9.setDrawValues(false);

    set10 = BarDataSet(values10, "Week77");
    set10.setDrawIcons(false);
    set10.setBarBorderColor(colorBorder);
    set10.setBarBorderWidth(widthBorderChart);
    set10.setColors1(_getColorsWeek77());
    set10.setDrawValues(false);

    set11 = BarDataSet(values11, "Week84");
    set11.setDrawIcons(false);
    set11.setBarBorderColor(colorBorder);
    set11.setBarBorderWidth(widthBorderChart);
    set11.setColors1(_getColorsWeek84());
    set11.setDrawValues(false);

    List<IBarDataSet> dataSets = List();
    dataSets.add(set);
    dataSets.add(set1);
    dataSets.add(set2);
    dataSets.add(set3);
    dataSets.add(set4);
    dataSets.add(set5);
    dataSets.add(set6);
    dataSets.add(set7);
    dataSets.add(set8);
    dataSets.add(set9);
    dataSets.add(set10);
    dataSets.add(set11);

    BarData d = BarData(dataSets);
    d.barWidth = 0.25;

    controllerBarChart.data = d;

    setState(() {});
  }

  void _initScatterData() async {
    List<ui.Image> imgs = List(3);
    imgs[0] = await ImageLoader.loadImage('assets/img/cloud.png');
    imgs[1] = await ImageLoader.loadImage('assets/img/sunny.png');
    imgs[2] = await ImageLoader.loadImage('assets/img/baby.png');

    List<Entry> values = List();
    List<Entry> values1 = List();
    List<Entry> values2 = List();
    List<Entry> values3 = List();
    List<Entry> values4 = List();
    List<Entry> values5 = List();
    List<Entry> values6 = List();
    List<Entry> values7 = List();
    List<Entry> values8 = List();
    List<Entry> values9 = List();
    List<Entry> values10 = List();
    List<Entry> values11 = List();

    values.addAll(valueWeek7);

    values1.add(Entry(x: 0, y: 12.3, icon: imgs[1]));

    // create a dataset and give it a type
    ScatterDataSet set1 = ScatterDataSet(values, "Value");
    set1.setValueFormatter(CustomScatterValue());
    set1.setDrawIcons(false);
    set1.setScatterShapeSize(0);

    ScatterDataSet set2 = ScatterDataSet(values1, "Icon");
    set2.setDrawIcons(true);
    set2.setDrawValues(false);
    set2.setFormSize(20);
    set2.setScatterShapeSize(0);

    List<IScatterDataSet> dataSets = List();
    dataSets.add(set1); // add the data sets
    dataSets.add(set2); // add the data sets

    // create a data object with the data sets
    controllerScatterChart.data = ScatterData.fromList(dataSets);
    controllerScatterChart.data.setValueTypeface(Util.LIGHT);

    setState(() {});
  }

  List<Color> _getColorsWeek7() {
    return List()
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorComfort)
      ..add(colorComfort);
  }

  List<Color> _getColorsWeek14() {
    return List()
      ..add(colorComfort)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorComfort)
      ..add(colorComfort);
  }

  List<Color> _getColorsWeek21() {
    return List()
      ..add(colorComfort)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorComfort)
      ..add(colorComfort);
  }

  List<Color> _getColorsWeek28() {
    return List()
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorComfort)
      ..add(colorComfort);
  }

  List<Color> _getColorsWeek35() {
    return List()
      ..add(colorComfort)
      ..add(colorPettish)
      ..add(colorPettish)
      ..add(colorPettish)
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorGrumpy)
      ..add(colorGrumpy);
  }

  List<Color> _getColorsWeek42() {
    return List()
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorGrumpy);
  }

  List<Color> _getColorsWeek49() {
    return List()
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorComfort);
  }

  List<Color> _getColorsWeek56() {
    return List()
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorComfort)
      ..add(colorComfort);
  }

  List<Color> _getColorsWeek63() {
    return List()
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorGrumpy);
  }

  List<Color> _getColorsWeek70() {
    return List()
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorComfort);
  }

  List<Color> _getColorsWeek77() {
    return List()
      ..add(colorComfort)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorComfort)
      ..add(colorComfort);
  }

  List<Color> _getColorsWeek84() {
    return List()
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorComfort);
  }

}

class CustomScatterValue extends ValueFormatter {
  @override
  String getPointLabel(Entry entry) {
    return entry.mData;
  }
}


