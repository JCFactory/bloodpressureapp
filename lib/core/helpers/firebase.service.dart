import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/static_data_model.dart';
import '../../model/nutrition_model.dart';
import '../../model/bloodpressure_model.dart';
import '../../model/sport_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {

  final FirebaseFirestore _fireStoreDataBase = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final List<BloodPressureModel> list = [];

  Stream<QuerySnapshot> streamStaticData(){
    return _fireStoreDataBase.collection('users').doc(_firebaseAuth.currentUser.uid).collection('staticData')
        .snapshots();
  }

  Stream<QuerySnapshot> streamBloodpressureData(){
    return _fireStoreDataBase.collection('users').doc(_firebaseAuth.currentUser.uid).collection('bloodpressure').snapshots();
  }

  Stream<QuerySnapshot> streamSportData(){
    return _fireStoreDataBase.collection('users').doc(_firebaseAuth.currentUser.uid).collection('sport')
        .snapshots();
  }

  Stream<QuerySnapshot> streamNutritionData(){
    return _fireStoreDataBase.collection('users').doc(_firebaseAuth.currentUser.uid).collection('nutrition')
        .snapshots();
  }

  // data preparation / parsing
  StaticDataModel parsingStatic(QuerySnapshot snapshot){
    final data = snapshot.docs.first;
    return StaticDataModel.fromJson(data.data());
  }

  List<BloodPressureModel> getAllBPDocs(QuerySnapshot snapshot){
      final allBPDocs = snapshot.docs;
      List<BloodPressureModel> docSnapList = [];
      for(var docSnap in allBPDocs){
        docSnapList.add(BloodPressureModel.fromJson(docSnap.data()));
      }
      return docSnapList;
  }

  List<SportModel> getAllSportDocs(QuerySnapshot snapshot){
      final allSportDocs = snapshot.docs;
      List<SportModel> docSnapList = [];
      for(var docSnap in allSportDocs){
        docSnapList.add(SportModel.fromJson(docSnap.data()));
      }
      return docSnapList;
  }

  List<NutritionModel> getAllNutritionDocs(QuerySnapshot snapshot){
      final allNutritionDocs = snapshot.docs;
      List<NutritionModel> docSnapList = [];
      for(var docSnap in allNutritionDocs){
        docSnapList.add(NutritionModel.fromJson(docSnap.data()));
      }
      return docSnapList;
  }

}