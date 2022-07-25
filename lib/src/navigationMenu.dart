import 'dart:html';

import 'package:flutter/material.dart';

class NavigationMenu extends StatefulWidget {
  @override
  _NavigationMenuState createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  bool adminVisible = false;
  bool additionalMenuVisible = false;

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
      visible: additionalMenuVisible,
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
      visible: adminVisible,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      color: Color(0xffC2A483),
      child: MouseRegion(
              onHover: (PointerEvent details) {
      setState(() {
      additionalMenuVisible = true;
      });
      },
          onExit: (PointerEvent details) {
            setState(() {
              additionalMenuVisible = false;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Image.asset("assets/images/logo.png", height: 40)),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [menu("공지사항", () {})],
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
            ],
          )),
    );
  }
}
