import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zahra/core/ulits/const.dart';
import 'package:zahra/core/ulits/styles.dart';
import 'package:zahra/feature/presentation/auth/login/presentation/views/verficationotp_forgetpassword_view.dart';
import 'package:zahra/feature/presentation/onboarding/presentation/widgets/title.dart';

import '../../../register/presentation/reg/widgets/custom_button.dart';
import '../../../register/presentation/reg/widgets/customtextfield.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});
  static String id = 'ForgetPassword page';

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  String? state;
  TextEditingController emailforget = TextEditingController();
  TextEditingController statusforget = TextEditingController();
  final GlobalKey<FormState> forgetpassword = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: forgetpassword,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
              ),
              Text(
                'ForgetPassword',
                style: Styles.style30.copyWith(color: titlecolor),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 20),
                child: Text(
                  "Don't worry! it's happens. please enter your email and we'll send OTP to your email",
                  style: Styles.style14.copyWith(color: text),
                ),
                // const TextContent(
                //   contant:
                //       "Don't worry! it's happens. please enter your email and we'll send OTP to your email",
                // ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              CustomTextfield(
                hintTex: ' Email address',
                labelTex: ' Email address',
                controller: emailforget,
                type: TextInputType.emailAddress,
                obs: false,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  Radio(
                    value: "Parent",
                    groupValue: state,
                    onChanged: (value) => {
                      setState(() {
                        state = value;
                      })
                    },
                    activeColor: kprimarycolor,
                  ),
                  Text(
                    'Parent',
                    style: Styles.style16.copyWith(color: kprimarycolor),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Radio(
                    value: "student",
                    groupValue: state,
                    onChanged: (value) => {
                      setState(() {
                        state = value;
                      })
                    },
                    activeColor: kprimarycolor,
                  ),
                  Text(
                    'Student',
                    style: Styles.style16.copyWith(color: kprimarycolor),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              Center(
                child: CustomButton(
                  tbutton: 'Send',
                  wbutton: MediaQuery.of(context).size.width / 1.5,
                  hbutton: MediaQuery.of(context).size.height / 15,
                  colorbutton: kprimarycolor,
                  founbutton: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const VerficationOTPForgetPassword()));
                  },
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
