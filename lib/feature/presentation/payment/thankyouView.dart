import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zahra/core/ulits/const.dart';
import 'package:zahra/core/ulits/styles.dart';
import 'package:zahra/feature/presentation/payment/paymentDetails.dart';
import 'mycart_view.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: paymentbackground,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PaymentDetails()),
            );
          },
          child: Icon(
            Icons.arrow_back,
            size: 40.sp,
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(38.0),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: MediaQuery.of(context).size.height / 1.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: paymentbackground,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 80.0),
                      child: Text(
                        "Thank you!",
                        style: Styles.style24.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text(
                      "Your transaction was successful",
                      style: Styles.style18.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20.0,
                        left: 8,
                        right: 8,
                        bottom: 8,
                      ),
                      child: OrderInfoItem(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OrderInfoItem(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OrderInfoItem(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Divider(
                        thickness: 2,
                        height: 34,
                        color: paymentcolor,
                      ),
                    ),
                    Totalprice(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.3,
                        height: MediaQuery.of(context).size.height / 12,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: textbutton,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 30.0,
                        left: 30,
                      ),
                      child: Divider(
                        thickness: 2,
                        height: 34,
                        color: paymentcolor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 33,
            left: MediaQuery.of(context).size.width / 2.8,
            child: Image.asset(
              paymentDone,
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height / 3.5,
            right: MediaQuery.of(context).size.width / 6,
            child: CircleAvatar(
              backgroundColor: textbutton,
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height / 3.5,
            left: MediaQuery.of(context).size.width / 6,
            child: CircleAvatar(
              backgroundColor: textbutton,
            ),
          ),
        ],
      ),
    );
  }
}
