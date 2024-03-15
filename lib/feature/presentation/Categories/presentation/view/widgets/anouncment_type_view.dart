import 'package:flutter/material.dart';
import 'package:zahra/core/ulits/const.dart';
import 'package:zahra/core/ulits/styles.dart';

class AnouncmentType extends StatelessWidget {
  AnouncmentType({
    super.key,
    this.title,
  });

  String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      height: MediaQuery.of(context).size.height / 22,
      decoration: BoxDecoration(
        color: kprimarycolor,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Text(
          title!,
          style: Styles.style16.copyWith(
            color: textbutton,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
