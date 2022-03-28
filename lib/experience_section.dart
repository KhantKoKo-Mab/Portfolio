import 'package:flutter/material.dart';
import 'package:portfolio/animation_helper/fade_slide_transaction.dart';
import 'package:portfolio/icon_indicator.dart';
import 'package:portfolio/responsive.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ExperienceSection extends StatefulWidget {
  const ExperienceSection({Key? key}) : super(key: key);

  @override
  _ExperienceSectionState createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection>
    with SingleTickerProviderStateMixin {
  String _hoverIndex = "";

  late AnimationController _animationController;
  bool _isDispose = false;

  @override
  void initState() {
    _animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 2));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
    _isDispose = true;
  }

  Widget _buildTimeline(
    context, {
    required String indexTitle,
    required Widget startWidget,
    required Widget endWidget,
  }) {
    Color fillColor = _hoverIndex == indexTitle
        ? Theme.of(context).primaryColor
        : Colors.white;
    Color textColor = _hoverIndex == indexTitle
        ? Colors.white
        : Theme.of(context).primaryColor;

    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _hoverIndex = indexTitle;
        });
      },
      onExit: (event) {
        setState(() {
          _hoverIndex = "";
        });
      },
      child: Container(
        height: 220,
        width: 900,
        child: TimelineTile(
          axis: TimelineAxis.vertical,
          alignment: TimelineAlign.center,
          indicatorStyle: IndicatorStyle(
            color: Theme.of(context).primaryColor,
            indicator: IconIndicator(
              title: indexTitle,
              size: 20,
              fillColor: fillColor,
              textColor: textColor,
            ),
            height: 60,
            width: 60,
          ),
          beforeLineStyle:
              LineStyle(color: Theme.of(context).primaryColor, thickness: 2),
          startChild: Container(
            color: Colors.transparent,
            child: startWidget,
          ),
          endChild: Container(
            constraints: const BoxConstraints(
              minWidth: 200,
            ),
            color: Colors.transparent,
            child: endWidget,
          ),
        ),
      ),
    );
  }

  Widget timelineCard({
    required String indexTitle,
    required String content,
  }) {
    Color fillColor = _hoverIndex == indexTitle
        ? Theme.of(context).primaryColor
        : Colors.white;
    Color textColor =
        _hoverIndex == indexTitle ? Colors.white : Colors.grey.shade600;

    int index = int.parse(indexTitle);
    double _startAnimation = 0.1 * index;
    double _endAnimation = _startAnimation + 0.5;

    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: (info) {
        if (!_isDispose) {
          _animationController.forward();
        }
      },
      child: FadeSlideTransaction(
        animationController: _animationController,
        curve: Interval(
          _startAnimation,
          _endAnimation,
          curve: Curves.ease,
        ),
        direction: Direction.horizontal,
        offset: 0.1,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          padding: const EdgeInsets.all(20),
          child: Text(
            content,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: textColor,
                ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: fillColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget timelineWithoutCard(context,
      {required String title,
      required String subtitle,
      required String dateTime,
      required CrossAxisAlignment alignment}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        crossAxisAlignment: alignment,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: Colors.black.withOpacity(0.7)),
            textAlign: (alignment == CrossAxisAlignment.end)
                ? TextAlign.end
                : TextAlign.start,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.headline6,
            textAlign: (alignment == CrossAxisAlignment.end)
                ? TextAlign.end
                : TextAlign.start,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            dateTime,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.grey.shade600),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget desktopLayout() {
    return Column(
      children: [
        Text('Experience', style: Theme.of(context).textTheme.headline3),
        _buildTimeline(
          context,
          indexTitle: "01",
          startWidget: timelineCard(
            content:
                "Develop in-house projects using Flutter, Angular, Java (Spring Boot), Oracle Database and WebLogic Server.",
            indexTitle: "01",
          ),
          endWidget: timelineWithoutCard(context,
              title: "Senior Business Anaylst",
              subtitle: "Myanmar Apex Bank",
              dateTime: "Jan 2021 - Current",
              alignment: CrossAxisAlignment.start),
        ),
        _buildTimeline(
          context,
          indexTitle: "02",
          startWidget: timelineWithoutCard(context,
              title: "Senior Software Engineer",
              subtitle: "Myanmar Information Technology",
              dateTime: "Jan 2016 - Jan 2021",
              alignment: CrossAxisAlignment.end),
          endWidget: timelineCard(
            content:
                "Handling the local biggest market retail systems, ERP and making business insight, sales forcasting using Azure, Power BI and Power Apps.",
            indexTitle: "02",
          ),
        ),
        _buildTimeline(
          context,
          indexTitle: "03",
          startWidget: timelineCard(
            content:
                "Devloping transportation management system and cheque issuing system including problem solving and customization.",
            indexTitle: "03",
          ),
          endWidget: timelineWithoutCard(context,
              title: "Junior Software Developer",
              subtitle: "System Gear",
              dateTime: "2014 - 2016",
              alignment: CrossAxisAlignment.start),
        ),
        _buildTimeline(
          context,
          indexTitle: "04",
          startWidget: timelineWithoutCard(context,
              title: "Junior Software Developer",
              subtitle: "devnet Solution Provider",
              dateTime: "2013 - 2014",
              alignment: CrossAxisAlignment.end),
          endWidget: timelineCard(
            content:
                "Develope ERP, retail systems and websites using ASP.Net and .Net.",
            indexTitle: "04",
          ),
        ),
      ],
    );
  }

  Widget mobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child:
              Text('Experience', style: Theme.of(context).textTheme.headline3),
        ),
        timelineWithoutCard(context,
            title: "Senior Business Anaylst",
            subtitle: "Myanmar Apex Bank",
            dateTime: "Jan 2021 - Current",
            alignment: CrossAxisAlignment.start),
        timelineCard(
          content:
              "Develop in-house projects using Flutter, Angular, Java (Spring Boot), Oracle Database and WebLogic Server.",
          indexTitle: "01",
        ),
        SizedBox(
          height: 30,
        ),
        timelineWithoutCard(context,
            title: "Senior Software Engineer",
            subtitle: "Myanmar Information Technology",
            dateTime: "Jan 2016 - Jan 2021",
            alignment: CrossAxisAlignment.start),
        timelineCard(
          content:
              "Handling the local biggest market retail systems, ERP and making business insight, sales forcasting using Azure, Power BI and Power Apps.",
          indexTitle: "02",
        ),
        SizedBox(
          height: 30,
        ),
        timelineWithoutCard(context,
            title: "Junior Software Developer",
            subtitle: "System Gear",
            dateTime: "2014 - 2016",
            alignment: CrossAxisAlignment.start),
        timelineCard(
          content:
              "Devloping transportation management system and cheque issuing system including problem solving and customization.",
          indexTitle: "03",
        ),
        SizedBox(
          height: 30,
        ),
        timelineWithoutCard(context,
            title: "Junior Software Developer",
            subtitle: "devnet Solution Provider",
            dateTime: "2013 - 2014",
            alignment: CrossAxisAlignment.start),
        timelineCard(
          content:
              "Develope ERP, retail systems and websites using ASP.Net and .Net.",
          indexTitle: "04",
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      width: double.infinity,
      child: Responsive(
        mobile: mobileLayout(),
        tablet: desktopLayout(),
        desktop: desktopLayout(),
      ),
    );
  }
}
