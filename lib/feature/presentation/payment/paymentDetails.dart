import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zahra/core/ulits/const.dart';
import 'package:zahra/feature/presentation/payment/paymentMehodItem.dart';
import 'package:zahra/feature/presentation/payment/thankyou_view_body.dart';
import 'package:zahra/feature/presentation/payment/widgets/payment1.dart';

import '../../../../core/ulits/styles.dart';
import 'mycart_view.dart';

final GlobalKey<FormState> Form = GlobalKey();
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

class PaymentDetails extends StatefulWidget {
  PaymentDetails({Key? key}) : super(key: key);

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  List<String> PaymentmethodItem = [paypal, paypal];

  int ActiveIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => mycartview()),
            );
          },
          child: Icon(Icons.arrow_back),
        ),
        title: Text(
          "MY Cart",
          textAlign: TextAlign.center,
          style: Styles.style24,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
              child: ListView.builder(
                  itemCount: PaymentmethodItem.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        ActiveIndex = index;
                        setState(() {});
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: PaymentMethodItem(
                          isActive: ActiveIndex == index,
                          image: PaymentmethodItem[index],
                        ),
                      ),
                    );
                  }),
            ),
            CustomCreditCard(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.3,
              height: MediaQuery.of(context).size.height / 15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                //  color: Color(0xff34a853)),
                color: titlecolor,
              ),
              child: Center(
                child: MaterialButton(
                  onPressed: () {
                    if (Form.currentState!.validate()) {
                      Form.currentState!.save();
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ThankYouViewBody()),
                    );
                  },
                  child: Text(
                    "Payment",
                    style: Styles.style24.copyWith(
                      color: textbutton,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCreditCard extends StatefulWidget {
  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  String cardNumber = '', expiryDate = '', cardHolderName = '', cvvCode = '';

  bool showBackView = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        children: [
          CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: showBackView,
              onCreditCardWidgetChange: (value) {}),
          CreditCardForm(
            cardNumber: '',
            expiryDate: '',
            cardHolderName: '',
            cvvCode: '',
            onCreditCardModelChange: (CreditCardModel) {
              cardHolderName = CreditCardModel.cardHolderName;
              cardNumber = CreditCardModel.cardNumber;
              cvvCode = CreditCardModel.cvvCode;
              expiryDate = CreditCardModel.expiryDate;
              showBackView = CreditCardModel.isCvvFocused; //بتقلب الكارد
              setState(() {});
            },
            formKey: Form,
          ),
        ],
      ),
    );
  }
}
