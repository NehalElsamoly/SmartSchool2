import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zahra/core/ulits/const.dart';
import 'package:zahra/feature/presentation/payment/widgets/cardInfoWidget.dart';

import '../../../../core/ulits/styles.dart';
import 'mycart_view.dart';

class ThankYouViewcard extends StatelessWidget {
  const ThankYouViewcard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: paymentcard,
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          size: 30,
        ),
        backgroundColor: paymentcard,
      ),
      body: Container(
        width: double.infinity,
        decoration: ShapeDecoration(
          color: paymentcard,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 22,
            right: 22,
            bottom: 20,
          ),
          child: Column(
            children: [
              Text(
                'Thank you!',
                textAlign: TextAlign.center,
                style: Styles.style24,
              ),
              Text(
                'Your transaction was successful',
                textAlign: TextAlign.center,
                style: Styles.style18,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              const OrderInfoItem(),
              SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
              const OrderInfoItem(),
              SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
              const OrderInfoItem(),
              Divider(
                height: MediaQuery.of(context).size.height / 15,
                thickness: 2,
              ),
              const Totalprice(),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              const CardInfoWidget(),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    FontAwesomeIcons.barcode,
                    size: 64,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    height: MediaQuery.of(context).size.height / 13,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1.50,
                          color: HexColor("#3D7E80"),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Center(
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          'PAID',
                          textAlign: TextAlign.center,
                          style: Styles.style24.copyWith(
                            color: HexColor("#3D7E80"),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height:
                    ((MediaQuery.sizeOf(context).height * .2 + 20) / 2) - 29,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
