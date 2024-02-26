import 'package:bloodpressure/core/helpers/firebase.service.dart';
import 'package:bloodpressure/model/bloodpressure_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../core/components/form_view_app_bar.dart';

class BloodPressureView extends StatefulWidget {
  @override
  BloodPressureViewState createState() {
    return BloodPressureViewState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class BloodPressureViewState extends State<BloodPressureView> {
  FirebaseServices _firebaseServices = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FormViewAppBar.appBar(title: "Messungen", context: context),
      body: StreamBuilder<QuerySnapshot>(
          stream: _firebaseServices.streamBloodpressureData(),
          // get data from Stream
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<BloodPressureModel> allData =
                  _firebaseServices.getAllBPDocs(snapshot.data);
              return ListView.builder(
                  itemCount: allData.length,
                  itemBuilder: (context, index) {
                    final dateStr = (allData.elementAt(index).timestamp);
                    return ExpansionTile(
                      leading: Icon(Icons.show_chart, color: Colors.blue),
                      title: Text(
                        "Datum " + dateStr,
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                      children: <Widget>[
                        Card(
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            children: [
                              ListTile(
                                title: Text('Puls: '),
                                subtitle:
                                    Text(allData.elementAt(index).heartrate),
                              ),
                              ListTile(
                                title: Text('Systolischer Blutdruck: '),
                                subtitle:
                                    Text(allData.elementAt(index).systolic),
                              ),
                              ListTile(
                                title: Text('Diastolischer Blutdruck: '),
                                subtitle:
                                    Text(allData.elementAt(index).diastolic),
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
