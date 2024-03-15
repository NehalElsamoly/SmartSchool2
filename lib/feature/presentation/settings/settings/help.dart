import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/ulits/const.dart';
import '../../auth/register/presentation/reg/widgets/custom_button.dart';
import '../../onboarding/presentation/widgets/title.dart';
import 'help_message.dart';

class MyHelp extends StatefulWidget {
  const MyHelp({super.key});

  @override
  State<MyHelp> createState() => _MyHelpState();
}

class _MyHelpState extends State<MyHelp> {
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
              title: 'Help',
              fsize: 27.sp,
              ttextcolor: kprimarycolor,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 35,
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
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 31.0, vertical: 14.0),
            child: Titles(
              title:
              'Fill out the form above to send an email and one of our team members will address your question as soon as possible. ',
              fsize: 13.sp,
              ttextcolor: Color(0xFFA5A6AA),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 3.5,
          ),
          CustomButton(
            tbutton: 'Send Mail',
            wbutton: MediaQuery.of(context).size.width / 1.4,
            hbutton: MediaQuery.of(context).size.height / 14,
            colorbutton: kprimarycolor,
            founbutton: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HelpMessage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
