import 'package:flutter/material.dart';
import 'package:fchabak/src/components/navigationMenu.dart';
import 'package:fchabak/src/components/footer.dart';

class HomePage extends StatelessWidget {
  HomePage();

  final ScrollController hscrollController = ScrollController();
  final ScrollController vscrollController = ScrollController();

  Widget mainGate(){
    return Container(
      constraints: BoxConstraints(maxWidth: 1280, minWidth: 1280, maxHeight: 960, minHeight: 960),
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.fromLTRB(172, 94, 299, 125),
        child: Placeholder(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Scrollbar(
        controller: hscrollController,
        child: SingleChildScrollView(
            controller: hscrollController,
            scrollDirection: Axis.horizontal,
            child: Scrollbar(
              controller: hscrollController,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                controller: vscrollController,
                child: Column(
                  children: [
                    Container(
                      width: constraints.biggest.width>1920?constraints.biggest.width:1920,
                      color: Color(0xffC2A483),
                      alignment: constraints.biggest.width>1280?Alignment.topCenter:Alignment.topLeft,
                      child: NavigationMenu(),
                    ),
                    Stack(
                      alignment: Alignment.topCenter,
                      children:[
                        Container(
                          alignment: Alignment.topCenter,
                          child: Image.network("https://media.triple.guide/triple-cms/c_limit,f_auto,h_1024,w_1024/7ca25820-a6b4-4d02-9d1f-fa3ea2805c56.jpeg",
                          width: constraints.biggest.width>1920?constraints.biggest.width:1920,
                          height: 960,
                          fit: BoxFit.cover,),
                        ),

                        Container(
                        constraints: BoxConstraints(minWidth: 1280, maxWidth: 1280),
                        alignment: Alignment.topCenter,
                        child: mainGate(),),],
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
                      constraints: BoxConstraints(minWidth: 1280, maxWidth: 1280),
                      alignment: Alignment.topCenter,
                      child: Placeholder(),
                    ),
                    Container(
                      width: constraints.biggest.width>1920?constraints.biggest.width:1920,
                      color: Color(0xffC2A483),
                      alignment: constraints.biggest.width>1280?Alignment.topCenter:Alignment.topLeft,
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
