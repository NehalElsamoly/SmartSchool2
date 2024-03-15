import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zahra/core/ulits/const.dart';
import 'package:zahra/core/ulits/styles.dart';

class CategoriesListItems extends StatelessWidget {
  CategoriesListItems({super.key, this.itemtitle, this.icon});
  String? itemtitle;
  String? icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          width: 30,
        ),
        Container(
          padding:EdgeInsets.all(10.0),
          color:iconcategory,
          child: SvgPicture.asset(
            icon!,
          ),
        ),
        const SizedBox(
          width: 50,
        ),
        Text(
          itemtitle!,
          style: Styles.style18.copyWith(
            color: texttitlecontent,
            fontSize: 20.sp
          ),
          // 
        )
      ],
    );
  }
}
