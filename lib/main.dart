import 'package:flutter/material.dart';
import 'package:portfolio/services_section.dart';
import 'package:portfolio/skill_section.dart';
import 'package:portfolio/home_section.dart';
import 'package:portfolio/navbar.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      theme: ThemeData(
          //primarySwatch: Colors.blue,
          primaryColor: Color(0xff00a78e),
          textTheme: TextTheme(
            headline6: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Color(0xff00a78e),
            ),
          )),
      home: MyHomePage(title: 'Khant Ko Ko'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ItemScrollController _itemScrollController = new ItemScrollController();

  Widget body() {
    return Container(
      child: ScrollablePositionedList.builder(
        itemScrollController: _itemScrollController,
        itemCount: 5,
        itemBuilder: (_, i) {
          if (i == 0)
            return Container(
              width: double.infinity,
              child: HomeSection(),
            );
          if (i == 1)
            return Container(
              width: double.infinity,
              child: Column(
                children: [
                  SkillSection(),
                  ServicesSection(),
                ],
              ),
            );
          return Container();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var lrMargin = mediaQuery.width / 5;
    // print(mediaQuery);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: mediaQuery.width >= 1100
          ? AppBar(
              backgroundColor: Colors.white,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: lrMargin * 1.3,
                  ),
                  SizedBox(
                    //width: 400,
                    child: Text(
                      mediaQuery.width.toString(),
                      style: Theme.of(context).textTheme.headline6!,
                    ),
                  ),
                  NavBar(
                    itemScrollController: _itemScrollController,
                  ),
                  Container(
                    width: lrMargin,
                  ),
                ],
              ),
            )
          : null,
      body: SafeArea(
        child: body(),
      ),
    );
  }
}
