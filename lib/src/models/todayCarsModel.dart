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