import 'package:flutter/material.dart';
import 'package:zahra/feature/presentation/auth/register/presentation/reg/register/presentation/views/register_child.dart';
import 'package:zahra/feature/presentation/auth/register/presentation/reg/register/presentation/views/termofus.dart';

import '../../../widgets/verficationotp.dart';


class VerficationOTPEmail extends StatelessWidget {
  const VerficationOTPEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: VerficationOTP(
          confirm: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TermOfUs()));
          },
          vb1: null,
          vb2: null,
          vb3: null,
          vb4: null,
        ),
      ),
    );
  }
}
