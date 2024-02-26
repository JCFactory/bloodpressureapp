class StaticDataModel {
  final String age;
  final String height;
  final String weight;
  final String medication;
  final String illness;
  final String alcohol;
  final String smoking;
  final String systolic;
  final String diastolic;
  final String heartrate;

  StaticDataModel({
    this.age = '99',
    this.height = '000',
    this.weight = '00',
    this.medication = 'asdf',
    this.illness = 'asdf',
    this.alcohol = 'no',
    this.smoking = 'no',
    this.systolic = '0.0',
    this.diastolic = '0.0',
    this.heartrate = '0.0',
  });

  StaticDataModel.fromJson(Map<String, dynamic> parsedJSON)
      : age = parsedJSON['age'],
        height = parsedJSON['height'],
        weight = parsedJSON['weight'],
        medication = parsedJSON['medication'],
        illness = parsedJSON['illness'],
        alcohol = parsedJSON['alcohol'].toString(),
        smoking = parsedJSON['smoking'].toString(),
        systolic = parsedJSON['systolic'],
        diastolic = parsedJSON['diastolic'],
        heartrate = parsedJSON['heartrate'];
}
