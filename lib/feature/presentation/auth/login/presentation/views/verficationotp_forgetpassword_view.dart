import 'package:flutter/material.dart';
import 'package:zahra/feature/presentation/auth/login/presentation/views/resetpassword.dart';

import '../../../register/presentation/reg/widgets/verficationotp.dart';

class VerficationOTPForgetPassword extends StatelessWidget {
  const VerficationOTPForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: 15),
      child: VerficationOTP(
        confirm: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ResetPassword()));
        },
        vb1: null,
        vb2: null,
        vb3: null,
        vb4: null,
      ),
    ));
  }
}
