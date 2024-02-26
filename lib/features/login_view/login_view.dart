import 'package:bloodpressure/features/form_view/static_form_view.dart';
import 'package:bloodpressure/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String title = "Registrierung";
  String email;
  String password;
  bool loading = false;

  //final initializedDate = initializeDateFormatting('de_DE', null);
  final dateStr = DateFormat('dd.MM.yyyy').format(DateTime.now());
  String sys;
  String dia;
  String pulse;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Herzlich Willkommen!"),
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    SizedBox(height: 20),
                    CupertinoTextField(
                      padding: EdgeInsets.all(10),
                      placeholder: "Email",
                      onChanged: (value) => email = value,
                    ),
                    SizedBox(height: 20),
                    CupertinoTextField(
                      padding: EdgeInsets.all(10),
                      placeholder: "Passwort",
                      obscureText: true,
                      onChanged: (value) => password = value,
                    ),
                    SizedBox(height: 20),
                    CupertinoButton(
                        color: Colors.blue,
                        child: Text(title),
                        onPressed: loginHandler),
                    SizedBox(height: 20),
                    CupertinoButton(
                      child: Text("Umschalten"),
                      onPressed: () {
                        setState(() {
                          title == "Registrierung"
                              ? title = "Anmeldung"
                              : title = "Registrierung";
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
    );
  }

  loginHandler() async {
    if (title == "Registrierung") {
      setState(() {
        loading = true;
      });
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        await FirebaseFirestore.instance
            .collection("users")
            .doc("${value.user.uid}")
            .set({"email": value.user.email, "uid": value.user.uid})
            .then((value) => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => StaticFormView())))
            .catchError((e) => print(e));

        await FirebaseFirestore.instance
            .collection("users")
            .doc("${value.user.uid}")
            .collection("$dateStr")
            .doc("bloodpressure")
            .set({
          "${DateTime.now()}": {
            "sys": 0,
            "dia": 0,
            "pulse": 0,
          }
        });
      }).catchError((error) {
        setState(() {
          loading = false;
        });
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Error"),
                content: Text((error as FirebaseAuthException).message),
              );
            });
      });
    } else {
      setState(() {
        loading = true;
      });
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage()));
      }).catchError((error) {
        setState(() {
          loading = false;
        });
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Error"),
                content: Text((error as FirebaseAuthException).message),
              );
            });
      });
    }
  }
}
