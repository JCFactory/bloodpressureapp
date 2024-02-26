import 'package:bloodpressure/core/components/form_view_app_bar.dart';
import 'package:bloodpressure/core/helpers/database_child.dart';
import 'package:bloodpressure/features/form_view/form_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
//import 'package:intl/date_symbol_data_file.dart';

class BloodpressureFormView extends StatefulWidget {
  @override
  BloodpressureFormViewState createState() {
    return BloodpressureFormViewState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class BloodpressureFormViewState extends State<BloodpressureFormView> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  //final initializedDate = initializeDateFormatting('de_DE', null);
  final dateStr = DateFormat('dd.MM.yyyy HH:MM').format(DateTime.now());
  String sys;
  String dia;
  String pulse;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
        title: Text("Messung " + dateStr),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      decoration:
                          InputDecoration(labelText: 'Systolisch (mmHg)'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Angabe erforderlich';
                        }
                        return null;
                      },
                      onChanged: (value) => sys = value,
                    ),
                    TextFormField(
                      decoration:
                          InputDecoration(labelText: 'Diastolisch (mmHg)'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Angabe erforderlich';
                        }
                        return null;
                      },
                      onChanged: (value) => dia = value,
                    ),
                    TextFormField(
                      decoration:
                          InputDecoration(labelText: 'Herzfrequenz (bpm)'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Angabe erforderlich';
                        }
                        return null;
                      },
                      onChanged: (value) => pulse = value,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            final uid = FirebaseAuth.instance.currentUser.uid;
                            await FirebaseFirestore.instance
                                .collection("${DataBaseChild.user}")
                                .doc("$uid")
                                .collection("bloodpressure")
                                .add({
                                  "timestamp": '${DateTime.now()}',
                                  "sys": sys,
                                  "dia": dia,
                                  "pulse": pulse,
                                })
                                .catchError((e) => e.toString())
                                .whenComplete(() => Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FormView())));
                          }
                        },
                        child: Text('Speichern'),
                      ),
                    ),
                  ]),
            )),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
