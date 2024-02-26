class NutritionModel {
  final String timestamp;
  final String natrium;
  final String calories;
  final String alcohol;
  final String cigarettes;
  final String fruits;
  final String vegetables;

  NutritionModel({
    this.timestamp = '99',
    this.natrium = '000',
    this.calories = '00',
    this.alcohol = '00',
    this.vegetables = '000',
    this.fruits = '00',
    this.cigarettes = 'asdf',
  });

  NutritionModel.fromJson(Map<String, dynamic> parsedJSON)
      : timestamp = parsedJSON['timestamp'],
        natrium = parsedJSON['natrium'],
        calories = parsedJSON['calories'],
        vegetables = parsedJSON['vegetables'],
        fruits = parsedJSON['fruits'],
        cigarettes = parsedJSON['cigarettes'],
        alcohol = parsedJSON['alcohol'];
}