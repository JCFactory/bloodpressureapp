import 'package:bloodpressure/core/components/form_view_app_bar.dart';
import 'package:bloodpressure/core/helpers/database_child.dart';
import 'package:bloodpressure/features/form_view/form_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GeneralWellbeingFormView extends StatefulWidget {
  @override
  GeneralWellbeingViewState createState() {
    return GeneralWellbeingViewState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class GeneralWellbeingViewState extends State<GeneralWellbeingFormView> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final dateStr = DateFormat('dd.MM.yyyy').format(DateTime.now());

  bool _nervous = false;
  bool _dizzy = false;
  bool _sleepy = false;
  bool _weak = false;
  bool _headache = false;
  bool _hotflash = false;
  bool _nausea = false;
  bool _tachycardia = false;
  bool _lackofconcentration = false;

  @override
  Widget build(BuildContext context) {
    Color _color = Colors.red;
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: FormViewAppBar.appBar(
        title: "Aktuelles Wohlbefinden",
        context: context,
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
                  "Wählen Sie mindestens ein Item aus der Liste aus.",
                  style: TextStyle(fontWeight: FontWeight.w100, fontSize: 20.0),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    ChoiceChip(
                        selected: _nervous,
                        label: Text('Nervösität'),
                        labelStyle: TextStyle(color: Colors.white),
                        backgroundColor: Colors.black54,
                        selectedColor: Colors.blue,
                        onSelected: (bool selected) {
                          setState(() {
                            _nervous = !_nervous;
                          });
                        }),
                    ChoiceChip(
                        selected: _dizzy,
                        label: Text('Schwindel'),
                        labelStyle: TextStyle(color: Colors.white),
                        backgroundColor: Colors.black54,
                        selectedColor: Colors.blue,
                        onSelected: (bool selected) {
                          setState(() {
                            _dizzy = !_dizzy;
                          });
                        }),
                    ChoiceChip(
                        selected: _sleepy,
                        label: Text('Müdigkeit'),
                        labelStyle: TextStyle(color: Colors.white),
                        backgroundColor: Colors.black54,
                        selectedColor: Colors.blue,
                        onSelected: (bool selected) {
                          setState(() {
                            _sleepy = !_sleepy;
                          });
                        }),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    ChoiceChip(
                        selected: _weak,
                        label: Text('Schwäche'),
                        labelStyle: TextStyle(color: Colors.white),
                        backgroundColor: Colors.black54,
                        selectedColor: Colors.blue,
                        onSelected: (bool selected) {
                          setState(() {
                            _weak = !_weak;
                          });
                        }),
                    ChoiceChip(
                        selected: _headache,
                        label: Text('Kopfschmerzen'),
                        labelStyle: TextStyle(color: Colors.white),
                        backgroundColor: Colors.black54,
                        selectedColor: Colors.blue,
                        onSelected: (bool selected) {
                          setState(() {
                            _headache = !_headache;
                          });
                        }),
                    ChoiceChip(
                        selected: _hotflash,
                        label: Text('Hitzewallungen'),
                        labelStyle: TextStyle(color: Colors.white),
                        backgroundColor: Colors.black54,
                        selectedColor: Colors.blue,
                        onSelected: (bool selected) {
                          setState(() {
                            _hotflash = !_hotflash;
                          });
                        }),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    ChoiceChip(
                        selected: _nausea,
                        label: Text('Übelkeit'),
                        labelStyle: TextStyle(color: Colors.white),
                        backgroundColor: Colors.black54,
                        selectedColor: Colors.blue,
                        onSelected: (bool selected) {
                          setState(() {
                            _nausea = !_nausea;
                          });
                        }),
                    ChoiceChip(
                        selected: _tachycardia,
                        label: Text('Herzrasen'),
                        labelStyle: TextStyle(color: Colors.white),
                        backgroundColor: Colors.black54,
                        selectedColor: Colors.blue,
                        onSelected: (bool selected) {
                          setState(() {
                            _tachycardia = !_tachycardia;
                          });
                        }),
                    ChoiceChip(
                        selected: _lackofconcentration,
                        label: Text('Konzentrationsschwäche'),
                        labelStyle: TextStyle(color: Colors.white),
                        backgroundColor: Colors.black54,
                        selectedColor: Colors.blue,
                        onSelected: (bool selected) {
                          setState(() {
                            _lackofconcentration = !_lackofconcentration;
                          });
                        }),
                  ],
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
                            .collection("wellbeing")
                            .add({
                          "${DateTime.now()}": {
                            "nervous": _nervous,
                            "dizzy": _dizzy,
                            "sleepy": _sleepy,
                            "weak": _weak,
                            "headache": _headache,
                            "hotflash": _hotflash,
                            "nausea": _nausea,
                            "tachycardia": _tachycardia,
                            "lackofconcentration": _lackofconcentration,
                          }
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
