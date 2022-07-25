import 'package:flutter/material.dart';

class Footer extends StatelessWidget{
  const Footer();

  Widget menu(String Menu, GestureTapCallback onTap){
    return InkWell(
      mouseCursor: MaterialStateMouseCursor.textable,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Text(
        Menu,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Container(
      alignment: Alignment.topCenter,
      color: Color(0xffC2A483),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [menu("공지사항", () {}),menu("공지사항", () {}),menu("공지사항", () {}),menu("공지사항", () {}),]),
          Row(),
        ],
      ),
    );
  }
}