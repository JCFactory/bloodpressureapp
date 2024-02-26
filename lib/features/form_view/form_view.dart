import 'package:bloodpressure/features/form_view/dynamic_forms/bloodpressure_form_view.dart';
import 'package:bloodpressure/features/form_view/dynamic_forms/nutrition_form_view.dart';
import 'package:bloodpressure/features/form_view/dynamic_forms/sport_form_view.dart';
import 'package:bloodpressure/features/form_view/dynamic_forms/general_wellbeing.dart';
import 'package:bloodpressure/features/login_view/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormView extends StatefulWidget {
  @override
  FormViewState createState() {
    return FormViewState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class FormViewState extends State<FormView> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final dateStr = DateFormat('dd.MM.yyyy').format(DateTime.now());


  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    "Heute: " + dateStr,
                    style: TextStyle(
                        color: Colors.blue.withOpacity(0.8),
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.add, color: Colors.blue, size: 32.0),
                  title: const Text('Blutdruck hinzufügen', style:TextStyle(color: Colors.blue, fontSize: 20.0)),
                  onTap: () => onTapped('bp'),
                ),
                ListTile(
                  leading: Icon(Icons.add, color: Colors.blue, size: 32.0),
                  title: const Text('Konsum/Ernährung hinzufügen', style:TextStyle(color: Colors.blue,  fontSize: 20.0)),
                  onTap: () => onTapped('nutrition'),
                ),
                ListTile(
                  leading: Icon(Icons.add,color: Colors.blue, size: 32.0),
                  title: const Text('Bewegung hinzufügen', style:TextStyle(color: Colors.blue, fontSize: 20.0)),
                  onTap: () => onTapped("sport"),
                ),
             //   ListTile(
             //     leading: Icon(Icons.add),
             //     title: const Text('Wohlbefinden dokumentieren'),
             //     onTap: () => onTapped("wellbeing"),
             //   ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onTapped(post) {
    switch (post) {
      case "bp":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BloodpressureFormView()),
        );
        break;
      case "sport":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SportFormView()),
        );
        break;
      case "nutrition":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NutritionFormView()),
        );
        break;
      case "wellbeing":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GeneralWellbeingFormView()),
        );
        break;
    }
  }

  @override
  void initState() {
    super.initState();
  }
}
