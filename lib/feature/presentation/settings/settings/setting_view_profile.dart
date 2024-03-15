import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zahra/core/ulits/const.dart';
import 'package:zahra/core/ulits/styles.dart';

import 'edit_profile.dart';
class SettingViewProfile extends StatelessWidget {
  final Uint8List? image;
  final Function() onEditProfileTap;

  const SettingViewProfile({
    Key? key,
    this.image,
    required this.onEditProfileTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            decoration: BoxDecoration(
              color: titlecolor,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      if (image != null)
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: MemoryImage(image!),
                          backgroundColor: titlecolor,
                        )
                      else
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: titlecolor,
                          backgroundImage: NetworkImage(
                              "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
                        ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "my name nehal",
                        style: Styles.style14.copyWith(
                          color: textbutton,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "my name nehal",
                        style: Styles.style14.copyWith(
                          color: textbutton,
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(
                  flex: 3,
                ),
                PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text(
                        "Edit Profile",
                        style: Styles.style14.copyWith(
                          color: titlecolor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfileView()),
                          (route) {
                            return false;
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
