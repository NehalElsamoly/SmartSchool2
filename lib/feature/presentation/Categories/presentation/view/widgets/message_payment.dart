import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zahra/core/ulits/const.dart';
import 'package:zahra/core/ulits/styles.dart';

import '../../../../auth/register/presentation/reg/widgets/custom_button.dart';
class MassagePayment extends StatelessWidget {
  MassagePayment({
    super.key,
    this.payButton,
    this.dismissButton,
    this.buttonTextdismiss,
    this.buttonTextpay,
    this.title,
    this.massageic,
    this.price,
  });
  String? massageic;
  String? title;
  String? price;
  String? buttonTextdismiss;
  String? buttonTextpay;
  VoidCallback? payButton;
  VoidCallback? dismissButton;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AlertDialog(
        backgroundColor: textbutton,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              massageic!,
              height: MediaQuery.of(context).size.height / 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                title!,
                style: Styles.style18.copyWith(
                  color: titlecolor,
                  fontSize: 25.sp,
                ),
              ),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 15,
                ),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'This trip will cost ',
                        style: Styles.style16.copyWith(
                          color: text,
                        ),
                      ),
                      TextSpan(
                        text: price!,
                        style: Styles.style16.copyWith(
                          color: kprimarycolor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text:
                            "\$ including every thing such as tickets ,  food , drinks...etc.",
                        style: Styles.style16.copyWith(
                          color: text,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                    tbutton: buttonTextdismiss!,
                    hbutton: MediaQuery.of(context).size.height / 15,
                    wbutton: MediaQuery.of(context).size.width / 10,
                    colorbutton: kprimarycolor,
                    founbutton: dismissButton!,
                  ),
                  CustomButton(
                    tbutton: buttonTextpay!,
                    hbutton: MediaQuery.of(context).size.height / 15,
                    wbutton: MediaQuery.of(context).size.width / 10,
                    colorbutton: kprimarycolor,
                    founbutton: payButton!,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              )
            ],
          ),
        ),
        contentPadding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height / 20),
      ),
    );
  }
}
