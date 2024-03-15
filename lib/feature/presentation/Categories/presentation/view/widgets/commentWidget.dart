import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zahra/core/ulits/const.dart';
import 'package:zahra/core/ulits/styles.dart';

class SingleComment extends StatelessWidget {
  SingleComment(
      {super.key,
      required this.auther,
      required this.comment,
      required this.imageauther});

  final String auther;
  final String imageauther;
  final String comment;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorTextField,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                imageauther,
                height: MediaQuery.of(context).size.height / 21,
                width: MediaQuery.of(context).size.width / 10,
                fit: BoxFit.fill,
              ),
              Spacer(
                flex: 1,
              ),
              Text(
                auther,
                style: Styles.style18.copyWith(
                  color: texttitlecontent,
                ),
              ),
              Spacer(
                flex: 12,
              ),
              Icon(
                Icons.more_horiz,
                color: kprimarycolor,
                size: 20.sp,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            child: Text(
              comment,
              style: Styles.style12.copyWith(
                color: textsmall,
                fontSize: 13.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
