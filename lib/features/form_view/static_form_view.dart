import 'dart:async';

import 'package:bloodpressure/core/helpers/database_child.dart';
import 'package:bloodpressure/features/login_view/login_view.dart';
import 'package:bloodpressure/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StaticFormView extends StatefulWidget {
  @override
  StaticFormViewState createState() {
    return StaticFormViewState();
  }
}

enum Smoking { smoking, nonsmoking }

enum Alcohol { alcohol, nonalcohol }

// Create a corresponding State class.
// This class holds data related to the form.
class StaticFormViewState extends State<StaticFormView> {
  final _formKey = GlobalKey<FormState>();
  Smoking smoking = Smoking.smoking;
  Alcohol alcohol = Alcohol.alcohol;

  String age;
  String sex;
  String height;
  String weight;
  String medication;
  String illness;

  double _smokingSliderValue = 1;
  double _alcoholSliderValue = 1;
  final uid = FirebaseAuth.instance.currentUser.uid;
  StreamController<double> controller = StreamController<double>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
        title: Text("Statische Daten", style: TextStyle(color: Colors.black)),
        elevation: 0.5,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              color: Colors.black,
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) =>
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginView())));
              })
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
                TextFormField(
                  decoration: InputDecoration(labelText: 'Alter:'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Bitte geben Sie Ihr Alter ein';
                    }
                    return null;
                  },
                  onChanged: (value) => age = value,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Geschlecht:'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Bitte geben Sie Ihr Geschlecht ein';
                    }
                    return null;
                  },
                  onChanged: (value) => sex = value,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Größe:'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Bitte geben Sie Ihre Größe (in cm) ein';
                    }
                    return null;
                  },
                  onChanged: (value) => height = value,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Gewicht:'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Bitte geben Sie Ihr Gewicht (in kg) ein';
                    }
                    return null;
                  },
                  onChanged: (value) => weight = value,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Medikamente:'),
                  onChanged: (value) => medication = value,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Vorerkrankungen:'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Bitte geben Sie Ihre Vorerkrankungen an';
                    }
                    return null;
                  },
                  onChanged: (value) => illness = value,
                ),
                Text(
                  "Ich rauche nicht(0), gelegentlich(1), regelmäßig(2), häufig(3).",
                  style: TextStyle(fontWeight: FontWeight.w100, fontSize: 20.0),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      _smokingSliderValue.toString(),
                      style: TextStyle(
                          fontSize: 40.0, fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                    valueIndicatorColor: Colors.blueAccent,
                    valueIndicatorTextStyle: TextStyle(
                      color: Colors.white,
                    ),
                    activeTrackColor: Colors.blue,
                    inactiveTrackColor: Colors.blue,
                    trackShape: RectangularSliderTrackShape(),
                    trackHeight: 4.0,
                    thumbColor: Colors.blueAccent,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                    overlayColor: Colors.blue.withAlpha(32),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                    activeTickMarkColor: Colors.blue,
                  ),
                  child: Slider(
                    value: _smokingSliderValue,
                    min: 0,
                    max: 3,
                    divisions: 3,
                    label: _smokingSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _smokingSliderValue = value;
                      });
                    },
                  ),
                ),
                Text(
                  "Ich trinke keinen(0), gelegentlich(1), regelmäßig(2), häufig(3) Alkohol.",
                  style: TextStyle(fontWeight: FontWeight.w100, fontSize: 20.0),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      _alcoholSliderValue.toString(),
                      style: TextStyle(
                          fontSize: 40.0, fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
                SliderTheme(
                  // decoration:InputDecoration(labelText:'0: ich rauche nicht'),
                  data: SliderTheme.of(context).copyWith(
                    valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                    valueIndicatorColor: Colors.blueAccent,
                    valueIndicatorTextStyle: TextStyle(
                      color: Colors.white,
                    ),
                    activeTrackColor: Colors.blue,
                    inactiveTrackColor: Colors.blue,
                    trackShape: RectangularSliderTrackShape(),
                    trackHeight: 4.0,
                    thumbColor: Colors.blueAccent,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                    overlayColor: Colors.blue.withAlpha(32),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                    activeTickMarkColor: Colors.blue,
                  ),
                  child: Slider(
                    value: _alcoholSliderValue,
                    min: 0,
                    max: 3,
                    divisions: 3,
                    label: _alcoholSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _alcoholSliderValue = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        FirebaseFirestore.instance
                            .collection("${DataBaseChild.user}")
                            .doc("$uid")
                            .collection("staticData")
                            .add({
                          "age": age,
                          "sex": sex,
                          "height": height,
                          "weight": weight,
                          "medication": medication,
                          "illness": illness,
                          "smoking": _smokingSliderValue,
                          "alcohol": _alcoholSliderValue,
                        }).whenComplete(() => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage())));
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

  List data = [];
  String docId;

  @override
  void initState() {
    super.initState();
    getStaticDataDocID();
    getDataFromFirestore();
  }

  getStaticDataDocID() {
    FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('staticData')
        .get()
        .then((QuerySnapshot querySnapshot) => {
              if (querySnapshot != null)
                {
                  querySnapshot.docs.forEach((doc) {
                    docId = doc.id;
                    return docId;
                  })
                }
              else
                {print('Document does not exist on the database')}
            });
  }

  getDataFromFirestore() {
    Stream stream = controller.stream;
    stream.listen((value) {
      print('Value from controller: $value');
    });
    data.add(FirebaseFirestore.instance.collection('users').doc('$uid').get());
    //return data;
  }
}
