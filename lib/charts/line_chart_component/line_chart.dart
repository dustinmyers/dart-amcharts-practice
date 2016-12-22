import 'dart:math';
import 'package:angular2/core.dart';
import 'package:amcharts/amcharts.dart';
import 'package:dart_amcharts_practice/interop/chart_data.dart';
import 'package:intl/intl.dart';

@Component(
    selector: 'line-chart',
    encapsulation: ViewEncapsulation.Native,
    templateUrl: 'line_chart.html'
)
class LineChart implements AfterViewInit {

  @ViewChild('chartView') ElementRef chartView;

  ngAfterViewInit() {
    AmBalloon balloon = new AmBalloon()..drop = true;

    AmSerialChart chart = new AmSerialChart()
      ..dataProvider = generateChartData()
      ..categoryField = "date"
      ..angle = 30
      ..depth3D = 15;

    chart.valueAxes.add(
        new ValueAxis()
          ..axisAlpha = 0.2
          ..dashLength = 1
          ..position = "left"
    );

    AmGraph graph = new AmGraph()
      ..valueField = 'visits'
      ..type = 'line'

      ..balloonText = "[[value]]"
      ..bullet = "round"
      ..bulletBorderAlpha = 1
      ..bulletColor = "#FFFFFF"
      ..hideBulletsCount = 50
      ..title = "red line"
      ..useLineColorForBulletBorder = true
      ..balloon = balloon;

    chart.addGraph(graph);

    chart.categoryAxis
      ..autoGridCount = false
      ..gridCount = 30
      ..gridPosition = 'start'
      ..labelRotation = 90
//      ..parseDates = true // BREAKS CHART RENDERING IN IE11 & EDGE (AND PROBABLY OLDER VERSIONS OF IE)
      ..axisColor = "#DADADA"
      ..dashLength = 1
      ..minorGridEnabled = true;

    chart.chartCursor = new ChartCursor()
      ..cursorPosition = "middle"
      ..limitToGraph = graph;

    chart.chartScrollbar = new ChartScrollbar()
      ..autoGridCount = true
      ..graph = graph
      ..scrollbarHeight = 40;

    chart.export = new ExportOptions()
      ..enabled = true
      ..dateFormat = "YYYY-MM-DD HH:NN:SS";

    chart
      ..categoryField = "date"
      ..mouseWheelZoomEnabled = true
      ..theme = "light"
      ..marginRight = 80
      ..autoMarginOffset = 20
      ..marginTop = 7;

    chart.write(chartView.nativeElement);

    chart.zoomToIndexes(20, 29);
  }

  List generateChartData() {
    Random r = new Random();


    List chartData = [];
    DateTime firstDate = new DateTime.now();
    var formatter = new DateFormat('MMM dd');
    firstDate = firstDate.subtract(new Duration(days: 5));

    for (var i = 0; i < 30; i++) {
      DateTime newDate = firstDate.add(new Duration(days: i));
      String formatted = formatter.format(newDate);

      int visits = (r.nextDouble() * (40 + i / 5)).round() + 20 + i;

      chartData.add(new VisitsData(date: formatted, visits: visits));
    }

    return chartData;
  }
}