import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/data_chart_wonderweek.dart';
import 'package:mp_chart/mp/chart/bar_chart.dart';
import 'package:mp_chart/mp/chart/combined_chart.dart';
import 'package:mp_chart/mp/chart/scatter_chart.dart';
import 'package:mp_chart/mp/controller/bar_chart_controller.dart';
import 'package:mp_chart/mp/controller/combined_chart_controller.dart';
import 'package:mp_chart/mp/controller/horizontal_bar_chart_controller.dart';
import 'package:mp_chart/mp/controller/scatter_chart_controller.dart';
import 'package:mp_chart/mp/core/data/bar_data.dart';
import 'package:mp_chart/mp/core/data/combined_data.dart';
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

class BuildWonderWeek1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BuildWonderWeekState1();
  }
}

class _BuildWonderWeekState1 extends State<BuildWonderWeek1> {
  BarChartController controllerBarChart;
  CombinedChartController controllerScatterChart;

  @override
  void initState() {
    super.initState();
    _initControllerBarChart();
    _initControllerScatterChart();
    _initBarData();
//    _initScatterData();
    _initCombinedData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1100,
      margin: EdgeInsets.only(top: 10),
      child: Stack(
        children: [
          BarChart(controllerBarChart),
          CombinedChart(controllerScatterChart)
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
    controllerScatterChart = CombinedChartController(
        backgroundColor: Colors.transparent,
        axisLeftSettingFunction: (axisLeft, controller) {
          axisLeft
            ..enabled = false
            ..drawGridLines = (false)
            ..setAxisMinimum(0.6)
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

    List<Entry> marker = List();
    List<Entry> marker1 = List();
    List<Entry> marker2 = List();
    List<Entry> marker3 = List();
    List<Entry> marker4 = List();
    List<Entry> marker5 = List();
    List<Entry> marker6 = List();
    List<Entry> marker7 = List();
    List<Entry> marker8 = List();
    List<Entry> marker9 = List();
    List<Entry> marker10 = List();
    List<Entry> marker11 = List();

    marker.add(Entry(x: 5, y: 12+spaceInsertValue, icon: imgs[0]));
    marker.add(Entry(x: 6, y: 12+spaceInsertValue, icon: imgs[1]));

    marker1.add(Entry(x: 1, y: 11+spaceInsertValue, icon: imgs[0]));
    marker1.add(Entry(x: 3, y: 11+spaceInsertValue, icon: imgs[1]));
    marker1.add(Entry(x: 5, y: 11+spaceInsertValue, icon: imgs[0]));
    marker1.add(Entry(x: 6, y: 11+spaceInsertValue, icon: imgs[1]));

    marker2.add(Entry(x: 3, y: 10+spaceInsertValue, icon: imgs[0]));
    marker2.add(Entry(x: 7, y: 10+spaceInsertValue, icon: imgs[1]));

    marker3.add(Entry(x: 0, y: 9+spaceInsertValue, icon: imgs[1]));
    marker3.add(Entry(x: 5, y: 9+spaceInsertValue, icon: imgs[0]));

    marker4.add(Entry(x: 3, y: 8+spaceInsertValue, icon: imgs[1]));

    marker5.add(Entry(x: 1, y: 7+spaceInsertValue, icon: imgs[0]));
    marker5.add(Entry(x: 4, y: 7+spaceInsertValue, icon: imgs[1]));

    marker6.add(Entry(x: 2, y: 6+spaceInsertValue, icon: imgs[0]));
    marker6.add(Entry(x: 7, y: 6+spaceInsertValue, icon: imgs[1]));

    marker7.add(Entry(x: 0, y: 5+spaceInsertValue, icon: imgs[1]));
    marker7.add(Entry(x: 4, y: 5+spaceInsertValue, icon: imgs[0]));

    marker8.add(Entry(x: 2, y: 4+spaceInsertValue, icon: imgs[1]));
    marker8.add(Entry(x: 5.5, y: 4+spaceInsertValue, icon: imgs[0]));

    marker9.add(Entry(x: 3, y: 3+spaceInsertValue, icon: imgs[0]));

    marker10.add(Entry(x: 2.5, y: 2+spaceInsertValue, icon: imgs[0]));

    marker11.add(Entry(x: 2, y: 1+spaceInsertValue, icon: imgs[1]));

    values.addAll(valueWeek7);
    values1.addAll(valueWeek14);
    values2.addAll(valueWeek21);
    values3.addAll(valueWeek28);
    values4.addAll(valueWeek35);
    values5.addAll(valueWeek42);
    values6.addAll(valueWeek49);
    values7.addAll(valueWeek56);
    values8.addAll(valueWeek63);
    values9.addAll(valueWeek70);
    values10.addAll(valueWeek77);
    values11.addAll(valueWeek84);

    // create a dataset and give it a type
    ScatterDataSet set = ScatterDataSet(values, "Value Week 7");
    set.setValueFormatter(CustomScatterValue());
    set.setDrawValues(true);
    set.setDrawIcons(false);
    set.setScatterShapeSize(0);

    ScatterDataSet set1 = ScatterDataSet(values1, "Value Week 14");
    set1.setValueFormatter(CustomScatterValue());
    set1.setDrawValues(true);
    set1.setDrawIcons(false);
    set1.setScatterShapeSize(0);

    ScatterDataSet set2 = ScatterDataSet(values2, "Value Week 21");
    set2.setValueFormatter(CustomScatterValue());
    set2.setDrawValues(true);
    set2.setDrawIcons(false);
    set2.setScatterShapeSize(0);

    ScatterDataSet set3 = ScatterDataSet(values3, "Value Week 28");
    set3.setValueFormatter(CustomScatterValue());
    set3.setDrawValues(true);
    set3.setDrawIcons(false);
    set3.setScatterShapeSize(0);

    ScatterDataSet set4 = ScatterDataSet(values4, "Value Week 35");
    set4.setValueFormatter(CustomScatterValue());
    set4.setDrawValues(true);
    set4.setDrawIcons(false);
    set4.setScatterShapeSize(0);

    ScatterDataSet set5 = ScatterDataSet(values5, "Value Week 42");
    set5.setValueFormatter(CustomScatterValue());
    set5.setDrawValues(true);
    set5.setDrawIcons(false);
    set5.setScatterShapeSize(0);

    ScatterDataSet set6 = ScatterDataSet(values6, "Value Week 49");
    set6.setValueFormatter(CustomScatterValue());
    set6.setDrawValues(true);
    set6.setDrawIcons(false);
    set6.setScatterShapeSize(0);

    ScatterDataSet set7 = ScatterDataSet(values7, "Value Week 56");
    set7.setValueFormatter(CustomScatterValue());
    set7.setDrawValues(true);
    set7.setDrawIcons(false);
    set7.setScatterShapeSize(0);

    ScatterDataSet set8 = ScatterDataSet(values8, "Value Week 63");
    set8.setValueFormatter(CustomScatterValue());
    set8.setDrawValues(true);
    set8.setDrawIcons(false);
    set8.setScatterShapeSize(0);

    ScatterDataSet set9 = ScatterDataSet(values9, "Value Week 70");
    set9.setValueFormatter(CustomScatterValue());
    set9.setDrawValues(true);
    set9.setDrawIcons(false);
    set9.setScatterShapeSize(0);

    ScatterDataSet set10 = ScatterDataSet(values10, "Value Week 77");
    set10.setValueFormatter(CustomScatterValue());
    set10.setDrawValues(true);
    set10.setDrawIcons(false);
    set10.setScatterShapeSize(0);

    ScatterDataSet set11 = ScatterDataSet(values11, "Value Week 84");
    set11.setValueFormatter(CustomScatterValue());
    set11.setDrawValues(true);
    set11.setDrawIcons(false);
    set11.setScatterShapeSize(0);

    ScatterDataSet set12 = ScatterDataSet(marker, "Marker Image");
    set12.setDrawIcons(true);
    set12.setDrawValues(false);
    set12.setScatterShapeSize(0);

    ScatterDataSet set13 = ScatterDataSet(marker1, "Marker Image1");
    set13.setDrawIcons(true);
    set13.setDrawValues(false);
    set13.setScatterShapeSize(0);

    ScatterDataSet set14 = ScatterDataSet(marker2, "Marker Image2");
    set14.setDrawIcons(true);
    set14.setDrawValues(false);
    set14.setScatterShapeSize(0);

    ScatterDataSet set15 = ScatterDataSet(marker3, "Marker Image3");
    set15.setDrawIcons(true);
    set15.setDrawValues(false);
    set15.setScatterShapeSize(0);

    ScatterDataSet set16 = ScatterDataSet(marker4, "Marker Image4");
    set16.setDrawIcons(true);
    set16.setDrawValues(false);
    set16.setScatterShapeSize(0);

    ScatterDataSet set17 = ScatterDataSet(marker5, "Marker Image5");
    set17.setDrawIcons(true);
    set17.setDrawValues(false);
    set17.setScatterShapeSize(0);

    ScatterDataSet set18 = ScatterDataSet(marker6, "Marker Image6");
    set18.setDrawIcons(true);
    set18.setDrawValues(false);
    set18.setScatterShapeSize(0);

    ScatterDataSet set19 = ScatterDataSet(marker7, "Marker Image7");
    set19.setDrawIcons(true);
    set19.setDrawValues(false);
    set19.setScatterShapeSize(0);

    ScatterDataSet set20 = ScatterDataSet(marker8, "Marker Image8");
    set20.setDrawIcons(true);
    set20.setDrawValues(false);
    set20.setScatterShapeSize(0);

    ScatterDataSet set21 = ScatterDataSet(marker9, "Marker Image9");
    set21.setDrawIcons(true);
    set21.setDrawValues(false);
    set21.setScatterShapeSize(0);

    ScatterDataSet set22 = ScatterDataSet(marker10, "Marker Image10");
    set22.setDrawIcons(true);
    set22.setDrawValues(false);
    set22.setScatterShapeSize(0);

    ScatterDataSet set23 = ScatterDataSet(marker11, "Marker Image11");
    set23.setDrawIcons(true);
    set23.setDrawValues(false);
    set23.setScatterShapeSize(0);

    List<IScatterDataSet> dataSets = List();
    List<IScatterDataSet> dataSets1 = List();
    dataSets.add(set); // add the data sets
//    dataSets.add(set1); // add the data sets
    dataSets.add(set2); // add the data sets
    dataSets.add(set3); // add the data sets
    dataSets.add(set4); // add the data sets
    dataSets.add(set5); // add the data sets
    dataSets.add(set6); // add the data sets
    dataSets.add(set7); // add the data sets
    dataSets.add(set8); // add the data sets
    dataSets.add(set9); // add the data sets
    dataSets.add(set10); // add the data sets
    dataSets.add(set11); // add the data sets

//    dataSets.add(set12); // add the data sets
//    dataSets.add(set13); // add the data sets
    dataSets.add(set14); // add the data sets
    dataSets.add(set15); // add the data sets
    dataSets.add(set16); // add the data sets
    dataSets.add(set17); // add the data sets
    dataSets.add(set18); // add the data sets
    dataSets.add(set19); // add the data sets
    dataSets.add(set20); // add the data sets
    dataSets.add(set21); // add the data sets
    dataSets.add(set22); // add the data sets
    dataSets.add(set23); // add the data sets

    // create a data object with the data sets
    controllerScatterChart.data = ScatterData.fromList(dataSets);
    controllerScatterChart.data.setValueTypeface(Util.LIGHT);

    setState(() {});
  }

  void _initCombinedData() async {
    List<ui.Image> imgs = List(3);
    imgs[0] = await ImageLoader.loadImage('assets/img/cloud.png');
    imgs[1] = await ImageLoader.loadImage('assets/img/sunny.png');
    imgs[2] = await ImageLoader.loadImage('assets/img/baby.png');

    controllerScatterChart.data = CombinedData();
    controllerScatterChart.data
      ..setData3(generateScatterData(imgs[0], imgs[1]))
      ..setValueTypeface(Util.LIGHT);
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

  ScatterData generateScatterData(ui.Image img1, ui.Image img2) {
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

    List<Entry> marker = List();
    List<Entry> marker1 = List();
    List<Entry> marker2 = List();
    List<Entry> marker3 = List();
    List<Entry> marker4 = List();
    List<Entry> marker5 = List();
    List<Entry> marker6 = List();
    List<Entry> marker7 = List();
    List<Entry> marker8 = List();
    List<Entry> marker9 = List();
    List<Entry> marker10 = List();
    List<Entry> marker11 = List();

    marker.add(Entry(x: 5, y: 12+spaceInsertValue, icon: img1));
    marker.add(Entry(x: 6, y: 12+spaceInsertValue, icon: img2));

    marker1.add(Entry(x: 1, y: 11+spaceInsertValue, icon: img2));
    marker1.add(Entry(x: 3, y: 11+spaceInsertValue, icon: img1));
    marker1.add(Entry(x: 5, y: 11+spaceInsertValue, icon: img2));
    marker1.add(Entry(x: 6, y: 11+spaceInsertValue, icon: img1));

    marker10.add(Entry(x: 2.5, y: 2+spaceInsertValue, icon: img1));

    marker11.add(Entry(x: 2, y: 1+spaceInsertValue, icon: img2));

    values.addAll(valueWeek7);
    values1.addAll(valueWeek14);
    values2.addAll(valueWeek21);
    values3.addAll(valueWeek28);
    values4.addAll(valueWeek35);
    values5.addAll(valueWeek42);
    values6.addAll(valueWeek49);
    values7.addAll(valueWeek56);
    values8.addAll(valueWeek63);
    values9.addAll(valueWeek70);
    values10.addAll(valueWeek77);
    values11.addAll(valueWeek84);

    // create a dataset and give it a type
    ScatterDataSet set = ScatterDataSet(values, "Value Week 7");
    set.setValueFormatter(CustomScatterValue());
    set.setDrawValues(true);
    set.setDrawIcons(false);
    set.setScatterShapeSize(0);

    ScatterDataSet set1 = ScatterDataSet(values1, "Value Week 14");
    set1.setValueFormatter(CustomScatterValue());
    set1.setDrawValues(true);
    set1.setDrawIcons(false);
    set1.setScatterShapeSize(0);

    ScatterDataSet set10 = ScatterDataSet(values10, "Value Week 77");
    set10.setValueFormatter(CustomScatterValue());
    set10.setDrawValues(true);
    set10.setDrawIcons(false);
    set10.setScatterShapeSize(0);

    ScatterDataSet set11 = ScatterDataSet(values11, "Value Week 84");
    set11.setValueFormatter(CustomScatterValue());
    set11.setDrawValues(true);
    set11.setDrawIcons(false);
    set11.setScatterShapeSize(0);

    ScatterDataSet set12 = ScatterDataSet(marker, "Marker Image");
    set12.setDrawIcons(true);
    set12.setDrawValues(false);
    set12.setScatterShapeSize(0);

    ScatterDataSet set13 = ScatterDataSet(marker1, "Marker Image1");
    set13.setDrawIcons(true);
    set13.setDrawValues(false);
    set13.setScatterShapeSize(0);

    ScatterDataSet set22 = ScatterDataSet(marker10, "Marker Image10");
    set22.setDrawIcons(true);
    set22.setDrawValues(false);
    set22.setScatterShapeSize(0);

    ScatterDataSet set23 = ScatterDataSet(marker11, "Marker Image11");
    set23.setDrawIcons(true);
    set23.setDrawValues(false);
    set23.setScatterShapeSize(0);

    ScatterData d = ScatterData();
    d.addDataSet(set);
    d.addDataSet(set1);
    d.addDataSet(set10);
    d.addDataSet(set11);
    d.addDataSet(set12);
    d.addDataSet(set13);
    d.addDataSet(set22);
    d.addDataSet(set23);

    return d;
  }

}

class CustomScatterValue extends ValueFormatter {
  @override
  String getPointLabel(Entry entry) {
    return entry.mData;
  }
}


