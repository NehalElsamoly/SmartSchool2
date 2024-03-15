import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Information extends StatelessWidget {
  const Information(
      {super.key, required this.title, required this.description, required this.icon});

  final String title;
  final String description;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            icon,
            SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                color: Color(0xffA0A2B3),
                fontSize: 17.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
        TextField(
          style: TextStyle(
            color: Color(0xffA0A2B3),
            fontSize: 14.sp,
          ),
          decoration: InputDecoration(
            labelText: description,
            enabled: false, 
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height / 30,),
      ],
    );
  }
}
