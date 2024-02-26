import 'package:bloodpressure/core/components/form_view_app_bar.dart';
import 'package:bloodpressure/model/nutrition_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bloodpressure/core/helpers/firebase.service.dart';

class ConsumptionView extends StatefulWidget {
  @override
  ConsumptionViewState createState() {
    return ConsumptionViewState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class ConsumptionViewState extends State<ConsumptionView> {
  FirebaseServices _firebaseServices = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            FormViewAppBar.appBar(title: "Konsum/Ernährung", context: context),
        body: StreamBuilder<QuerySnapshot>(
            stream: _firebaseServices.streamNutritionData(),
            // get data from Stream
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<NutritionModel> allData =
                    _firebaseServices.getAllNutritionDocs(snapshot.data);
                return ListView.builder(
                    itemCount: allData.length,
                    itemBuilder: (context, index) {
                      final dateStr = (allData.elementAt(index).timestamp);

                      return ExpansionTile(
                        leading:
                            Icon(Icons.set_meal_outlined, color: Colors.blue),
                        title: Text(
                          "Datum " + dateStr,
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold),
                        ),
                        children: <Widget>[
                          Card(
                            clipBehavior: Clip.antiAlias,
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text('Kochsalz (Angabe in Gramm): '),
                                  subtitle:
                                      Text(allData.elementAt(index).natrium),
                                ),
                                ListTile(
                                  title: Text('Kalorien: '),
                                  subtitle:
                                      Text(allData.elementAt(index).calories),
                                ),
                                ListTile(
                                  title: Text(
                                      'Portionen Gemüße (eine Portion = 1 Hand voll): '),
                                  subtitle:
                                      Text(allData.elementAt(index).vegetables),
                                ),
                                ListTile(
                                  title: Text(
                                      'Portionen Obst (eine Portion = 1 Hand voll): '),
                                  subtitle:
                                      Text(allData.elementAt(index).fruits),
                                ),
                                ListTile(
                                  title: Text('Anzahl Zigaretten: '),
                                  subtitle:
                                      Text(allData.elementAt(index).cigarettes),
                                ),
                                ListTile(
                                  title: Text('Anzahl Gläser Wein/Bier: '),
                                  subtitle:
                                      Text(allData.elementAt(index).alcohol),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    });
              }
              return Container();
            }));
  }

  @override
  void initState() {
    super.initState();
  }
}
