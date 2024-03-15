import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zahra/core/ulits/const.dart';
import 'package:zahra/core/ulits/styles.dart';

class Advertisement extends StatelessWidget {
  Advertisement(
      {super.key, required this.documentimage, required this.onpressed});
  String? documentimage;
  VoidCallback? onpressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            margin: const EdgeInsets.only(right: 14.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Tooltip(
                message: 'zahra',
                child: Image.asset(
                  documentimage!,
                  fit: BoxFit.contain,
                  width: MediaQuery.of(context).size.width / 1.3,
                  height: MediaQuery.of(context).size.height / 1.8,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ElevatedButton(
            onPressed: onpressed!,
            style: ElevatedButton.styleFrom(
              backgroundColor: kprimarycolor,
              minimumSize: Size(
                  double.infinity, MediaQuery.of(context).size.height / 17),
            ),
            child: Text(
              "pay",
              style: Styles.style18.copyWith(
                color: textbutton,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
