import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer();

  Widget menu(String Menu, GestureTapCallback onTap) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 19, 13, 0),
      child: InkWell(
        mouseCursor: MaterialStateMouseCursor.clickable,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onTap,
        child: Text(
          Menu,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: 'noto_sans',
            color: Colors.white,
            decoration: TextDecoration.underline,
            decorationThickness: 2,
          ),
        ),
      ),
    );
  }

  Widget infoMenu(String iMenu) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 14, 0, 25),
      child: Text(iMenu,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: 'noto_sans',
            color: Colors.white,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1280,
      color: Color(0xffC2A483),
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 19, 13, 10),
                  child: Text("바로렌트카(첫 차박)",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'noto_sans',
                        color: Colors.white,
                      )),
                ),
                menu("1:1문의하기", () {}),
                menu("이용약관", () {}),
                menu("개인정보", () {}),
              ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 14, 0, 28),
                child: Text("대표자명 : 장문성",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'noto_sans',
                      color: Colors.white,
                    )),
              ),
              infoMenu("사업자 번호 : 000-00-0000"),
              infoMenu("통신판매업 : 000-수원-00000"),
              infoMenu("사업장 : 경기도 성남시 수정구 위례서일로3길 14-13, 1층"),
              infoMenu("대표번호 : 000-0000-0000"),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 14, 0, 28),
                child: Text("이메일 : firstchabak@naver.com",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'noto_sans',
                      color: Colors.white,
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
