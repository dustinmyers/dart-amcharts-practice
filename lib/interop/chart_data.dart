@JS()
library chartData;

import 'package:js/js.dart';

@JS()
@anonymous
class VisitsData {
  external factory VisitsData({String date, int visits});

  external String get date;
  external set date(String v);

  external num get visits;
  external set visits(num v);
}