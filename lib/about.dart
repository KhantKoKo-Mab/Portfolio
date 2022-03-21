import 'package:flutter/material.dart';
import 'package:portfolio/responsive.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  Widget skillPercent(context, String title, double percent) {
    double width = Responsive.isTablet(context)
        ? 400
        : Responsive.isMobile(context)
            ? 250
            : 300;
    return Row(
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

  Widget skillsWidget(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'About',
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                letterSpacing: 4,
              ),
        ),
        SizedBox(
          height: 30,
        ),
        skillPercent(context, "C#", 86),
        skillPercent(context, "Flutter", 70),
        skillPercent(context, "Java", 65),
        skillPercent(context, "Angular", 60),
        skillPercent(context, "HTML, CSS, JS", 75),
      ],
    );
  }

  Widget expertItem(context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/tick_mark.png',
            width: 18,
            height: 18,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            title,
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
        expertItem(context, 'ERP System Knowledge'),
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

  Widget desktopAbout(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        skillsWidget(context),
        SizedBox(
          width: 50,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50.0),
          child: expertizeWidget(context),
        ),
      ],
    );
  }

  Widget tabletAbout(context) {
    return Container(
      margin: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          skillsWidget(context),
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
            mainAxisAlignment: MainAxisAlignment.start,
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

  Widget mobileAbout(context) {
    return Container(
      margin: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          skillsWidget(context),
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
          expertItemGroup1(context),
          SizedBox(
            width: 80,
          ),
          expertItemGroup2(context),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Responsive.isDesktop(context)
          ? const EdgeInsets.only(top: 30, bottom: 30)
          : EdgeInsets.all(0),
      child: Responsive(
        desktop: desktopAbout(context),
        mobile: mobileAbout(context),
        tablet: tabletAbout(context),
      ),
    );
  }
}
