import 'dart:ui';
import 'package:flutterapp/wonder_week.dart';
import 'package:mp_chart/mp/core/entry/entry.dart';

abstract class DataWonderWeek {
  static final List<Color> COLORFUL_WEEK7 = List()
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorComfort)
      ..add(colorComfort);

  static final List<Color> COLORFUL_WEEK14 = List()
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

  static final List<Color> COLORFUL_WEEK21 = List()
      ..add(colorComfort)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorComfort)
      ..add(colorComfort);

  static final List<Color> COLORFUL_WEEK28 = List()
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorComfort)
      ..add(colorComfort);

  static final List<Color> COLORFUL_WEEK35  = List()
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

  static final List<Color> COLORFUL_WEEK42 = List()
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorGrumpy);

  static final List<Color> COLORFUL_WEEK49 = List()
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorComfort);

  static final List<Color> COLORFUL_WEEK56 = List()
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorComfort)
      ..add(colorComfort);

  static final List<Color> COLORFUL_WEEK63 = List()
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorGrumpy);

  static final List<Color> COLORFUL_WEEK70 = List()
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorComfort);

  static final List<Color> COLORFUL_WEEK77 = List()
      ..add(colorComfort)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorGrumpy)
      ..add(colorComfort)
      ..add(colorComfort);

  static List<Color> COLORFUL_WEEK84 = List()
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorComfort)
      ..add(colorComfort);
}

final List<double> week7data = [1, 1, 1, 1, 0.5, 0.5, 0.5, 0.5, 1];

final List<double> week14data = [0.5, 0.5, 1, 0.5, 0.5, 1, 0.5, 0.5, 0.5, 0.5, 1];

final List<double> week21data = [0.5, 0.5, 1, 1, 1, 1, 0.5, 0.5, 1];

final List<double> week28data = [1, 0.5, 0.5, 1, 1, 1, 0.5, 0.5, 1];

final List<double> week35data = [0.5, 0.5, 1, 0.5, 0.5, 1, 1, 0.5, 0.5, 1];

final List<double> week42data = [1, 1, 0.5, 0.5, 1, 1, 1, 0.5, 0.5];

final List<double> week49data = [1, 1, 1, 1, 0.5, 0.5, 1, 1];

final List<double> week56data = [1, 0.5, 0.5, 1, 1, 1, 0.5, 0.5, 1];

final List<double> week63data = [1, 1, 1, 0.5, 0.5, 1, 1, 1];

final List<double> week70data = [1, 0.5, 0.5, 1, 1, 1, 1, 1];

final List<double> week77data = [0.5, 0.5, 1, 1, 1, 1, 0.5, 0.5, 1];

final List<double> week84data = [1, 1, 1, 1, 1, 1, 1];

final List<Entry> valueWeek7 = <Entry>[
  Entry(x: 0, y: 12-spaceInsertValue, data: '0'),
  Entry(x: 1, y: 12-spaceInsertValue, data: '1'),
  Entry(x: 2, y: 12-spaceInsertValue, data: '2'),
  Entry(x: 3, y: 12-spaceInsertValue, data: '3'),
  Entry(x: 4, y: 12-spaceInsertValue, data: '4'),
  Entry(x: 5, y: 12-spaceInsertValue, data: '5'),
  Entry(x: 6, y: 12-spaceInsertValue, data: '6'),
  Entry(x: 7, y: 12-spaceInsertValue, data: '7 tuần')
];

final List<Entry> valueWeek14 = <Entry>[
  Entry(x: 0, y: 11-spaceInsertValue, data: '7'),
  Entry(x: 1, y: 11-spaceInsertValue, data: '8'),
  Entry(x: 2, y: 11-spaceInsertValue, data: '9'),
  Entry(x: 3, y: 11-spaceInsertValue, data: '10'),
  Entry(x: 4, y: 11-spaceInsertValue, data: '11'),
  Entry(x: 5, y: 11-spaceInsertValue, data: '12'),
  Entry(x: 6, y: 11-spaceInsertValue, data: '13'),
  Entry(x: 7, y: 11-spaceInsertValue, data: '14 tuần')
];

final List<Entry> valueWeek21 = <Entry>[
  Entry(x: 0, y: 10-spaceInsertValue, data: '14'),
  Entry(x: 1, y: 10-spaceInsertValue, data: '15'),
  Entry(x: 2, y: 10-spaceInsertValue, data: '16'),
  Entry(x: 3, y: 10-spaceInsertValue, data: '17'),
  Entry(x: 4, y: 10-spaceInsertValue, data: '18'),
  Entry(x: 5, y: 10-spaceInsertValue, data: '19'),
  Entry(x: 6, y: 10-spaceInsertValue, data: '20'),
  Entry(x: 7, y: 10-spaceInsertValue, data: '21 tuần')
];

final List<Entry> valueWeek28 = <Entry>[
  Entry(x: 0, y: 9-spaceInsertValue, data: '21'),
  Entry(x: 1, y: 9-spaceInsertValue, data: '22'),
  Entry(x: 2, y: 9-spaceInsertValue, data: '23'),
  Entry(x: 3, y: 9-spaceInsertValue, data: '24'),
  Entry(x: 4, y: 9-spaceInsertValue, data: '25'),
  Entry(x: 5, y: 9-spaceInsertValue, data: '26'),
  Entry(x: 6, y: 9-spaceInsertValue, data: '27'),
  Entry(x: 7, y: 9-spaceInsertValue, data: '28 tuần')
];

