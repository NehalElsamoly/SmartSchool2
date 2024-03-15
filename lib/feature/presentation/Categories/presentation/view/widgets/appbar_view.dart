import 'package:flutter/material.dart';
import 'package:zahra/core/ulits/const.dart';

class TitleAppBarView extends StatelessWidget {
  const TitleAppBarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Mostafa Ali',
          style: TextStyle(
            color: Color(0xff777A95),
          ),
        ),
        Text(
          'Mostafa.zahra@gmail.com',
          style: TextStyle(color: Color(0xffA0A2B3)),
        )
      ],
    );
  }
}

class AppBarLeadingView extends StatelessWidget {
  const AppBarLeadingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 10,
        height: MediaQuery.of(context).size.height / 20,
        color: Colors.white,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            preson,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height / 10,
            width: MediaQuery.of(context).size.width / 10,
          ),
        ),
      ),
    );
  }
}
