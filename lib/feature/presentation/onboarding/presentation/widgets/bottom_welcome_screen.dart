import 'package:flutter/material.dart';

class BottomFirstScreen extends StatelessWidget {
  const BottomFirstScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: -MediaQuery.of(context).size.width / 2.5,
      top: MediaQuery.of(context).size.height / 1.2,
      child: Container(
        width: MediaQuery.of(context).size.width * 1.8,
        height: MediaQuery.of(context).size.height / 1.5,
        decoration: ShapeDecoration(
          color: const Color(0x3352AEB0),
          shape: OvalBorder(
            side: BorderSide(
              width: MediaQuery.of(context).size.width / 90,
              color: const Color(0xFF52AEB0),
            ),
          ),
        ),
      ),
    );
  }
}
