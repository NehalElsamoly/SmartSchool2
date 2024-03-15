import 'package:flutter/material.dart';
import 'package:zahra/core/ulits/const.dart';
import 'package:zahra/core/ulits/styles.dart';
import 'package:zahra/feature/presentation/auth/register/presentation/reg/widgets/vertification_box.dart';

import 'custom_button.dart';


// ignore: must_be_immutable
class VerficationOTP extends StatelessWidget {
  VerficationOTP(
      {super.key,
      required this.confirm,
      required this.vb1,
      required this.vb2,
      required this.vb3,
      required this.vb4});
  final VoidCallback confirm;
  TextEditingController? vb1 = TextEditingController();
  TextEditingController? vb2 = TextEditingController();
  TextEditingController? vb3 = TextEditingController();
  TextEditingController? vb4 = TextEditingController();
  final GlobalKey<FormState> otp = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 7,
          ),
          Text(
            'Verfication OTP',
            style: Styles.style30.copyWith(color: titlecolor),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "check your mail, we've send you the otp to name@gamil.com",
              style: Styles.style14.copyWith(color: text),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 20,
          ),
          Form(
              key: otp,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    VerificationBox(
                      vb: vb1,
                    ),
                    VerificationBox(
                      vb: vb2,
                    ),
                    VerificationBox(
                      vb: vb3,
                    ),
                    VerificationBox(
                      vb: vb3,
                    ),
                  ])),
          Center(
            child: CustomButton(
              tbutton: 'Continue',
              hbutton: MediaQuery.of(context).size.height / 12,
              wbutton: MediaQuery.of(context).size.width / 1.5,
              colorbutton: kprimarycolor,
              founbutton: confirm,
            ),
          )
        ],
      ),
    );
  }
}
