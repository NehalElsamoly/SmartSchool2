import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zahra/core/ulits/const.dart';
import 'package:zahra/core/ulits/styles.dart';
import 'package:zahra/feature/presentation/auth/login/presentation/views/massage_resetpassword.dart';
import 'package:zahra/feature/presentation/onboarding/presentation/widgets/title.dart';

import '../../../register/presentation/reg/widgets/custom_button.dart';
import '../../../register/presentation/reg/widgets/customtextfield.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});
  static String id = 'ResetPAssword page';
  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool isPasswordVisible = true;
  bool isPasswordVisible2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  ' Reset Password',
                  style: Styles.style30.copyWith(color: titlecolor),
                ),
                //  Titles(
                //   title: "Reset Password",
                //   fsize: 30.sp,
                //   ttextcolor: const Color(0xFF3D7E80),
                // ),
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
              // Padding(
              //     padding: EdgeInsets.symmetric(
              //         horizontal: MediaQuery.of(context).size.width / 15),
              //     child: const TextContent(
              //         contant:
              //             "Your password must be 8 or more characters long & contain upper & lower case letters, numbers")),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              Center(
                child: CustomButton(
                  tbutton: 'Reset Password',
                  wbutton: MediaQuery.of(context).size.width / 2,
                  hbutton: MediaQuery.of(context).size.height / 13,
                  colorbutton: kprimarycolor,
                  founbutton: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>const Massage()));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


//   TextEditingController _passwordController = TextEditingController();
//   bool _isPasswordVisible = false;
//   String _passwordStrengthMessage = '';

//   void _togglePasswordVisibility() {
//     setState(() {
//       _isPasswordVisible = !_isPasswordVisible;
//     });
//   }

//   void _checkPasswordStrength(String password) {
//     // Simple password strength check (adjust as needed)
//     if (password.length >= 8) {
//       setState(() {
//         _passwordStrengthMessage = 'Password strength: Strong';
//       });
//     } else {
//       setState(() {
//         _passwordStrengthMessage =
//             'Password strength: Weak (minimum 8 characters)';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Create Password'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _passwordController,
//               obscureText: !_isPasswordVisible,
//               decoration: InputDecoration(
//                 labelText: 'Enter Password',
//                 suffixIcon: IconButton(
//                   icon: Icon(_isPasswordVisible
//                       ? Icons.visibility
//                       : Icons.visibility_off),
//                   onPressed: _togglePasswordVisibility,
//                 ),
//               ),
//               onChanged: _checkPasswordStrength,
//             ),
//             SizedBox(height: 16.0),
//             Text(_passwordStrengthMessage),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 // TODO: Perform actions with the password, e.g., store it
//                 String password = _passwordController.text;
//                 print('Password created: $password');
//               },
//               child: Text('Submit Password'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


