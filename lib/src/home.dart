import 'package:flutter/material.dart';
import 'package:fchabak/src/navigationMenu.dart';
import 'package:fchabak/src/footer.dart';

class HomePage extends StatelessWidget {
  HomePage();

  Widget _contents() {
    return Placeholder();
  }

  final ScrollController hscrollController = ScrollController();
  final ScrollController vscrollController = ScrollController();

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
                      width: constraints.biggest.width>1280?constraints.biggest.width:1280,
                      color: Color(0xffC2A483),
                      alignment: constraints.biggest.width>1280?Alignment.topCenter:Alignment.topLeft,
                      child: NavigationMenu(),
                    ),
                    Container(
                        constraints: BoxConstraints(minWidth: 1280, maxWidth: 1280),
                        alignment: Alignment.topCenter,
                        child: ConstrainedBox(
                            constraints: BoxConstraints(
                                maxWidth: 1280,
                                minWidth: 1280,
                            minHeight: constraints.biggest.height),
                            child: _contents()),),
                    Footer(),
                  ],
                ),
              ),
            )),
      );
    }));

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: Scrollbar(
//       controller: vscrollController,
//       child: SingleChildScrollView(
//           controller: vscrollController,
//           scrollDirection: Axis.vertical,
//           child: Scrollbar(
//             controller: hscrollController,
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               controller: hscrollController,
//               child: Column(
//                 children: [
//                   NavigationMenu(),
//                   Container(child: _contents()),
//                   Footer(),
//                 ],
//               ),
//             ),
//           )),
//     ),
//   );
// }
  }
}
