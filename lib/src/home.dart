import 'package:flutter/material.dart';
import 'package:fchabak/src/navigationMenu.dart';
import 'package:fchabak/src/footer.dart';

class HomePage extends StatelessWidget{
  const HomePage();

  Widget _contents(){
    return Placeholder();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        child: Column(
          children: [NavigationMenu(),
          Expanded(child: _contents()),
          Footer(),],
      ),
    ));
  }
}