final List<Entry> valueWeek35 = <Entry>[
  Entry(x: 0, y: 8-spaceInsertValue, data: '28'),
  Entry(x: 1, y: 8-spaceInsertValue, data: '29'),
  Entry(x: 2, y: 8-spaceInsertValue, data: '30'),
  Entry(x: 3, y: 8-spaceInsertValue, data: '31'),
  Entry(x: 4, y: 8-spaceInsertValue, data: '32'),
  Entry(x: 5, y: 8-spaceInsertValue, data: '33'),
  Entry(x: 6, y: 8-spaceInsertValue, data: '34'),
  Entry(x: 7, y: 8-spaceInsertValue, data: '35 tuần')
];

final List<Entry> valueWeek42 = <Entry>[
  Entry(x: 0, y: 7-spaceInsertValue, data: '35'),
  Entry(x: 1, y: 7-spaceInsertValue, data: '36'),
  Entry(x: 2, y: 7-spaceInsertValue, data: '37'),
  Entry(x: 3, y: 7-spaceInsertValue, data: '38'),
  Entry(x: 4, y: 7-spaceInsertValue, data: '39'),
  Entry(x: 5, y: 7-spaceInsertValue, data: '40'),
  Entry(x: 6, y: 7-spaceInsertValue, data: '41'),
  Entry(x: 7, y: 7-spaceInsertValue, data: '42 tuần')
];

final List<Entry> valueWeek49 = <Entry>[
  Entry(x: 0, y: 6-spaceInsertValue, data: '42'),
  Entry(x: 1, y: 6-spaceInsertValue, data: '43'),
  Entry(x: 2, y: 6-spaceInsertValue, data: '44'),
  Entry(x: 3, y: 6-spaceInsertValue, data: '45'),
  Entry(x: 4, y: 6-spaceInsertValue, data: '46'),
  Entry(x: 5, y: 6-spaceInsertValue, data: '47'),
  Entry(x: 6, y: 6-spaceInsertValue, data: '48'),
  Entry(x: 7, y: 6-spaceInsertValue, data: '49 tuần')
];

final List<Entry> valueWeek56 = <Entry>[
  Entry(x: 0, y: 5-spaceInsertValue, data: '49'),
  Entry(x: 1, y: 5-spaceInsertValue, data: '50'),
  Entry(x: 2, y: 5-spaceInsertValue, data: '51'),
  Entry(x: 3, y: 5-spaceInsertValue, data: '52'),
  Entry(x: 4, y: 5-spaceInsertValue, data: '53'),
  Entry(x: 5, y: 5-spaceInsertValue, data: '54'),
  Entry(x: 6, y: 5-spaceInsertValue, data: '55'),
  Entry(x: 7, y: 5-spaceInsertValue, data: '56 tuần')
];

final List<Entry> valueWeek63 = <Entry>[
  Entry(x: 0, y: 4-spaceInsertValue, data: '56'),
  Entry(x: 1, y: 4-spaceInsertValue, data: '57'),
  Entry(x: 2, y: 4-spaceInsertValue, data: '58'),
  Entry(x: 3, y: 4-spaceInsertValue, data: '59'),
  Entry(x: 4, y: 4-spaceInsertValue, data: '60'),
  Entry(x: 5, y: 4-spaceInsertValue, data: '61'),
  Entry(x: 6, y: 4-spaceInsertValue, data: '61'),
  Entry(x: 7, y: 4-spaceInsertValue, data: '63 tuần')
];

final List<Entry> valueWeek70 = <Entry>[
  Entry(x: 0, y: 3-spaceInsertValue, data: '63'),
  Entry(x: 1, y: 3-spaceInsertValue, data: '64'),
  Entry(x: 2, y: 3-spaceInsertValue, data: '65'),
  Entry(x: 3, y: 3-spaceInsertValue, data: '66'),
  Entry(x: 4, y: 3-spaceInsertValue, data: '67'),
  Entry(x: 5, y: 3-spaceInsertValue, data: '68'),
  Entry(x: 6, y: 3-spaceInsertValue, data: '69'),
  Entry(x: 7, y: 3-spaceInsertValue, data: '70 tuần')
];

final List<Entry> valueWeek77 = <Entry>[
  Entry(x: 0, y: 2-spaceInsertValue, data: '70'),
  Entry(x: 1, y: 2-spaceInsertValue, data: '71'),
  Entry(x: 2, y: 2-spaceInsertValue, data: '72'),
  Entry(x: 3, y: 2-spaceInsertValue, data: '73'),
  Entry(x: 4, y: 2-spaceInsertValue, data: '74'),
  Entry(x: 5, y: 2-spaceInsertValue, data: '75'),
  Entry(x: 6, y: 2-spaceInsertValue, data: '76'),
  Entry(x: 7, y: 2-spaceInsertValue, data: '77 tuần')
];

final List<Entry> valueWeek84 = <Entry>[
  Entry(x: 0, y: 1-spaceInsertValue, data: '77'),
  Entry(x: 1, y: 1-spaceInsertValue, data: '78'),
  Entry(x: 2, y: 1-spaceInsertValue, data: '79'),
  Entry(x: 3, y: 1-spaceInsertValue, data: '80'),
  Entry(x: 4, y: 1-spaceInsertValue, data: '81'),
  Entry(x: 5, y: 1-spaceInsertValue, data: '82'),
  Entry(x: 6, y: 1-spaceInsertValue, data: '83'),
  Entry(x: 7, y: 1-spaceInsertValue, data: '84 tuần')
];
