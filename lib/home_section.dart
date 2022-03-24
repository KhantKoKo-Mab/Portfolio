import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constant.dart';
import 'package:portfolio/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeSection extends StatefulWidget {
  const HomeSection({Key? key}) : super(key: key);

  @override
  _HomeSectionState createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> {
  void _launchMail() async {
    const mailUrl = 'mailto:triplek07@gmail.com';
    try {
      await launch(mailUrl);
    } catch (e) {
      print('error email');
    }
  }

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
              _launchMail();
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
    return Stack(children: [
      Container(
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
      ),
      if (MediaQuery.of(context).size.width >= 1280)
        Positioned(
          child: socialLinksGroup(),
          top: 290,
          left: 50,
        ),
    ]);
  }

  Widget otherLayout(context) {
    return Container(
      margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          profileText(context),
          SizedBox(
            height: 30,
          ),
          profileImage(context),
        ],
      ),
    );
  }

  Widget socialLink(IconData icon, String linkUrl) {
    return GestureDetector(
      onTap: () async {
        if (!await launch(linkUrl)) throw 'Could not launch $linkUrl';
      },
      child: Container(
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Icon(
            icon,
            color: Colors.grey.shade400,
          ),
        ),
      ),
    );
  }

  Widget socialLinksGroup() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade400,
        ),
        borderRadius: BorderRadius.circular(20),
        color: Colors.transparent,
      ),
      child: Column(
        children: [
          socialLink(FontAwesomeIcons.facebookF, kFacebookLink),
          SizedBox(
            height: 40,
          ),
          socialLink(FontAwesomeIcons.instagram, kInstergramLink),
          SizedBox(
            height: 40,
          ),
          socialLink(FontAwesomeIcons.twitter, kTwitterLink),
          SizedBox(
            height: 40,
          ),
          socialLink(FontAwesomeIcons.linkedinIn, kLinkedinLink),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Responsive(
        desktop: desktopLayout(context),
        tablet: otherLayout(context),
        mobile: otherLayout(context),
      ),
    );
  }
}
