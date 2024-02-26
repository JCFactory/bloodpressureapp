import 'package:bloodpressure/core/helpers/database_child.dart';
import 'package:bloodpressure/features/form_view/form_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SportFormView extends StatefulWidget {
  @override
  SportFormViewState createState() {
    return SportFormViewState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class SportFormViewState extends State<SportFormView> {
  final _formKey = GlobalKey<FormState>();
  String dropdownValue = 'Ausdauer';
  String dropdownTimeValue = '0 Min';
  String distance = '';

  // DateSingleton dateSingleton = new DateSingleton();
  final dateStr = DateFormat('dd.MM.yyyy').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
        title: Text("Tägliche Bewegung/Sport"),
        actions: [
          IconButton(
              color: Colors.white,
              icon: Icon(Icons.info_outline),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Empfohlene Bewegung'),
                      content: Text(
                          'Experten empfehlen an 5 von 7 Tagen in der Woche jeweils eine Bewegungseinheit (z.B. Spazieren gehen, '
                          'Fahrrad fahren, Joggen gehen) von mindestens 30 Minuten durchzuführen.'),
                      actions: <Widget>[
                        ElevatedButton(
                            style: TextButton.styleFrom(
                              minimumSize: Size(88, 44),
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2.0)),
                              ),
                              backgroundColor: Colors.blue,
                            ),
                            child: Text('OK.'),
                            onPressed: () {
                              // Hier passiert etwas
                              Navigator.of(context).pop();
                            })
                      ],
                    );
                  },
                );
              }),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Hier bitte Angaben zur heutigen Bewegung machen.",
                  style: TextStyle(fontWeight: FontWeight.w100, fontSize: 20.0),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Art der Bewegung: ",
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16.0),
                ),
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>[
                    'Ausdauer',
                    'Kraftsport',
                    'Yoga',
                    'Fußball',
                    'Spazieren gehen',
                    'Nordic Walking',
                    'Fahrradfahren'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Dauer: ",
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16.0),
                ),
                DropdownButton<String>(
                  value: dropdownTimeValue,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownTimeValue = newValue;
                    });
                  },
                  items: <String>[
                    '0 Min',
                    '15 Min',
                    '30 Min',
                    '60 Min',
                    '90 Min',
                    '120 Min'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Gelaufene/Zurückgelegte Strecke (km):'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Bitte geben Sie die zurückgelegten km an.';
                    }
                    return null;
                  },
                  onChanged: (value) => distance = value,
                ),
                SizedBox(
                  height: 20.0,
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
                            .collection("sport")
                            .add({
                          "timestamp": '${DateTime.now()}',
                          "activity": dropdownValue,
                          "distance": distance,
                          "duration": dropdownTimeValue,
                        }).whenComplete(() => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FormView())));
                      }
                    },
                    child: Text('Speichern'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
