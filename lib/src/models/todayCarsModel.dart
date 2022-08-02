import 'dart:convert';
import 'package:get/get.dart';

// List<TodayCarsModel> todaycarsFromJson(String str) => List<TodayCarsModel>.from(json.decode(str).map((x) => TodayCarsModel.fromJson(x)));
//
// String todaycarsToJson(List<TodayCarsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class TodayCarsModel {
//   final String? title;
//   final String? amount;
//   final List? img;
//   bool state;
//
//   TodayCarsModel({this.title, this.amount, this.img, this.state = false });
//
//   factory TodayCarsModel.fromJson(Map<String, dynamic> json){
//     return TodayCarsModel(
//       title: json['carName'],
//       amount: json['amount'],
//       img: json['img'],
//       state: false,
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//     "carName": title,
//     "amount": amount,
//     "img": img,
//   };
// }

class TodayCarsModel {
  final String? title;
  final String? amount;
  final List? img;
  bool state;

  TodayCarsModel({this.title, this.amount, this.img, required this.state });

  factory TodayCarsModel.fromJson(Map<String, dynamic> json){
    return TodayCarsModel(
      title: json['carName'],
      amount: json['amount'],
      img: json['img'],
      state: false,
    );
  }

}