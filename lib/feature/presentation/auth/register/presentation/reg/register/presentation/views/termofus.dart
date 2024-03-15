import 'package:flutter/material.dart';
import 'package:zahra/core/ulits/const.dart';
import 'package:zahra/core/ulits/styles.dart';
import 'package:zahra/feature/presentation/onboarding/presentation/view/welcome_starting.dart';

import '../../../widgets/custom_button.dart';
import 'massage_register.dart';

class TermOfUs extends StatelessWidget {
  const TermOfUs({super.key});
  static String id = 'Term OF Us page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: ListView(children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            'Terms of us',
            style: Styles.style30.copyWith(color: titlecolor),
          ),

          const SizedBox(
            height: 10,
          ),

          Text("Terms and conditions",
              style: Styles.style18.copyWith(
                color: text,
                fontWeight: FontWeight.w400,
              )),
          const SizedBox(
            height: 10,
          ),

          Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              style: Styles.style14.copyWith(color: textcontent)),
          const SizedBox(
            height: 50,
          ),

          Text(
            "Privacy policy",
            style: Styles.style18.copyWith(color: text),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              style: Styles.style14.copyWith(color: textcontent)),
          const SizedBox(
            height: 50,
          ),
          Text(
            "Cookies policy",
            style: Styles.style18.copyWith(
              color: text,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            style: Styles.style14.copyWith(color: textsmall),
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                  tbutton: 'Accept',
                  wbutton: MediaQuery.of(context).size.width / 8,
                  hbutton: MediaQuery.of(context).size.height / 10,
                  colorbutton: kprimarycolor,
                  founbutton: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MassageRegister()));
                  },
                ),
                CustomButton(
                  tbutton: 'Decline',
                  wbutton: MediaQuery.of(context).size.width / 5,
                  hbutton: MediaQuery.of(context).size.height / 10,
                  colorbutton: decline,
                  founbutton: () {
                    Navigator.pop(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WelcomeStarting()));
                  },
                ),
              ],
            ),
          ),
 
          const SizedBox(
            height: 100,
          ),
        ]),
      ),
    );
  }
}
