import 'package:flutter/material.dart';
import 'package:zahra/core/ulits/const.dart';
import 'package:zahra/feature/presentation/auth/login/presentation/views/loginscreen.dart';

import '../../../widgets/massage_widget.dart';


class MassageRegister extends StatelessWidget {
  const MassageRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return MassageWidget(
      massageic: confirmRegister,
      title: "Confirm Register",
      contant:
          'Your register to our system has been successfully completed. please wait and check your email to know your interview appointment  \n\n Are You sure this information is true?',
      buttonText: "Login",
      foundButton: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>  Login()));
      },
    );
  }
}
