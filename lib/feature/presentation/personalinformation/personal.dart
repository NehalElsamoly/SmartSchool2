import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zahra/feature/presentation/personalinformation/rowInformaton.dart';

import '../../../../core/ulits/const.dart';
//import 'package:payment_app/widget/styles.dart';

class Personal extends StatelessWidget {
  const Personal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              Text(
                'Personal Information',
                style: TextStyle(
                    fontSize: 26.sp,
                    color: kprimarycolor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Information(
                      icon: Icon(
                        Icons.person,
                        color: Color(0xffA0A2B3),
                      ),
                      title: "Name",
                      description: "Mahmudul Hasan Manik",
                    ),
                    Information(
                      icon: Icon(
                        Icons.phone,
                        color: Color(0xffA0A2B3),
                      ),
                      title: "Phone number",
                      description: "2562 358 987",
                    ),
                    Information(
                      icon: Icon(
                        Icons.lock,
                        color: Color(0xffA0A2B3),
                      ),
                      title: "Password",
                      description: "@12587#12568",
                    ),
                    Information(
                      icon: Icon(
                        Icons.person_3_outlined,
                        color: Color(0xffA0A2B3),
                      ),
                      title: "Gender",
                      description: "male",
                    ),
                    Information(
                      icon: Icon(
                        Icons.calendar_today,
                        color: Color(0xffA0A2B3),
                      ),
                      title: "Date of birth",
                      description: '15 Septamber,2024',
                    ),
                    Information(
                      icon: Icon(
                        Icons.location_on,
                        color: Color(0xffA0A2B3),
                      ),
                      title: "Address",
                      description: 'Khulna, Bangladesh',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
