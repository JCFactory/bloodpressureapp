import '../../model/sport_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bloodpressure/core/components/form_view_app_bar.dart';
import 'package:bloodpressure/core/helpers/firebase.service.dart';

class SportView extends StatefulWidget {
  @override
  SportViewState createState() {
    return SportViewState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class SportViewState extends State<SportView> {
  FirebaseServices _firebaseServices = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FormViewAppBar.appBar(title: "Sport", context: context),
      body: StreamBuilder<QuerySnapshot>(
          stream: _firebaseServices.streamSportData(),
          // get data from Stream
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<SportModel> allData =
                  _firebaseServices.getAllSportDocs(snapshot.data);

              return ListView.builder(
                  itemCount: allData.length,
                  itemBuilder: (context, index) {
                    var dateStr = allData.elementAt(index).timestamp.toString();
                    print(dateStr.runtimeType);
                    return ExpansionTile(
                      leading: Icon(Icons.sports_baseball_outlined,
                          color: Colors.blue),
                      title: Text(
                        "Datum " + dateStr,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      children: <Widget>[
                        Card(
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            children: [
                              ListTile(
                                title: Text('Aktivität: '),
                                subtitle:
                                    Text(allData.elementAt(index).activity),
                              ),
                              ListTile(
                                title: Text('Dauer: '),
                                subtitle:
                                    Text(allData.elementAt(index).duration),
                              ),
                              ListTile(
                                title: Text('Zurückgelegte Distanz: '),
                                subtitle:
                                    Text(allData.elementAt(index).distance),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  });
            }
            return Container();
          }),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
