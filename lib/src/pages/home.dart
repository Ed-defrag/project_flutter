import 'dart:ui';

import 'package:fchabak/src/service/json_todayscar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fchabak/src/components/navigationMenu.dart';
import 'package:fchabak/src/components/footer.dart';
import 'package:fchabak/src/models/todayCarsModel.dart';
import 'package:fchabak/src/controllers/todaycarController.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _Hompage createState() => _Hompage();
}

class _Hompage extends State<HomePage> {
  final ScrollController hscrollController = ScrollController();
  final ScrollController vscrollController = ScrollController();

  var homeTitle = "첫차박을 하다";
  var homeSubtitle = "편안하고 로맨틱했던 나의 첫차박.";

  late List<String> yearList;
  List<String> monthList = ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'];
  List<String> day_28List = ['1일', '2일', '3일', '4일', '5일', '6일', '7일', '8일', '9일', '10일', '11일', '12일', '13일', '14일', '15일', '16일', '17일', '18일', '19일', '20일', '21일', '22일', '23일', '24일', '25일', '26일', '27일', '28일'];
  List<String> day_29List = ['1일', '2일', '3일', '4일', '5일', '6일', '7일', '8일', '9일', '10일', '11일', '12일', '13일', '14일', '15일', '16일', '17일', '18일', '19일', '20일', '21일', '22일', '23일', '24일', '25일', '26일', '27일', '28일', '29일'];
  List<String> day_30List = ['1일', '2일', '3일', '4일', '5일', '6일', '7일', '8일', '9일', '10일', '11일', '12일', '13일', '14일', '15일', '16일', '17일', '18일', '19일', '20일', '21일', '22일', '23일', '24일', '25일', '26일', '27일', '28일', '29일', '30일'];
  List<String> day_31List = ['1일', '2일', '3일', '4일', '5일', '6일', '7일', '8일', '9일', '10일', '11일', '12일', '13일', '14일', '15일', '16일', '17일', '18일', '19일', '20일', '21일', '22일', '23일', '24일', '25일', '26일', '27일', '28일', '29일', '30일', '31일'];
  List<String> timeList = ['0시', '1시', '2시', '3시', '4시', '5시', '6시', '7시', '8시', '9시', '10시', '11시', '12시', '13시', '14시', '15시', '16시', '17시', '18시', '19시', '20시', '21시', '22시', '23시'];
  late List<String> selectedDDayList;
  late List<String> selectedADayList;
  late List cars;



  String depatureYear = '2022년';
  String depatureMonth = '11월';
  String depatureDay = '29일';
  String depatureTime = '13시';
  String arrivalYear = '2022년';
  String arrivalMonth = '11월';
  String arrivalDay = '29일';
  String arrivalTime = '13시';

  int carType = 0;

  void getNow() {
    int year = DateTime.now().year.toInt();
    int month = DateTime.now().month.toInt();

    depatureYear = DateTime.now().year.toString() + "년";
    arrivalYear = DateTime.now().year.toString() + "년";
    depatureMonth = DateTime.now().month.toString() + "월";
    arrivalMonth = DateTime.now().month.toString() + "월";
    depatureDay = DateTime.now().day.toString() + "일";
    arrivalDay = DateTime.now().day.toString() + "일";
    depatureTime = DateTime.now().hour.toString() + "시";
    arrivalTime = DateTime.now().hour.toString() + "시";

    yearList = [year.toString() + "년", (year + 1).toString() + "년"];

    if (month == 2) {
      if (year % 4 == 0) {
        selectedDDayList = day_29List;
        selectedADayList = day_29List;
      } else {
        selectedDDayList = day_28List;
        selectedADayList = day_28List;
      }
    } else if (month == 4 || month == 6 || month == 9 || month == 11) {
      selectedDDayList = day_30List;
      selectedADayList = day_30List;
    } else {
      selectedDDayList = day_31List;
      selectedADayList = day_31List;
    }

  }

