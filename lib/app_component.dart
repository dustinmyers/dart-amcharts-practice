// Copyright (c) 2016, Dustin Myers. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/core.dart';
import 'package:dart_amcharts_practice/charts/line_chart_component/line_chart.dart';


@Component(
  selector: 'my-app',
  styleUrls: const ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: const [LineChart]
)
class AppComponent {

}
