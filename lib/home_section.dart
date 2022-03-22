import 'package:flutter/material.dart';
import 'package:portfolio/responsive.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({Key? key}) : super(key: key);

  Widget profileText(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Hello I\'m',
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                letterSpacing: 4,
              ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: const Text(
            'Khant Ko Ko',
            style: TextStyle(
              color: Color(0xff293651),
              fontSize: 50,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 20),
          child: const Text(
            'Professional Full Stack Developer',
            style: TextStyle(
              color: Color(0xff293651),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Text(
          'Innovative, task-driven professional with 7+ years of experience in \nWindows, Web, Mobile development across all site of industries.\nEquipped with a record of success in consistently identifying and providing the teachnological needs of companies through ingenious innovation.',
          style: const TextStyle(
            color: Color(0xff293651),
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.7,
          ),
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              print('click hire me');
            },
            child: Container(
              margin: const EdgeInsets.only(top: 20.0),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              child: const Text(
                'Hire Me',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    letterSpacing: 1.5),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget profileImage(context) {
    return Container(
      margin: EdgeInsets.only(top: Responsive.isDesktop(context) ? 130 : 0),
      height: Responsive.isDesktop(context)
          ? (1007 - (130 + MediaQuery.of(context).padding.top + kToolbarHeight))
          : 600,
      child: Image.asset(
        'assets/images/hero.png',
        width: 550,
        height: 825,
        fit: Responsive.isDesktop(context) ? BoxFit.cover : BoxFit.scaleDown,
      ),
    );
  }

  Widget desktopLayout(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Theme.of(context).primaryColor,
          ],
          stops: [0.47, 0.47],
          //begin: Alignment.bottomLeft,
          //end: Alignment.topRight,
          begin: Alignment(-1, 0.3),
          end: Alignment(1, -1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 500,
            child: profileText(context),
          ),
          const SizedBox(
            width: 20,
          ),
          profileImage(context),
        ],
      ),
    );
  }

  Widget otherLayout(context) {
    return Container(
      margin: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Container(
                alignment: Alignment.topRight,
                child: const Icon(
                  Icons.menu_outlined,
                  size: 30,
                  color: Color(0xff293651),
                ),
              ),
            ],
          ),
          profileText(context),
          SizedBox(
            height: 30,
          ),
          profileImage(context),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Responsive(
        desktop: desktopLayout(context),
        tablet: otherLayout(context),
        mobile: otherLayout(context),
      ),
    );
  }
}