  void getDay(String year, String month, String type) {
    int criteriaYear = int.parse(year.substring(0, 3));
    int criteriaMonth = int.parse(month.substring(0, month.length - 1));

    if (criteriaMonth == 2) {
      if (criteriaYear % 4 == 0) {
        if (type.contains("d"))
          selectedDDayList = day_29List;
        else
          selectedADayList = day_29List;
      } else {
        if (type.contains("d"))
          selectedDDayList = day_28List;
        else
          selectedADayList = day_28List;
      }
    } else if (criteriaMonth == 4 || criteriaMonth == 6 || criteriaMonth == 9 || criteriaMonth == 11) {
      if (type.contains("d"))
        selectedDDayList = day_30List;
      else
        selectedADayList = day_30List;
    } else {
      if (type.contains("d"))
        selectedDDayList = day_31List;
      else
        selectedADayList = day_31List;
    }
  }

  void setCount(bool state) {
    setState(() {
      if(state == true){
        state = false;
      }
      else{
        state = true;
      }
    });
  }

  @override
  initState() {
    getNow();
  }

  Widget homeDateDropdownbtn(List<String> inputList, String inputValue, String type) {
    return DropdownButton(
      value: inputValue,
      items: inputList.map((String item) {
        return DropdownMenuItem(
          value: item,
          child: Text('$item'),
        );
      }).toList(),
      underline: SizedBox(),
      onChanged: (dynamic newValue) {
        setState(() {
          inputValue = newValue;
          if (inputValue.contains("년")) {
            if (type.contains("d"))
              depatureYear = newValue;
            else
              arrivalYear = newValue;
          } else if (inputValue.contains("월")) {
            if (type.contains("d")) {
              depatureMonth = newValue;
              getDay(depatureYear, depatureMonth, "d");
            } else {
              arrivalMonth = newValue;
              getDay(arrivalYear, arrivalMonth, "a");
            }
          } else if (inputValue.contains("일")) {
            if (type.contains("d"))
              depatureDay = newValue;
            else
              arrivalDay = newValue;
          } else if (inputValue.contains("시")) {
            if (type.contains("d"))
              depatureTime = newValue;
            else
              arrivalTime = newValue;
          }
        });
      },
    );
  }

