// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';

class GoldenTestWrapper extends StatelessWidget {
  final Widget child;

  const GoldenTestWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 667,
      color: Colors.black,
      child: child,
    );
  }
}