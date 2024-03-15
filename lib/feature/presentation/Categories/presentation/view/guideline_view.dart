import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zahra/core/ulits/const.dart';
import 'package:zahra/core/ulits/styles.dart';
import 'package:zahra/feature/presentation/Categories/presentation/view/widgets/appbar_view.dart';
import 'package:zahra/feature/presentation/Categories/presentation/view/widgets/bottom_naviagetion_bar.dart';
import 'package:zahra/feature/presentation/Categories/presentation/view/widgets/guidelines.dart';

class GuideLineView extends StatelessWidget {
  const GuideLineView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBarLeadingView(),
        title: const TitleAppBarView(),
        titleTextStyle: const TextStyle(
          fontSize: 15,
        ),
        actions: [
          SvgPicture.asset(
            logoIc,
            height: 80,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 42,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 30,
                  ),
                  const Icon(
                    Icons.library_books,
                    color: kprimarycolor,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 38,
                  ),
                  Text(
                    'GuideLines',
                    style: Styles.style30.copyWith(
                      color: kprimarycolor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 33,
              ),
              Column(
                children: [
                  GuideLine(
                    description:
                        "Students should always wear their School ID card.",
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                  GuideLine(
                    description:
                        "Parents are requested to go through their wards school regularly and sign the teacher’s remarks, if any.",
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                  GuideLine(
                    description:
                        "Parents are requested to go through their wards school regularly and sign the teacher’s remarks, if any.",
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                  GuideLine(
                    description:
                        "Parents are requested to go through their wards school regularly and sign the teacher’s remarks, if any.",
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                  GuideLine(
                    description:
                        "Parents are requested to go through their wards school regularly and sign the teacher’s remarks, if any.",
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                  GuideLine(
                    description:
                        "Parents are requested to go through their wards school regularly and sign the teacher’s remarks, if any.",
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                  GuideLine(
                    description:
                        "Parents are requested to go through their wards school regularly and sign the teacher’s remarks, if any.",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNaviatonBar(),
    );
  }
}
