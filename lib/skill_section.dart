import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/responsive.dart';

class SkillSection extends StatelessWidget {
  const SkillSection({Key? key}) : super(key: key);

  Widget skillPercent(context, String title, double percent) {
    double width = Responsive.isTablet(context)
        ? 400
        : Responsive.isMobile(context)
            ? 250
            : 300;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, //remove
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Container(
            width: 150,
            child: Text(
              title,
              style: TextStyle(
                color: Color(0xff293651),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Stack(
          children: [
            Container(
              width: width,
              height: 13,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            Container(
              width: (percent / 100) * width,
              height: 13,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            Positioned(
              left: width / 2,
              child: Text(
                '${percent.toString()}%',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget expertItem(context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image.asset(
          //   'assets/images/tick_mark.png',
          //   width: 18,
          //   height: 18,
          // ),
          Icon(FontAwesomeIcons.circleCheck,
              color: Theme.of(context).primaryColor),
          SizedBox(
            width: 10,
          ),
          Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color(0xff293651),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget expertItemGroup1(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        expertItem(context, 'Database Management (MSSQL)'),
        expertItem(context, 'Azure Cloud'),
        expertItem(context, 'Power BI'),
        expertItem(context, 'Data Centralization'),
        expertItem(context, 'Data Migration'),
        expertItem(context, 'Replication & Mirroring'),
      ],
    );
  }

  Widget expertItemGroup2(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        expertItem(context, 'App Development'),
        expertItem(context, 'Mobile Development'),
        expertItem(context, 'Web Development'),
        expertItem(context, 'ERP & Retails'),
        expertItem(context, 'Photoshop'),
        expertItem(context, 'Graphic Design'),
      ],
    );
  }

  Widget expertizeWidget(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Expertize',
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                letterSpacing: 4,
              ),
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            expertItemGroup1(context),
            SizedBox(
              width: 50,
            ),
            expertItemGroup2(context),
          ],
        ),
      ],
    );
  }

  Widget desktopLayout(context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Skills',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 4,
                    ),
              ),
              SizedBox(
                height: 30,
              ),
              skillPercent(context, "C#", 85),
              skillPercent(context, "Flutter", 70),
              skillPercent(context, "Java", 65),
              skillPercent(context, "Angular", 60),
              skillPercent(context, "HTML, CSS, JS", 75),
              skillPercent(context, "SQL", 80),
            ],
          ),
          SizedBox(
            width: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: expertizeWidget(context),
          ),
        ],
      ),
    );
  }

  Widget tabletLayout(context) {
    return Container(
      margin: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, //s
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center, //s
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Skills',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 4,
                    ),
              ),
              SizedBox(
                height: 30,
              ),
              skillPercent(context, "C#", 85),
              skillPercent(context, "Flutter", 70),
              skillPercent(context, "Java", 65),
              skillPercent(context, "Angular", 60),
              skillPercent(context, "HTML, CSS, JS", 75),
              skillPercent(context, "SQL", 80),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Expertize',
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 4,
                ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              expertItemGroup1(context),
              SizedBox(
                width: 80,
              ),
              expertItemGroup2(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget mobileLayout(context) {
    return Container(
      margin: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, //s
        children: [
          Text(
            'Skills',
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 4,
                ),
          ),
          SizedBox(
            height: 30,
          ),
          skillPercent(context, "C#", 85),
          skillPercent(context, "Flutter", 70),
          skillPercent(context, "Java", 65),
          skillPercent(context, "Angular", 60),
          skillPercent(context, "HTML, CSS, JS", 75),
          skillPercent(context, "SQL", 80),
          SizedBox(
            height: 30,
          ),
          Text(
            'Expertize',
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 4,
                ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: expertItemGroup1(context),
            width: 400,
          ),
          SizedBox(
            width: 80,
          ),
          Container(
            child: expertItemGroup2(context),
            width: 400,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Color(0xfff9f9f9),
      margin: Responsive.isDesktop(context)
          ? const EdgeInsets.only(top: 30, bottom: 30)
          : EdgeInsets.all(0),
      child: Responsive(
        desktop: desktopLayout(context),
        tablet: tabletLayout(context),
        mobile: mobileLayout(context),
      ),
    );
  }
}
