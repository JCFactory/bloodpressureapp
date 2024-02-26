import 'package:bloodpressure/core/helpers/firebase.service.dart';
import 'package:bloodpressure/model/static_data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../core/components/form_view_app_bar.dart';

class StaticDataView extends StatefulWidget {
  @override
  StaticDataViewState createState() {
    return StaticDataViewState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class StaticDataViewState extends State<StaticDataView> {
  final dateStr = DateFormat('dd.MM.yyyy').format(DateTime.now());
  FirebaseServices _firebaseServices = FirebaseServices();
  User loggedInUser;
  var staticDataList = [];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firebaseServices.streamStaticData(),
        // get data from Stream
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            StaticDataModel patientModel =
                _firebaseServices.parsingStatic(snapshot.data);
            return Scaffold(
                appBar: FormViewAppBar.appBar(
                    title: "Stammdaten", context: context),
                // Create the SelectionButton widget in the next step.
                body: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 30.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Card(
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            children: [
                              ListTile(
                                title: Text('Alter: '),
                                subtitle: Text(patientModel.age),
                              ),
                              ListTile(
                                title: Text('Größe: '),
                                subtitle: Text(patientModel.height),
                              ),
                              ListTile(
                                title: Text('Gewicht: '),
                                subtitle: Text(patientModel.weight),
                              ),
                              ListTile(
                                title: Text('Medikamente: '),
                                subtitle: Text(patientModel.medication),
                              ),
                              ListTile(
                                title: Text('Vorerkrankungen: '),
                                subtitle: Text(patientModel.illness),
                              ),
                              ListTile(
                                title: Text('Rauchen: '),
                                subtitle: Text(patientModel.smoking),
                              ),
                              ListTile(
                                title: Text('Alkohol: '),
                                subtitle: Text(patientModel.alcohol),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ));
          }
          return Container();
        });
  }

  @override
  void initState() {
    super.initState();
  }
}
