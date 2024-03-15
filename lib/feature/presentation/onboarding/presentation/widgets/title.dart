import 'package:flutter/material.dart';

class Titles extends StatelessWidget {
  Titles(
      {super.key,
      required this.title,
      this.fsize,
      this.ttextcolor,
      this.talign});
  final String title;
  final double? fsize;
  final Color? ttextcolor;
  final TextAlign? talign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: talign,
      style: TextStyle(
        fontSize: fsize,
        fontWeight: FontWeight.bold,
        color: ttextcolor,
        fontFamily: 'Inter',
      ),
    );
  }
}
