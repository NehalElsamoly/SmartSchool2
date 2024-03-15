import 'package:flutter/material.dart';
import 'package:zahra/feature/presentation/Categories/presentation/view/widgets/message_payment.dart';

import '../../../../../core/ulits/const.dart';

class MassageTripCost extends StatelessWidget {
  const MassageTripCost({
    super.key,
  });
  static String id = 'Massage page';

  @override
  Widget build(BuildContext context) {
    return MassagePayment(
      massageic: correct,
      price: "20",
      title: "Trip cost",
      buttonTextdismiss: "Dismiss",
      buttonTextpay: "Confirm pay",
      dismissButton: () {
        Navigator.pop(context);
      },
      payButton: () {},
    );
  }
}
