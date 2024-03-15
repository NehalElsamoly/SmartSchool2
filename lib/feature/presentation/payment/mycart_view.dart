import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/ulits/styles.dart';

class OrderInfoItem extends StatelessWidget {
  const OrderInfoItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Row(
        children: [
          Text(
            "order",
            style: Styles.style18,
          ),
          Spacer(),
          Text(
            r"$50",
            style: Styles.style18,
          ),
        ],
      ),
    );
  }
}

class Totalprice extends StatelessWidget {
  const Totalprice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Row(
        children: [
          Text(
            "Total",
            style: Styles.style24,
          ),
          Spacer(),
          Text(
            "price",
            style: Styles.style24,
          )
        ],
      ),
    );
  }
}

class Total extends StatelessWidget {
  const Total({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
