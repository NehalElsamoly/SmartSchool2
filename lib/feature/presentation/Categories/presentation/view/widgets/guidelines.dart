import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zahra/core/ulits/const.dart';
import 'package:zahra/core/ulits/styles.dart';

class GuideLine extends StatelessWidget {
  const GuideLine({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          lineSvg,
          height:  MediaQuery.of(context).size.height / 30,
          width:  MediaQuery.of(context).size.width / 20,
        ),
        SizedBox(width:  MediaQuery.of(context).size.width / 20),
        Flexible(
          child: Text(
            description,
            overflow: TextOverflow.clip,
            maxLines: 4,
            style: Styles.style14.copyWith(
              color: text,
            ),
          ),
        ),
      ],
    );
  }
}
