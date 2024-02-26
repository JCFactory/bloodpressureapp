import 'package:bloodpressure/core/helpers/randomizer.dart';
import 'package:bloodpressure/features/overview/diagram_view/bar_chart.dart';
import 'package:bloodpressure/features/overview/diagram_view/fancy_pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:intl/intl.dart';

class DashboardStateView extends StatefulWidget {
  @override
  DashboardState createState() {
    return DashboardState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class DashboardState extends State<DashboardStateView> {
  final dateStr = DateFormat('dd.MM.yyyy').format(DateTime.now());
  MockClass mockclass;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        //appBar: FormViewAppBar.appBar(title: "Dashboard"),
        body: SafeArea(
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              "Dein persönliches Dashboard",
              style: TextStyle(
                  color: Colors.blue.withOpacity(0.8),
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Wrap(
                spacing: 20,
                runSpacing: 20.0,
                children: <Widget>[
                  SizedBox(
                    width: 200.0,
                    height: 200.0,
                    child: Card(
                      color: Colors.blue.withOpacity(0.8),
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.calendar_today_rounded,
                                size: 64.0, color: Colors.white),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "Nächste Kontrolle: 23.01.2020, \n08:45 Uhr, Dr. Berg",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.0),
                            ),
                          ],
                        ),
                      )),
                    ),
                  ),
                  SizedBox(
                    width: 200.0,
                    height: 200.0,
                    child: Card(
                      color: Colors.amber,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.set_meal_outlined,
                                size: 64.0, color: Colors.white),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "3 von 5 Obst/Gemüße",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0),
                            ),
                          ],
                        ),
                      )),
                    ),
                  ),
                  SizedBox(
                    width: 200.0,
                    height: 200.0,
                    child: Card(
                      color: Colors.lightGreen,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.sports_baseball_outlined,
                                size: 64.0, color: Colors.white),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "40 Min. mehr als gestern (80 Min. Spinning)",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0),
                            ),
                          ],
                        ),
                      )),
                    ),
                  ),
                  SizedBox(
                    width: 200.0,
                    height: 200.0,
                    child: Card(
                      color: Colors.lightGreen,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.show_chart,
                                size: 64.0, color: Colors.white),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "20/5 mmHg weniger als gestern",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0),
                            ),
                          ],
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              "Dein Konsumverhalten: ",
              style: TextStyle(
                  color: Colors.blue.withOpacity(0.8),
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                  child: Wrap(spacing: 20, runSpacing: 20.0, children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.80,
                  height: MediaQuery.of(context).size.height * 0.60,
                  child: Card(
                    color: Colors.white,
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    child: PieChartApp(),
                  ),
                ),
              ]))),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              "Dein Blutdruck:",
              style: TextStyle(
                  color: Colors.blue.withOpacity(0.8),
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                  child: Wrap(spacing: 20, runSpacing: 20.0, children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.80,
                  height: MediaQuery.of(context).size.height * 0.60,
                  child: Card(
                    color: Colors.white,
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                      child: Sparkline(
                          data: [-1.5, 1 - 0, 2 - 5, -1.5, 2, 5, -2.3],
                          ,
                           pointsMode: PointsMode.all,
                           pointSize: 8.0,
                           pointColor: Colors.amber,
                          // enableGridLines: true,
                          averageLine: true,
                          averageLabel: true,
                        ),
                  ),
                ),
              ]))),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              "Dein mittlerer Herzschlag:",
              style: TextStyle(
                  color: Colors.blue.withOpacity(0.8),
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                  child: Wrap(spacing: 20, runSpacing: 20.0, children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.80,
                  height: MediaQuery.of(context).size.height * 0.60,
                  child: Card(
                    color: Colors.white,
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Sparkline(
                          data: [-1.5, 1 - 0, 2 - 5, -1.5, 2, 5, -2.3],
                          ,
                           pointsMode: PointsMode.all,
                           pointSize: 8.0,
                           pointColor: Colors.amber,
                          // enableGridLines: true,
                          averageLine: true,
                          averageLabel: true,
                        ),
                  ),
                ),
              ]))),
        ],
      )),
    ));
  }

  @override
  void initState() {
    super.initState();
  }
}
