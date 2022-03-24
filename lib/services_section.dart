import 'package:flutter/material.dart';
import 'package:portfolio/responsive.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({Key? key}) : super(key: key);

  Widget roundedCard(context, IconData icon, String title, String subtitle) {
    return Container(
      height: 250,
      width: 350,
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
                  fontSize: 30,
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
              roundedCard(context, Icons.desktop_windows_sharp, 'Application',
                  'Fresh and responsive design for all devices.'),
              SizedBox(
                width: 20,
              ),
              roundedCard(context, Icons.scatter_plot, 'Promises',
                  'Reliablity, durabilty and customer satisfaction.'),
              SizedBox(width: 20),
              roundedCard(context, Icons.code_sharp, 'Clean Code',
                  'Easier to understand, change and maintain with no complexity.'),
            ],
          ),
        ],
      ),
    );
  }

  Widget otherLayout(context) {
    return Container(
      //margin: const EdgeInsets.all(30),
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
          roundedCard(context, Icons.desktop_windows_sharp, 'Application',
              'Fresh and responsive design for all devices.'),
          SizedBox(
            height: 30,
          ),
          roundedCard(context, Icons.scatter_plot, 'Promises',
              'Reliablity, durabilty and customer satisfaction.'),
          SizedBox(
            height: 30,
          ),
          roundedCard(context, Icons.code_sharp, 'Clean Code',
              'Easier to understand, change and maintain with no complexity.'),
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
