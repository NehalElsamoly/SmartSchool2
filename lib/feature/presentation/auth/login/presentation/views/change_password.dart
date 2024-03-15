import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zahra/core/ulits/const.dart';

import 'package:zahra/feature/presentation/onboarding/presentation/widgets/title.dart';

import '../../../register/presentation/reg/widgets/custom_button.dart';
import '../../../register/presentation/reg/widgets/customtextfield.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool isPasswordVisible = true;

  bool isPasswordVisible2 = true;
  bool isPasswordVisible3 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Titles(
                  title: "Change Password",
                  fsize: 30.sp,
                  ttextcolor: const Color(0xFF3D7E80),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              CustomTextfield(
                obs: isPasswordVisible3,
                hintTex: 'Current Password',
                labelTex: 'Current Password',
                onChanged: (value) {},
                suficon: IconButton(
                  icon: Icon(
                    isPasswordVisible3
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible3 = !isPasswordVisible3;
                    });
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              CustomTextfield(
                obs: isPasswordVisible,
                hintTex: 'New Password',
                labelTex: 'New Password',
                onChanged: (value) {},
                suficon: IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              CustomTextfield(
                obs: isPasswordVisible2,
                hintTex: 'Confirm Password',
                labelTex: 'Confirm Password',
                onChanged: (value) {},
                suficon: IconButton(
                  icon: Icon(
                    isPasswordVisible2
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible2 = !isPasswordVisible2;
                    });
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 35,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              Center(
                child: CustomButton(
                  tbutton: 'Change Password',
                  wbutton: MediaQuery.of(context).size.width / 10,
                  hbutton: MediaQuery.of(context).size.height / 13,
                  colorbutton: kprimarycolor,
                  founbutton: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
