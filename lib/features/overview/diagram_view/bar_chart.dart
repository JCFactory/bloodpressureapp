// import 'package:bloodpressure/core/helpers/randomizer.dart';
// /// Spark Bar Example
// import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;

// import 'package:flutter/material.dart';
// import 'package:chart_sparkline/chart_sparkline.dart';


// /// Example of a Spark Bar by hiding both axis, reducing the chart margins.
// class SparkBar extends StatelessWidget {
//   final List<charts.Series> seriesList;
//   final bool animate;

//   SparkBar(this.seriesList, {this.animate});

//   /// Create series list with single series
//   static List<charts.Series<OrdinalSales, String>> createSampleData() {
//     final globalSalesData = [
//       new OrdinalSales('Sa', 45),
//       new OrdinalSales('So', 60),
//       new OrdinalSales('Mo', 70),
//       new OrdinalSales('Di', 75),
//       new OrdinalSales('Mi', 80),
//       new OrdinalSales('Do', 70),
//     ];

//     return [
//       new charts.Series<OrdinalSales, String>(
//         id: 'Herzschlag',
//         domainFn: (OrdinalSales sales, _) => sales.year,
//         measureFn: (OrdinalSales sales, _) => sales.sales,
//         data: globalSalesData,
//           labelAccessorFn: (String, _) => 'Systolisch',

//       ),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     final staticTicks = <charts.TickSpec<String>>[
//       new charts.TickSpec(
//           'Do',
//           label: 'Heute',
//           style: new charts.TextStyleSpec(
//               color: new charts.Color(r:33,g:150,b:243))),
//       new charts.TickSpec('Sa'),
//       new charts.TickSpec('So'),
//       new charts.TickSpec('Mo'),
//       new charts.TickSpec('Di'),
//       new charts.TickSpec('Mi'),
//       new charts.TickSpec('Heute'),
//     ];
//     return new charts.BarChart(
//       seriesList,
//       animate: animate,
//       domainAxis: new charts.OrdinalAxisSpec(
//           tickProviderSpec:
//           new charts.StaticOrdinalTickProviderSpec(staticTicks)),
//     );

//   }

// }

