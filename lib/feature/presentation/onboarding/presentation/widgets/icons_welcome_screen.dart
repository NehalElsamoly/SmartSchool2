import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zahra/core/ulits/const.dart';

class IconsfirstScreen extends StatelessWidget {
  IconsfirstScreen({
    required this.iconAsset,
    required this.nIcon,
    this.start,
  });
  final String nIcon;
  final String iconAsset;
  final VoidCallback? start;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: start,
      child: CircleAvatar(
        backgroundColor: const Color(0xFF52AEB0).withOpacity(0.3),
        radius: 40.sp,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 80,
            ),
            SvgPicture.asset(
              iconAsset,
              height: 25.h,
            ),
            Text(
              nIcon,
              style: TextStyle(fontSize: 16.sp, color: texticon),
            )
          ],
        ),
      ),
    );
  }
}
