import 'package:bloodpressure/core/components/form_view_app_bar.dart';
import 'package:bloodpressure/core/helpers/database_child.dart';
import 'package:bloodpressure/features/form_view/form_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NutritionFormView extends StatefulWidget {
  @override
  NutritionFormViewState createState() {
    return NutritionFormViewState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class NutritionFormViewState extends State<NutritionFormView> {
  final _formKey = GlobalKey<FormState>();
  final dateStr = DateFormat('dd.MM.yyyy').format(DateTime.now());

  String calories;
  String natrium;
  String alcohol;
  String cigarettes;
  String fruits;
  String vegetables;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
        title: Text("Täglicher Konsum"),
        actions: [
          IconButton(
              color: Colors.white,
              icon: Icon(Icons.info_outline),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Mediterrane Ernährung'),
                      content: Text(
                          'Experten empfehlen eine mediterrane Ernährung. '
                          'Diese sieht vor allem weniger Fleisch, '
                          'mehr Fisch und täglich 5 Portionen (5 Handvoll) Obst und Gemüße vor. '),
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
                  "Hier bitte Angaben zur konsumierten Menge machen.",
                  style: TextStyle(fontWeight: FontWeight.w100, fontSize: 20.0),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Kochsalzmenge (Angabe in Gramm):'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Bitte geben Sie die konsumierte Menge ein.';
                    }
                    return null;
                  },
                  onChanged: (value) => natrium = value,
                ),
                TextFormField(
                  decoration:
                      InputDecoration(labelText: 'Kalorien (Angabe in kcal):'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Bitte geben Sie die konsumierte Menge ein.';
                    }
                    return null;
                  },
                  onChanged: (value) => calories = value,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Portionen Gemüße (1 Portion = 1 Handvoll):'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Bitte geben Sie die konsumierte Menge ein.';
                    }
                    return null;
                  },
                  onChanged: (value) => vegetables = value,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Portionen Obst (1 Portion = 1 Handvoll):'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Bitte geben Sie die konsumierte Menge ein.';
                    }
                    return null;
                  },
                  onChanged: (value) => fruits = value,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText:
                          'Gläser Wein/Bier (Angabe in Gläsern, \n für Bier gelten 330ml für Wein gelten 200ml):'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Bitte geben Sie die konsumierte Menge ein.';
                    }
                    return null;
                  },
                  onChanged: (value) => alcohol = value,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText:
                          'Anzahl Zigaretten (Angabe in ganzen Zahlen):'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Bitte geben Sie die konsumierte Menge ein.';
                    }
                    return null;
                  },
                  onChanged: (value) => cigarettes = value,
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
                            .collection("nutrition")
                            .add({
                          "timestamp": '${DateTime.now()}',
                          "natrium": natrium,
                          "calories": calories,
                          "vegetables": vegetables,
                          "fruits": fruits,
                          "alcohol": alcohol,
                          "cigarettes": cigarettes
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
