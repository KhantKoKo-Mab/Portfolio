import 'package:flutter/material.dart';
import 'package:portfolio/animation_helper/fade_slide_transaction.dart';
import 'package:portfolio/responsive.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ServicesSection extends StatefulWidget {
  const ServicesSection({Key? key}) : super(key: key);

  @override
  _ServicesSectionState createState() => _ServicesSectionState();
}

class _ServicesSectionState extends State<ServicesSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  bool _isDispose = false;

  @override
  void initState() {
    _animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
    _isDispose = true;
  }

  Widget roundedCard(
      context, IconData icon, String title, String subtitle, int index) {
    double _startAnimation = 0.1 * index;
    double _endAnimation = _startAnimation + 0.7;

    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: (info) {
        if (_isDispose == false) {
          _animationController.forward();
        }
      },
      child: FadeSlideTransaction(
        animationController: _animationController,
        curve: Interval(_startAnimation, _endAnimation, curve: Curves.ease),
        direction: Direction.vertical,
        offset: 2,
        child: Container(
          height: 250,
          width: 345,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.grey.shade500,
                size: 40,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 4,
                    ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                subtitle,
                style: TextStyle(
                  color: Color(0xff293651),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget desktopLayout(context) {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          Text(
            'Services',
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              roundedCard(
                context,
                Icons.desktop_windows_sharp,
                'Application',
                'Fresh and responsive design for all devices.',
                1,
              ),
              SizedBox(
                width: 20,
              ),
              roundedCard(
                context,
                Icons.scatter_plot,
                'Promises',
                'Reliablity, durabilty and customer satisfaction.',
                2,
              ),
              SizedBox(width: 20),
              roundedCard(
                context,
                Icons.code_sharp,
                'Clean Code',
                'Easier to understand, change and maintain with no complexity.',
                3,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget otherLayout(context) {
    return Container(
      margin: const EdgeInsets.all(30),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, //s
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Services',
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 4,
                ),
          ),
          SizedBox(
            height: 30,
          ),
          roundedCard(
            context,
            Icons.desktop_windows_sharp,
            'Application',
            'Fresh and responsive design for all devices.',
            1,
          ),
          SizedBox(
            height: 30,
          ),
          roundedCard(
            context,
            Icons.scatter_plot,
            'Promises',
            'Reliablity, durabilty and customer satisfaction.',
            2,
          ),
          SizedBox(
            height: 30,
          ),
          roundedCard(
            context,
            Icons.code_sharp,
            'Clean Code',
            'Easier to understand, change and maintain with no complexity.',
            3,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      child: Responsive(
        desktop: desktopLayout(context),
        tablet: otherLayout(context),
        mobile: otherLayout(context),
      ),
    );
  }
}
