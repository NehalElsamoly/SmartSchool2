import 'package:cupertino_date_textbox/cupertino_date_textbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:zahra/core/ulits/const.dart';

// ignore: must_be_immutable
class DatePicker extends StatefulWidget {
    DatePicker({super.key});
  DateTime selectedDateTime = DateTime.now();

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  @override
  Widget build(BuildContext context) {
    return CupertinoDateTextBox(
      fontSize: 18.sp,
      color: kprimarycolor,
      pickerBackgroundColor: textbutton,
      initialValue: widget.selectedDateTime,
      onDateChange: (DateTime birthday) {
        setState(() {
          widget.selectedDateTime = birthday;
        });
      },
      hintText: DateFormat.yMd().format(widget.selectedDateTime),
    );
  }
}
