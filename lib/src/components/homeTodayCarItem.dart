import 'package:flutter/material.dart';
import 'package:fchabak/src/models/todayCarsModel.dart';
import 'package:get/get.dart';

class homeTodayCarItem extends StatelessWidget{
  final TodayCarsModel cars;
  homeTodayCarItem(this.cars);

  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 30, 0),
        width: 500,
        height: 500,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.transparent, width: 0.0),
          borderRadius: BorderRadius.all(Radius.circular(11)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Obx(() => Stack(
          children: [
            Container(
              width: 500,
              height: 500,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(11)),
                child:Image.network(
                  cars.img![0],
                  fit: BoxFit.cover,
              ),)
            ),
            Visibility(
                child: Opacity(
                  opacity: 0.3,
                  child: Container(
                    width: 500,
                    height: 500,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.transparent, width: 0.0),
                      borderRadius: BorderRadius.all(Radius.circular(11)),
                    ),
                  ),
                ),
                visible: cars.state.value),
            Visibility(
              child: Container(
                width: 500,
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.transparent, width: 0.0),
                  borderRadius: BorderRadius.all(Radius.circular(11)),
                ),
                child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                  Text(
                    cars.title ?? "없다.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 1.2,
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'noto_sans',
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    (cars.amount).toString()+"~",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 1.2,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'noto_sans',
                      color: Colors.white,
                    ),
                  ),
                ]),
              ),
              visible: cars.state.value,
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: (){
                    //차량 정보로 이동
                  },
                ),
                onEnter: (PointerEvent details) {
                  cars.state.value = true;
                },
                onExit: (PointerEvent details) {
                  cars.state.value = false;
                }

            )
          ],
        )));
  }
}