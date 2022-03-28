import 'package:flutter/material.dart';

enum Direction {
  /// Animate along the vertical y-axis
  vertical,

  /// Animate along the horizontal x-axis
  horizontal,
}

class FadeSlideTransaction extends StatefulWidget {
  const FadeSlideTransaction({
    Key? key,
    required this.animationController,
    required this.curve,
    required this.direction,
    required this.offset,
    required this.child,
  }) : super(key: key);

  final AnimationController animationController;
  final Curve curve;
  final Direction direction;
  final double offset;
  final Widget child;

  @override
  _FadeSlideTransactionState createState() => _FadeSlideTransactionState();
}

class _FadeSlideTransactionState extends State<FadeSlideTransaction> {
  late Animation<Offset> _animationSlide;

  @override
  void initState() {
    //configure the animation controller as per the direction
    if (widget.direction == Direction.vertical) {
      _animationSlide =
          Tween<Offset>(begin: Offset(0, widget.offset), end: Offset(0, 0))
              .animate(CurvedAnimation(
        curve: widget.curve,
        parent: widget.animationController,
      ));
    } else {
      _animationSlide =
          Tween<Offset>(begin: Offset(widget.offset, 0), end: Offset(0, 0))
              .animate(CurvedAnimation(
        curve: widget.curve,
        parent: widget.animationController,
      ));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween<double>(begin: -1.0, end: 1.0).animate(
        CurvedAnimation(
          curve: widget.curve,
          parent: widget.animationController,
        ),
      ),
      child: SlideTransition(
        position: _animationSlide,
        child: widget.child,
      ),
    );
  }
}
