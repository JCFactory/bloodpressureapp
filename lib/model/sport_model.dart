class SportModel {
  final String timestamp;
  final String activity;
  final String distance;
  final String duration;

  SportModel({
    this.timestamp = '99',
    this.activity = '000',
    this.distance = '00',
    this.duration = 'asdf',
  });

  SportModel.fromJson(Map<String, dynamic> parsedJSON)
      : timestamp = parsedJSON['timestamp'],
        activity = parsedJSON['activity'],
        distance = parsedJSON['distance'],
        duration = parsedJSON['duration'];
}