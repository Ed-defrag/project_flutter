import 'dart:convert';
import 'package:fchabak/src/models/todayCarsModel.dart';
import 'package:http/http.dart' as http;


class json_todayscar{
  static Future<List<TodayCarsModel>> getPosts() async{
    try{
      String url = "http://139.150.83.176/api/cars/today";
      final http.Response response = await http.post(Uri.parse(url));

      final responseBody =  json.decode(response.body);

      print(responseBody);

      final List<TodayCarsModel> todaycars = responseBody.map<TodayCarsModel>((json) => TodayCarsModel.fromJson(json)).toList();

      return todaycars;
    }catch(e){
      print(e);
      throw e;
    }
  }
}