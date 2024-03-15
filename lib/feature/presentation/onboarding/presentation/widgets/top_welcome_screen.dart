import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zahra/core/ulits/const.dart';
import 'package:zahra/feature/presentation/onboarding/presentation/widgets/title.dart';

class TopFirstscreen extends StatelessWidget {
  const TopFirstscreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            left: MediaQuery.of(context).size.width / 2.5,
            top: MediaQuery.of(context).size.height / 15,
            child: SvgPicture.asset(
              logoIc,
              height: MediaQuery.of(context).size.height / 8,
            )),
        Positioned(
            right: MediaQuery.of(context).size.width / 15,
            top: MediaQuery.of(context).size.height / 20,
            child: SvgPicture.asset(
              translateIc,
              height: MediaQuery.of(context).size.height / 22,
            )),
        Positioned(
            left: MediaQuery.of(context).size.width / 6.2,
            top: MediaQuery.of(context).size.height / 4.9,
            child: SvgPicture.asset(heartIc)),
        Positioned(
          left: MediaQuery.of(context).size.width / 4,
          top: MediaQuery.of(context).size.height / 5.2,
          child: Titles(
            title: welcom1,
            fsize: 35.sp,
            ttextcolor: titlecolor,
          ),
        ),
        Positioned(
          left: -MediaQuery.of(context).size.width / 10,
          top: -MediaQuery.of(context).size.height / 4.9,
          child: Container(
            width: MediaQuery.of(context).size.width * 1.25,
            height: MediaQuery.of(context).size.height / 1.9,
            decoration: ShapeDecoration(
              color: const Color(0x00D9D9D9),
              shape: OvalBorder(
                side: BorderSide(
                    width: MediaQuery.of(context).size.width / 90,
                    color: const Color(0xFF52AEB0)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
