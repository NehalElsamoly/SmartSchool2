import 'package:flutter/material.dart';
import 'package:zahra/core/ulits/const.dart';

class CustomCheckIcon extends StatelessWidget {
  const CustomCheckIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundColor: paymentbackground,
      child: CircleAvatar(
        radius: 40,
        backgroundColor: titlecolor,
        child: Icon(
          Icons.check,
          size: 50,
          color: textbutton,
        ),
      ),
    );
  }
}