  Widget homeBookButton(String btn, GestureTapCallback onTap) {
    return Container(
      width: 246,
      height: 46,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(8.0),
          ), //버튼 코너에 라운드
        ),
        child: Text(btn,
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 1.2,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontFamily: 'noto_sans',
              color: Color(0xffC2A483),
            )),
      ),
    );
  }

  Widget homeTypeRadioBtn(String text, int index) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          carType = index;
        });
      },
      style: ElevatedButton.styleFrom(
        primary: (carType == index) ? Colors.white : Colors.transparent,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(20.0),
          side: BorderSide(
            width: 1.0,
            color: Colors.white,
          ),
        ), //버튼 코너에 라운드
      ),
      child: Text(text,
          textAlign: TextAlign.center,
          style: TextStyle(
            height: 1.2,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: 'noto_sans',
            color: (carType == index) ? Colors.black : Colors.white,
          )),
    );
  }

  Widget mainGate() {
    return Container(
      constraints: BoxConstraints(maxWidth: 1280, minWidth: 1280, maxHeight: 960, minHeight: 960),
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.fromLTRB(172, 94, 299, 125),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              homeTitle,
              textAlign: TextAlign.start,
              style: TextStyle(
                height: 1.2,
                fontSize: 70,
                fontWeight: FontWeight.w900,
                fontFamily: 'noto_sans',
                color: Colors.white,
              ),
            ),
            Text(
              homeSubtitle,
              textAlign: TextAlign.start,
              style: TextStyle(
                height: 1.2,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontFamily: 'noto_sans',
                color: Colors.white,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                homeBookButton("오시는 길", () {}),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 13, 0, 0),
                  child: homeBookButton("1:1 채팅 문의", () {}),
                )
              ],
            ),
            Stack(
              children: [
                Opacity(
                  opacity: 1,
                  child: Container(
                    width: 808,
                    height: 340,
                    decoration: BoxDecoration(
                      color: Color(0x88ffffff),
                      border: Border.all(color: Colors.transparent, width: 0.0),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
                Container(
                  width: 808,
                  height: 340,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    //booking info
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(29, 29, 0, 0),
                        child: Text(
                          "언제 떠나실 건가요?",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            height: 1.2,
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'noto_sans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(37, 35, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                //출발
                                margin: const EdgeInsets.fromLTRB(0, 0, 22, 0),
                                width: 18,
                                height: 18,
                                // Image.asset("assets/images/logo.png", height: 40, fit: BoxFit.cover,)),
                                child: Placeholder()),
                            Text(
                              "출발",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                height: 1.2,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'noto_sans',
                                color: Colors.white,
                              ),
                            ),
                            Container(margin: const EdgeInsets.fromLTRB(31, 0, 0, 0), width: 87, height: 32, child: homeDateDropdownbtn(yearList, depatureYear, "d")),
                            Container(margin: const EdgeInsets.fromLTRB(16, 0, 0, 0), width: 69, height: 32, child: homeDateDropdownbtn(monthList, depatureMonth, "d")),
                            Container(margin: const EdgeInsets.fromLTRB(16, 0, 0, 0), width: 69, height: 32, child: homeDateDropdownbtn(selectedDDayList, depatureDay, "d")),
                            Container(margin: const EdgeInsets.fromLTRB(16, 0, 0, 0), width: 69, height: 32, child: homeDateDropdownbtn(timeList, depatureTime, "d")),
                          ],
                        ),
                      ),
                      Container(
                        //도착
                        margin: const EdgeInsets.fromLTRB(37, 10, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 22, 0),
                                width: 18,
                                height: 18,
                                // Image.asset("assets/images/logo.png", height: 40, fit: BoxFit.cover,)),
                                child: Placeholder()),
                            Text(
                              "도착",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                height: 1.2,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'noto_sans',
                                color: Colors.white,
                              ),
                            ),
                            Container(margin: const EdgeInsets.fromLTRB(31, 0, 0, 0), width: 87, height: 32, child: homeDateDropdownbtn(yearList, arrivalYear, "a")),
                            Container(margin: const EdgeInsets.fromLTRB(16, 0, 0, 0), width: 69, height: 32, child: homeDateDropdownbtn(monthList, arrivalMonth, "a")),
                            Container(margin: const EdgeInsets.fromLTRB(16, 0, 0, 0), width: 69, height: 32, child: homeDateDropdownbtn(selectedADayList, arrivalDay, "a")),
                            Container(margin: const EdgeInsets.fromLTRB(16, 0, 0, 0), width: 69, height: 32, child: homeDateDropdownbtn(timeList, arrivalTime, "a")),
                          ],
                        ),
                      ),
                      Container(
                        //차종
                        margin: const EdgeInsets.fromLTRB(37, 10, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 22, 0),
                                width: 18,
                                height: 18,
                                // Image.asset("assets/images/logo.png", height: 40, fit: BoxFit.cover,)),
                                child: Placeholder()),
                            Text(
                              "차종",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                height: 1.2,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'noto_sans',
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(21, 0, 0, 0),
                              width: 96,
                              height: 32,
                              child: homeTypeRadioBtn("캠핑카", 0),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                              width: 96,
                              height: 32,
                              child: homeTypeRadioBtn("국산차량", 1),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                              width: 96,
                              height: 32,
                              child: homeTypeRadioBtn("외제차량", 2),
                            )
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        margin: const EdgeInsets.fromLTRB(641, 49, 0, 0),
                        width: 117,
                        height: 32,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(20.0),
                              ),
                              //버튼 코너에 라운드
                              side: BorderSide(
                                width: 1.0,
                                color: Colors.white,
                              ), // 버튼바깥 색깔과 두께
                            ),
                            child: Container(
                              width: 117,
                              height: 32,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 18,
                                    height: 18,
                                    // Image.asset("assets/images/logo.png", height: 40, fit: BoxFit.cover,)),
                                    child: Placeholder(),
                                  ),
                                  Text("검색",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        height: 1.2,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'noto_sans',
                                        color: Colors.white,
                                      )),
                                ],
                              ),
                            )),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget todaysCar(){
    return CustomScrollView(
        scrollBehavior: MyCustomScrollBehavior(),
        scrollDirection: Axis.horizontal,
        slivers: [
      FutureBuilder(
          future: json_todayscar.getPosts(),
          builder: (BuildContext context, AsyncSnapshot<List<TodayCarsModel>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return SliverToBoxAdapter(
                  child: Text(
                    '$snapshot.error',
                    style: TextStyle(color: Colors.red),
                  ),
                );
              } else {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      final item = snapshot.data![index];
                      return Container(
                          width: 500,
                          height: 500,
                          child: Stack(
                            children: [
                              Image.network(
                                item.img![0],
                                width: 500,
                                height: 500,
                                fit: BoxFit.cover,
                              ),
                              Visibility(child: Opacity(opacity: 0.3,
                                child:Container(
                                  width: 500,
                                  height: 500,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    border: Border.all(color: Colors.transparent, width: 0.0),
                                    borderRadius: BorderRadius.all(Radius.circular(11)),
                                  ),
                                ),
                              ),
                              visible: item.state),
                              Visibility(child:Container(
                                width: 500,
                                height: 500,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(color: Colors.transparent, width: 0.0),
                                  borderRadius: BorderRadius.all(Radius.circular(11)),
                                ),
                                child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                                  Text(
                                    item.title??"없다.",
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
                                    item.amount??"0원",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      height: 1.2,
                                      fontSize: 70,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'noto_sans',
                                      color: Colors.white,
                                    ),
                                  ),
                                ]),
                              ),
                              visible: item.state,
                              ),
                              MouseRegion(
                                onEnter: (PointerEvent details){
                                  setState(() {
                                    setCount(item.state);
                                  });
                                },
                                onExit: (PointerEvent details){
                                  setState(() {
                                    setCount(item.state);
                                  });
                                },
                              )
                            ],
                          ));
                    },
                    childCount: snapshot.data?.length,
                  ),
                );
              }
            } else {
              return SliverToBoxAdapter(
                  child: SizedBox(
                width: 500,
                height: 500,
                  child: Text("Error"),
              ));
            }
          })
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      return Scrollbar(
        controller: hscrollController,
        child: SingleChildScrollView(
            controller: hscrollController,
            scrollDirection: Axis.horizontal,
            physics: ScrollPhysics(),
            child: Scrollbar(
              controller: vscrollController,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: ScrollPhysics(),
                controller: vscrollController,
                child: Column(
                  children: [
                    Container(
                      width: constraints.biggest.width > 1920 ? constraints.biggest.width : 1920,
                      color: Color(0xffC2A483),
                      alignment: constraints.biggest.width > 1280 ? Alignment.topCenter : Alignment.topLeft,
                      child: NavigationMenu(),
                    ),
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          alignment: Alignment.topCenter,
                          child: Image.network(
                            "https://media.triple.guide/triple-cms/c_limit,f_auto,h_1024,w_1024/7ca25820-a6b4-4d02-9d1f-fa3ea2805c56.jpeg",
                            width: constraints.biggest.width > 1920 ? constraints.biggest.width : 1920,
                            height: 960,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          constraints: BoxConstraints(minWidth: 1280, maxWidth: 1280),
                          alignment: Alignment.topCenter,
                          child: mainGate(),
                        ),
                      ],
                    ),
                    Container(
                      width: 1280,
                      height: 500,
                      child: todaysCar(),
                    ),
                    Container(
                      constraints: BoxConstraints(minWidth: 1280, maxWidth: 1280),
                      alignment: Alignment.topCenter,
                      child: Placeholder(),
                    ),
                    Container(
                      constraints: BoxConstraints(minWidth: 1280, maxWidth: 1280),
                      alignment: Alignment.topCenter,
                      child: Placeholder(),
                    ),
                    Container(
                      width: constraints.biggest.width > 1920 ? constraints.biggest.width : 1920,
                      color: Color(0xffC2A483),
                      alignment: constraints.biggest.width > 1280 ? Alignment.topCenter : Alignment.topLeft,
                      child: Footer(),
                    ),
                  ],
                ),
              ),
            )),
      );
    }));
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}
