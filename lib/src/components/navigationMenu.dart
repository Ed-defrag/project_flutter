import 'dart:html';
import 'package:fchabak/main.dart';
import 'package:flutter/material.dart';

class NavigationMenu extends StatefulWidget {
  @override
  _NavigationMenuState createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {

  Widget menu(String Menu, GestureTapCallback onTap) {
    return InkWell(
      mouseCursor: MaterialStateMouseCursor.clickable,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Text(
        Menu,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget additionalmenu(String Menu, GestureTapCallback onTap) {
    return Visibility(
      child: InkWell(
        mouseCursor: MaterialStateMouseCursor.clickable,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onTap,
        child: Text(
          Menu,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ),
      visible: MyApp.additionalMenuVisible,
    );
  }

  Widget adminmenu(String Menu, GestureTapCallback onTap) {
    return Visibility(
      child: InkWell(
        mouseCursor: MaterialStateMouseCursor.clickable,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onTap,
        child: Text(
          Menu,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ),
      maintainSize: true,
      //이 세 개를 true로 하면 invisible 해도 자리를 차지함
      maintainAnimation: true,
      //
      maintainState: true,
      //
      visible: MyApp.adminVisible,
    );
  }

  Widget naviButton(String btn, GestureTapCallback onTap){
    return Container(
      width: 120,
      height: 30,
      margin: const EdgeInsets.fromLTRB(14, 15, 10, 0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: Color(0xffC2A483),
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8.0),), //버튼 코너에 라운드
          side: BorderSide(width: 1.0, color: Colors.white,), // 버튼 색깔과 두께
          // onPrimary: Color(0xffC2A483), //마우스 올라갔을때 컬러
        ),
        child: Text(
            btn,
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 1.2,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontFamily: 'noto_sans',
              color: Colors.white,
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 1280, minWidth: 1280),
      color: Color(0xffC2A483),
      child: MouseRegion(
        onHover: (PointerEvent details) {
          setState(() {
            MyApp.additionalMenuVisible = true;
          });
        },
        onExit: (PointerEvent details) {
          setState(() {
            MyApp.additionalMenuVisible = false;
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/");
                  },
                  child: Image.asset("assets/images/logo.png", height: 40, fit: BoxFit.cover,)),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 15, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  menu("공지사항", () {
                    // Navigator.pushNamed(context, "/");
                  })
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 15, 10, 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    menu("캠핑/일반차 렌트", () {}),
                    additionalmenu("캠핑카 렌트", () {}),
                    additionalmenu("국산차 렌트", () {}),
                    additionalmenu("외제차 렌트", () {}),
                    adminmenu("렌트카 등록", () {}),
                  ]),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 15, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  menu("캠핑카 제작", () {}),
                  adminmenu("상품 등록", () {}),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 15, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [menu("캠핑용품", () {}), adminmenu("상품 등록", () {})],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 15, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [menu("이용후기", () {})],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 15, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  menu("마이페이지", () {}),
                  additionalmenu("장바구니", () {}),
                  additionalmenu("주문목록", () {}),
                  additionalmenu("내정보", () {}),
                  adminmenu("일정관리", () {}),
                ],
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  naviButton("로그인", () {}),
                  naviButton("카테고리", () {}),
                ],)
          ],
        ),
      ),
    );
  }
}
