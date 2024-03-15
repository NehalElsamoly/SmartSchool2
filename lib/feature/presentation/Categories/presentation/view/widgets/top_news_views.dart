import 'package:flutter/material.dart';
import 'package:zahra/core/ulits/const.dart';
import 'package:zahra/core/ulits/styles.dart';

class TopNewsView extends StatelessWidget {
  TopNewsView({
    super.key,
    this.image,
    this.title,
    this.description,
  });

  String? image;
  String? title;
  String? description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3.5,
      height: MediaQuery.of(context).size.height / 5.1,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
      decoration: BoxDecoration(
        color: colorTextField,
        border: Border.all(
          color: border,
          width: 1,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              image??"",
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width / 3.5,
              height: MediaQuery.of(context).size.height / 10.5,
            ),
          ),
          Text(
            title??"",
            style: Styles.style14.copyWith(
              fontWeight: FontWeight.w400,
              color: texttitlecontent,
            ),
          ),
          Text(
            description??"",
            style: Styles.style12.copyWith(
              fontWeight: FontWeight.w400,
              color: textcontent,
            ),
          ),
        ],
      ),
    );
  }
}
