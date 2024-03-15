import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zahra/core/ulits/const.dart';
import 'package:zahra/core/ulits/styles.dart';
import 'package:zahra/feature/presentation/Categories/presentation/view/widgets/advertisement_pay.dart';
import 'package:zahra/feature/presentation/Categories/presentation/view/widgets/appbar_view.dart';
import 'package:zahra/feature/presentation/Categories/presentation/view/widgets/bottom_naviagetion_bar.dart';
import 'package:zahra/feature/presentation/Categories/presentation/view/widgets/anouncment_type_view.dart';
import 'package:zahra/feature/presentation/Categories/presentation/view/widgets/message_payment.dart';

class AnouncmentView extends StatelessWidget {
  const AnouncmentView({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("New Anouncment",
                  style: Styles.style18
                      .copyWith(color: texttitlecontent, fontSize: 20.sp)),
              SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: AnouncmentType(
                        title: "Trips",
                      ),
                    ),
                    GestureDetector(
                      child: AnouncmentType(
                        title: "Concerts",
                      ),
                    ),
                    GestureDetector(
                      child: AnouncmentType(
                        title: "Dish Party",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 80,
              ),
              Advertisement(
                documentimage: documentImage,
                onpressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return MassagePayment();
                    },
                  ));
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: const BottomNaviatonBar());
  }
}
