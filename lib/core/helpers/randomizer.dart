import 'package:bloodpressure/features/overview/diagram_view/line_chart.dart';
import 'package:bloodpressure/model/bloodpressure_model.dart';
import 'package:mock_data/mock_data.dart';

class MockClass {

  main(){
    mockString(3, '#');
  }


  BloodPressureModel getBPMockDataSingle(){
   // return {
   //   timestamp =  mockDate(DateTime(1995, 7, 26)),
   //   systolic = mockString(3, '#'),
   //   diastolic = mockInteger(2),
   //   heartrate = mockInteger(3),
   // };
  }

  List<BloodPressureModel> getBPMockDataList() {


  }

}

class LinearSales {
  final int year;
  final int sales;
  LinearSales(this.year, this.sales);
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
