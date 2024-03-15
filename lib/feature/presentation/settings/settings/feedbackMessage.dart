import 'package:flutter/material.dart';


import '../../../../core/ulits/const.dart';
import '../../auth/register/presentation/reg/widgets/massage_widget.dart';

class FeedbackMessage extends StatelessWidget {
  const FeedbackMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return MassageWidget(
      title: "Mail Sent",
      massageic: svgMessage,
      buttonText:"Okay",
      contant:"Your feedback has been send successfully sent. We will get back to you soon." ,
      foundButton: (){},
    );
  }
}

// this.foundButton,
// this.buttonText,
// this.title, 
//this.massageic,
// this.contant