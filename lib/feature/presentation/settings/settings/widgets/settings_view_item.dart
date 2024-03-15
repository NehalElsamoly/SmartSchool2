import 'package:flutter/material.dart';
import 'package:zahra/core/ulits/const.dart';
import 'package:zahra/core/ulits/styles.dart';

class SettingViewItem extends StatelessWidget {
  SettingViewItem(
      {super.key,
      required this.title,
      required this.icon,
      this.navSetting,
      required this.iconNavSetting,});
  final String title;
  final Icon icon;
  final Widget iconNavSetting;
  VoidCallback? navSetting;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11.0),
              color: iconcategory.withOpacity(0.38),
            ),
            margin: const EdgeInsets.all(8.0),
            child: icon,
          ),
          Center(
            child: Text(
              title,
              style: Styles.style14.copyWith(
                color: textcontent,
              ),
            ),
          ),
          Spacer(),
          InkWell(
            onTap: navSetting!,
            child: iconNavSetting,
          ),
        ],
      ),
    );
  }
}
