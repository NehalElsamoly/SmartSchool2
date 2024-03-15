import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/ulits/const.dart';
import '../../auth/register/presentation/reg/widgets/custom_button.dart';
import '../../onboarding/presentation/widgets/title.dart';
import 'feedbackMessage.dart';

class MyFeedback extends StatefulWidget {
  const MyFeedback({super.key});

  @override
  State<MyFeedback> createState() => _MyFeedbackState();
}

class _MyFeedbackState extends State<MyFeedback> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 15,
          ),
          Center(
            child: Titles(
              title: 'Feedback',
              fsize: 27.sp,
              ttextcolor: kprimarycolor,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 35,
          ),
          Center(
            child: Titles(
              title: 'What do you think?',
              fsize: 16.sp,
              ttextcolor: Color(0xFFA5A6AA),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 6.0),
            padding: EdgeInsets.all(6.0),
            width: MediaQuery.of(context).size.width / 1.2,
            height: MediaQuery.of(context).size.height / 3.2,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color.fromARGB(255, 195, 196, 199),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(7),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: 'type your message', border: InputBorder.none),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 5,
          ),
          CustomButton(
            tbutton: 'Submit',
            wbutton: MediaQuery.of(context).size.width / 1.5,
            hbutton: MediaQuery.of(context).size.height / 14,
            colorbutton: kprimarycolor,
            founbutton: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FeedbackMessage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
