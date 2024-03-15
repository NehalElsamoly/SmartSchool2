import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zahra/core/ulits/const.dart';

import '../../../data/model/getlevels.dart';
import '../../../manager3/RegisterCubit.dart';
//
// class Seletor extends StatefulWidget {
//   Seletor({super.key, required this.hinttext, required this.items});
//   final String? hinttext;
//   //String? selectedValue;
//   List<String> items;
//
//   @override
//   State<Seletor> createState() => _SeletorState();
// }
//
// class _SeletorState extends State<Seletor> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         width: 500.r,
//         height: 600.h,
//         decoration: BoxDecoration(
//           color: textbutton,
//           border: Border.all(width: 0.25),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: DropdownButtonHideUnderline(
//           child: DropdownButton2(
//             // barrierColor: titlecolor,
//             iconStyleData:const IconStyleData(
//                 icon: Icon(
//               Icons.arrow_drop_down,
//               color: titlecolor,
//             )),
//             hint: Text(
//               widget.hinttext!,
//               style: TextStyle(
//                 fontSize: 20.sp,
//                 color: titlecolor,
//               ),
//             ),
//             items: widget.items
//                 .map((item) => DropdownMenuItem<String>(
//                       value: item,
//                       child: Text(
//                         item,
//                         style: TextStyle(
//                             color: titlecolor,
//                             fontSize: 20.sp,
//                             fontWeight: FontWeight.w500),
//                       ),
//                     ))
//                 .toList(),
//             value: context.read<AuthCubit2>().selectedValue,
//             onChanged: (value) {
//               setState(() {
//                 context.read<AuthCubit2>().selectedValue = value as String;
//               });
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
class Seletor extends StatefulWidget {
  Seletor({super.key, required this.hinttext, required this.levels});
  final String? hinttext;
  List<Level> levels;

  @override
  State<Seletor> createState() => _SeletorState();
}

class _SeletorState extends State<Seletor> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 500.r,
        height: 600.h,
        decoration: BoxDecoration(
          color: textbutton,
          border: Border.all(width: 0.25),
          borderRadius: BorderRadius.circular(10),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton2(
            iconStyleData: const IconStyleData(
              icon: Icon(
                Icons.arrow_drop_down,
                color: titlecolor,
              ),
            ),
            hint: Text(
              widget.hinttext!,
              style: TextStyle(
                fontSize: 20.sp,
                color: titlecolor,
              ),
            ),
            items: widget.levels
                .map((level) => DropdownMenuItem<String>(
              value: level.id,
              child: Text(
                level.levelName,
                style: TextStyle(
                  color: titlecolor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ))
                .toList(),
            value: context.read<AuthCubit2>().selectedValue,
            onChanged: (value) {
              setState(() {
                context.read<AuthCubit2>().selectedValue = value as String;
              });
            },
          ),
        ),
      ),
    );
  }
}
