import 'package:bloodpressure/features/login_view/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DynamicFormView extends StatefulWidget {
  @override
  DynamicFormViewState createState() {
    return DynamicFormViewState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class DynamicFormViewState extends State<DynamicFormView> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
        title: Text("Täglicher Konsum", style: TextStyle(color: Colors.black)),
        elevation: 0.5,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              color: Colors.white,
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
                  decoration: InputDecoration(labelText: 'Natriumsalz (mg)'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Angabe erforderlich';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Kalorien (kcal)'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Angabe erforderlich';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration:
                      InputDecoration(labelText: 'Kohlenhydrate (Gramm)'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Angabe erforderlich';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Gemüße (Gramm)'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Angabe erforderlich';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Obst (Gramm)'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Angabe erforderlich';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration:
                      InputDecoration(labelText: 'Milchprodukte (ml/Gramm)'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Angabe erforderlich';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Mageres Fleisch/Fisch (Gramm)'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Angabe erforderlich';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Nüsse/Samen/Hülsenfrüchte (Gramm)'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Angabe erforderlich';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Fette/Öle (ml)'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Angabe erforderlich';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Süßigkeiten (Gramm)'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Angabe erforderlich';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false
                      // otherwise.
                      if (_formKey.currentState.validate()) {
                        // If the form is valid, display a Snackbar.
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Processing Data')));
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
