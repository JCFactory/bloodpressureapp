import 'package:bloodpressure/features/form_view/form_view.dart';
import 'package:bloodpressure/features/login_view/login_view.dart';
import 'package:bloodpressure/features/overview/dashboard.dart';
import 'package:bloodpressure/features/overview/overview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); // Make sure app initialized internally
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: FirebaseAuth.instance.currentUser == null
                  ? LoginView()
                  : HomePage());
        } else {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        }
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Smarter Blutdruck'),
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
        body: TabBarView(
          children: [
            FormView(),
            DashboardStateView(),
            OverviewStateView(),
           // ChatbotView(),
          ],
        ),
        bottomNavigationBar: Material (
          color: Colors.blue,
          child:TabBar(
            tabs: [
              Tab(icon: Icon(Icons.add_circle_outline)),
              Tab(icon: Icon(Icons.dashboard_outlined)),
              Tab(icon: Icon(Icons.assignment)),
              //  Tab(icon: Icon(Icons.chat_bubble)),
            ],
          ),
        ),
      ),
    );
  }
}
