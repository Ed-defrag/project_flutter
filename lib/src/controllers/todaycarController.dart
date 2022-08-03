import 'package:get/get.dart';
import 'package:fchabak/src/models/todayCarsModel.dart';
import 'package:fchabak/src/service/json_todayscar.dart';

class todaycarController extends GetxController{
  var carsList = <TodayCarsModel>[].obs;

  @override
  void onInit(){
    super.onInit();
    fetchData();
  }

  void fetchData() async{
    var cars = await json_todayscar.fetchCars();
    if(cars != null){
      carsList.value = cars;
    }
  }
}