class BloodPressureModel {
  final String timestamp;
  final String systolic;
  final String diastolic;
  final String heartrate;

  BloodPressureModel({
    this.timestamp = '99',
    this.systolic = '000',
    this.diastolic = '00',
    this.heartrate = 'asdf',
  });

  BloodPressureModel.fromJson(Map<String, dynamic> parsedJSON)
      : timestamp = parsedJSON['timestamp'],
        systolic = parsedJSON['sys'],
        diastolic = parsedJSON['dia'],
        heartrate = parsedJSON['pulse'];
}
