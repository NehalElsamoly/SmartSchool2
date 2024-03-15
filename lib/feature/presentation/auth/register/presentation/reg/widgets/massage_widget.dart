import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zahra/core/ulits/styles.dart';
import '../../../../../../../core/ulits/const.dart';
import 'custom_button.dart';

class MassageWidget extends StatelessWidget {
  MassageWidget(
      {super.key,
      this.foundButton,
      this.buttonText,
      this.title,
      this.massageic,
      this.contant});

  String? massageic;
  String? title;
  String? contant;
  String? buttonText;
  VoidCallback? foundButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AlertDialog(
        backgroundColor: Colors.white,
        title: SvgPicture.asset(
          massageic!,
          height: MediaQuery.of(context).size.height / 10,
        ),
        // titlePadding: const EdgeInsets.only(top: 50),
        content: SingleChildScrollView(
          child: ListBody(children: [
            Center(
              child: Text(
                title!,
                style: Styles.style30.copyWith(
                  color: texttitlecontent,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 40,
              ),
              child: Text(
                contant!,
                textAlign: TextAlign.center,
                style: Styles.style14.copyWith(
                  color: textSmall,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 10),
              child: CustomButton(
                tbutton: buttonText!,
                hbutton: MediaQuery.of(context).size.height / 15,
                wbutton: MediaQuery.of(context).size.width / 10,
                colorbutton: kprimarycolor,
                founbutton: foundButton!,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            )
          ]),
        ),
        contentPadding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height / 40),
      ),
    );
  }
}
