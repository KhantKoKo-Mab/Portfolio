import 'package:flutter/material.dart';
import 'package:portfolio/responsive.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class NavBar extends StatefulWidget {
  const NavBar({
    Key? key,
    required this.itemScrollController,
  }) : super(key: key);

  final ItemScrollController itemScrollController;

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;
  int _hoverIndex = -1;

  void _animateToIndex(int index) {
    widget.itemScrollController.scrollTo(
      index: index,
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  Widget _spacer() {
    return SizedBox(
      width: 40,
    );
  }

  Widget mobileNavbar() {
    return Container(
      child: Text("this is mobile"),
    );
  }

  onMenuItemClick(int index) {
    _animateToIndex(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  onHover(int index, bool isHover) {
    setState(() {
      if (isHover)
        _hoverIndex = index;
      else
        _hoverIndex = -1;
    });
  }

  Widget menuItem(
      {required String text, required int index, Function? callback}) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (e) {
        onHover(index, true);
      },
      onExit: (e) {
        onHover(index, false);
      },
      child: GestureDetector(
        onTap: () {
          onMenuItemClick(index);
        },
        child: Text(
          text,
          style: _selectedIndex == index || _hoverIndex == index
              ? Theme.of(context).textTheme.headline6
              : Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Color(0xff293651)),
        ),
      ),
    );
  }

  Widget desktopAndTableNavbar(context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          menuItem(index: 0, text: 'Home'),
          _spacer(),
          menuItem(index: 1, text: 'About'),
          _spacer(),
          menuItem(index: 2, text: 'Experience'),
          _spacer(),
          menuItem(index: 4, text: 'Contact'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: mobileNavbar(),
      tablet: desktopAndTableNavbar(context),
      desktop: desktopAndTableNavbar(context),
    );
  }
}
