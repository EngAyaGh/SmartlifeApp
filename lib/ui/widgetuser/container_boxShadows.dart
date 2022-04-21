import 'package:flutter/material.dart';

class ContainerShadows extends StatelessWidget {
  double? width;
  double? height;
  Widget child;
  EdgeInsets? margin;

  ContainerShadows(
      {this.width, this.height, required this.child, this.margin, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
          ),
        ],
      ),
      child: child,
    );
  }
}
