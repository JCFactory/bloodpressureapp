import 'package:bloodpressure/features/overview/bloodpressure.dart';
import 'package:bloodpressure/features/overview/consumption.dart';
import 'package:bloodpressure/features/overview/sport.dart';
import 'package:bloodpressure/features/overview/staticdata_view.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OverviewStateView extends StatefulWidget {
  @override
  OverviewState createState() {
    return OverviewState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class OverviewState extends State<OverviewStateView> {
  final dateStr = DateFormat('dd.MM.yyyy').format(DateTime.now());
  final _auth = FirebaseAuth.instance;
  firebase_auth.User loggedInUser = firebase_auth.FirebaseAuth.instance.currentUser;

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        // appBar: FormViewAppBar.appBar(title: "Meine Daten"),
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
              child: Text(
                "Daten-Übersicht",
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
                          child: new InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => StaticDataView()));
                            },
                            child: Container(
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.all(40.0),
                                child: Column(
                                  children: <Widget>[
                                    Icon(Icons.person,
                                        size: 64.0, color: Colors.white),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      "Stammdaten",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0),
                                    ),
                                  ],
                                ),
                              )),
                            ),
                          )),
                    ),
                    SizedBox(
                      width: 200.0,
                      height: 200.0,
                      child: Card(
                          color: Colors.blue.withOpacity(0.8),
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          child: new InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => BloodPressureView()));
                            },
                            child: Container(
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.all(40.0),
                                child: Column(
                                  children: <Widget>[
                                    Icon(Icons.show_chart,
                                        size: 64.0, color: Colors.white),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      "Messungen",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0),
                                    ),
                                  ],
                                ),
                              )),
                            ),
                          )),
                    ),
                    SizedBox(
                      width: 200.0,
                      height: 200.0,
                      child: Card(
                          color: Colors.blue.withOpacity(0.8),
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          child: new InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SportView()));
                            },
                            child: Container(
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.all(40.0),
                                child: Column(
                                  children: <Widget>[
                                    Icon(Icons.sports_baseball_outlined,
                                        size: 64.0, color: Colors.white),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      "Sport",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0),
                                    ),
                                  ],
                                ),
                              )),
                            ),
                          )),
                    ),
                    SizedBox(
                      width: 200.0,
                      height: 200.0,
                      child: Card(
                          color: Colors.blue.withOpacity(0.8),
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          child: new InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ConsumptionView()));
                            },
                            child: Container(
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
                                      "Konsum",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0),
                                    ),
                                  ],
                                ),
                              )),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ]),
    )));
  }

  @override
  void initState() {
    super.initState();
  }
}
