import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/responsive.dart';

class SkillSection extends StatelessWidget {
  const SkillSection({Key? key}) : super(key: key);

  Widget skillPercentMobile(context, title, double percent) {
    var mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    print(mediaQuery.size.width);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center, //remove
      children: [
        skillTitle(title),
        skillPercentBar(context, percent, width),
      ],
    );
  }

  Widget skillTitle(String title, {double? textWidth = double.infinity}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: textWidth,
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Color(0xff293651),
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget skillPercentBar(context, double percent, double barWidth) {
    return FittedBox(
      child: Stack(
        children: [
          Container(
            width: barWidth,
            height: 13,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Container(
            width: (percent / 100) * barWidth,
            height: 15,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Positioned(
            left: barWidth / 2,
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
    );
  }

  Widget skillPercent(context, String title, double percent) {
    double width = Responsive.isTablet(context) ? 350 : 350;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, //remove
      children: [
        skillTitle(title, textWidth: 150),
        skillPercentBar(context, percent, width),
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
          Icon(
            FontAwesomeIcons.circleCheck,
            color: Theme.of(context).primaryColor,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color(0xff293651),
              fontSize: Responsive.isMobile(context) ? 16 : 18,
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
        expertItem(context, 'Database Management'),
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
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Expertize',
          style: Theme.of(context).textTheme.headline3!.copyWith(
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
                style: Theme.of(context).textTheme.headline3!.copyWith(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, //s
        children: [
          Text(
            'Skills',
            style: Theme.of(context).textTheme.headline3!.copyWith(
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
        crossAxisAlignment: CrossAxisAlignment.start, //s
        children: [
          Text(
            'Skills',
            style: Theme.of(context).textTheme.headline3!.copyWith(
                  letterSpacing: 4,
                ),
          ),
          SizedBox(
            height: 30,
          ),
          skillPercentMobile(context, "C#", 85),
          skillPercentMobile(context, "Flutter", 70),
          skillPercentMobile(context, "Java", 65),
          skillPercentMobile(context, "Angular", 60),
          skillPercentMobile(context, "HTML, CSS, JS", 75),
          skillPercentMobile(context, "SQL", 80),
          SizedBox(
            height: 30,
          ),
          Text(
            'Expertize',
            style: Theme.of(context).textTheme.headline3!.copyWith(
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
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      child: Responsive(
        desktop: desktopLayout(context),
        tablet: tabletLayout(context),
        mobile: mobileLayout(context),
      ),
    );
  }
}
