import 'package:flutter/material.dart';

class ShowToastWidget extends StatelessWidget {
  final String text;
  final ToastStates state;

  const ShowToastWidget({
    Key? key,
    required this.text,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;

    switch (state) {
      case ToastStates.SUCCESS:
        backgroundColor = Colors.green;
        textColor = Colors.white;
        break;
      case ToastStates.ERROR:
        backgroundColor = Colors.red;
        textColor = Colors.white;
        break;
      default:
        backgroundColor = Colors.grey;
        textColor = Colors.black;
        break;
    }

    // Use a Builder to access the ScaffoldMessenger
    return Builder(
      builder: (context) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              text,
              style: TextStyle(color: textColor),
            ),
            backgroundColor: backgroundColor,
          ),
        );
        return SizedBox.shrink(); // Return an empty SizedBox
      },
    );
  }
}

enum ToastStates {
  SUCCESS,
  ERROR,
}
