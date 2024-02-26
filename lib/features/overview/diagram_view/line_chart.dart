// /// Example of timeseries chart with custom measure and domain formatters.
// import 'package:/flutter.dart' as charts;
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class CustomAxisTickFormatters extends StatelessWidget {
//   final List<charts.Series> seriesList;
//   final bool animate;

//   CustomAxisTickFormatters(this.seriesList, {this.animate});

//   /// Creates a [TimeSeriesChart] with sample data and no transition.
//   factory CustomAxisTickFormatters.withSampleData() {
//     return new CustomAxisTickFormatters(
//       createSampleData(),
//       // Disable animations for image tests.
//       animate: false,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final simpleCurrencyFormatter =
//         new charts.BasicNumericTickFormatterSpec.fromNumberFormat(
//             new NumberFormat.compact());

//     return new charts.TimeSeriesChart(seriesList,
//         behaviors: [
//           new charts.SeriesLegend(
//             position: charts.BehaviorPosition.bottom,
//             outsideJustification: charts.OutsideJustification.startDrawArea,
//             horizontalFirst: true,
//             desiredMaxRows: 2,
//             cellPadding: new EdgeInsets.only(left: 4.0, bottom: 4.0),
//           )
//         ],
//         animate: animate,
//         // Sets up a currency formatter for the measure axis.
//         primaryMeasureAxis: new charts.NumericAxisSpec(
//             tickFormatterSpec: simpleCurrencyFormatter),
//         domainAxis: new charts.DateTimeAxisSpec(
//             tickFormatterSpec: new charts.AutoDateTimeTickFormatterSpec(
//                 day: new charts.TimeFormatterSpec(
//                     format: 'd', transitionFormat: 'dd.MM.'))));
//   }

//   /// Create one series with sample hard coded data.
//   static List<charts.Series<MyRow, DateTime>> createSampleData() {
//     final systolic = [
//       new MyRow(new DateTime(2017, 9, 25), 0),
//       new MyRow(new DateTime(2017, 9, 26), 140),
//       new MyRow(new DateTime(2017, 9, 27), 150),
//       new MyRow(new DateTime(2017, 9, 28), 130),
//       new MyRow(new DateTime(2017, 9, 29), 145),
//       new MyRow(new DateTime(2017, 9, 30), 150),
//       new MyRow(new DateTime(2017, 10, 01), 120),
//     ];
//     final diastolic = [
//       new MyRow(new DateTime(2017, 9, 25), 0),
//       new MyRow(new DateTime(2017, 9, 26), 90),
//       new MyRow(new DateTime(2017, 9, 27), 80),
//       new MyRow(new DateTime(2017, 9, 28), 75),
//       new MyRow(new DateTime(2017, 9, 29), 80),
//       new MyRow(new DateTime(2017, 9, 30), 85),
//       new MyRow(new DateTime(2017, 10, 01), 75),
//     ];

//     return [
//       new charts.Series<MyRow, DateTime>(
//         id: 'Systolic',
//         domainFn: (MyRow row, _) => row.timeStamp,
//         measureFn: (MyRow row, _) => row.cost,
//         data: systolic,
//       ),
//       new charts.Series<MyRow, DateTime>(
//         id: 'Diastolic',
//         domainFn: (MyRow row, _) => row.timeStamp,
//         measureFn: (MyRow row, _) => row.cost,
//         data: diastolic,
//       )
//     ];
//   }
// }

// /// Sample time series data type.
// class MyRow {
//   final DateTime timeStamp;
//   final int cost;
//   MyRow(this.timeStamp, this.cost);
// }
