import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zahra/core/ulits/const.dart';
import 'package:zahra/feature/presentation/auth/login/presentation/views/loginscreen.dart';
import 'package:zahra/feature/presentation/onboarding/presentation/widgets/title.dart';

import '../../../register/presentation/reg/widgets/massage_widget.dart';

class Massage extends StatelessWidget {
  const Massage({
    super.key,
  });
  static String id = 'Massage page';

  @override
  Widget build(BuildContext context) {
    return MassageWidget(
      massageic: iconregisterIc,
      contant: "Your Password has been successfully changed.",
      title: "Complete",
      buttonText: "Login",
      foundButton: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
      },
    );

    // return Scaffold(
    //   body: AlertDialog(
    //     backgroundColor: Colors.white,
    //     title: SvgPicture.asset(
    //       massageic!,
    //       height: MediaQuery.of(context).size.height / 10,
    //     ),
    //     // titlePadding: const EdgeInsets.only(top: 50),
    //     content: SingleChildScrollView(
    //       child: ListBody(children: [
    //         Center(
    //           child: Titles(
    //             title: title!,
    //             fsize: 30.sp,
    //             ttextcolor: const Color(0xff777A95),
    //           ),
    //         ),
    //         SizedBox(
    //           height: MediaQuery.of(context).size.height / 30,
    //         ),
    //         Padding(
    //           padding: EdgeInsets.symmetric(
    //             horizontal: MediaQuery.of(context).size.width / 40,
    //           ),
    //           child: TextContent(contant: contant!, textalign: TextAlign.center),
    //         ),
    //         SizedBox(
    //           height: MediaQuery.of(context).size.height / 30,
    //         ),
    //         Padding(
    //           padding: EdgeInsets.symmetric(
    //               horizontal: MediaQuery.of(context).size.width / 5),
    //           child: CustomButton(
    //             tbutton: "Login",
    //             hbutton: MediaQuery.of(context).size.height / 15,
    //             wbutton: MediaQuery.of(context).size.width / 20,
    //             colorbutton: kprimarycolor,
    //             founbutton: () {
    //               Navigator.push(context,
    //                   MaterialPageRoute(builder: (context) => Login()));
    //             },
    //           ),
    //         ),
    //         SizedBox(
    //           height: MediaQuery.of(context).size.height / 30,
    //         )
    //       ]),
    //     ),
    //     contentPadding:
    //         EdgeInsets.only(top: MediaQuery.of(context).size.height / 40),
    //   ),
    // );
  }
}
