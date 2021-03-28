import 'package:flutter/material.dart';

class ElevatedContainer extends StatelessWidget {
  const ElevatedContainer({
    this.width = double.maxFinite,
    this.height,
    this.radius = 4.0,
    this.color = Colors.black12,
    this.fillColor = Colors.white,
    this.gradient,
    this.padding = EdgeInsets.zero,
    required this.child,
  });

  final double width;
  final double? height;
  final double radius;
  final Color color;
  final Color fillColor;
  final Gradient? gradient;
  final EdgeInsets padding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: fillColor,
        gradient: gradient,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0.0, 1.0),
            color: color,
          ),
        ],
      ),
      child: Container(
        clipBehavior: Clip.antiAlias,
        margin: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
        child: child,
      ),
    );
  }
}
