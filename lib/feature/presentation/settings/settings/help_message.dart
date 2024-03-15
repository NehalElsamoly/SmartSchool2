import 'package:flutter/material.dart';


import '../../../../core/ulits/const.dart';
import '../../auth/register/presentation/reg/widgets/massage_widget.dart';

class HelpMessage extends StatelessWidget {
  const HelpMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return MassageWidget(
      title: "Mail Sent",
      massageic: svgMessage,
      buttonText:"Go to dashboard",
      contant:"Your mail successfully sent. We will get back to you soon. " ,
      foundButton: (){},
    );
  }
}

// this.foundButton,
// this.buttonText,
// this.title,
//this.massageic,
// this.contant