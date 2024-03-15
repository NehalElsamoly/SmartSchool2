import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zahra/core/ulits/const.dart';
import 'package:zahra/core/ulits/styles.dart';
import 'package:zahra/feature/presentation/Categories/presentation/view/widgets/bottom_naviagetion_bar.dart';
import 'package:zahra/feature/presentation/auth/login/presentation/views/change_password.dart';
import 'package:zahra/feature/presentation/payment/widgets/payment1.dart';
import 'package:zahra/feature/presentation/settings/settings/setting_view_profile.dart';
import 'package:zahra/feature/presentation/settings/settings/widgets/settings_view_item.dart';
import '../../../../core/ulits/cubitthemeprovider.dart';
import '../../personalinformation/personal.dart';
import 'edit_profile.dart';
import 'feedback.dart';
import 'help.dart';

bool switch1Status = false;
bool switch2Status = false;
Uint8List? _image;
late double _minTextAdapt; // Declare as late

String selectedLanguage = 'English';
List<String> languages = ['English', 'Arabic']; // Add more languages as needed
String vlaue(selectedLanguage) {
  return selectedLanguage;
}

bool status = true;

class SettingView extends StatefulWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    // var localizationDelegate = LocalizedApp.of(context).delegate;

    return Scaffold(
      // backgroundColor: Colors.grey[300],

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: Container(
          color: textbutton,
          child: Container(
            height: MediaQuery.of(context).size.height / 10,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: textbutton,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.arrow_back,
                    size: 40,
                    color: titlecolor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60),
                  child: Center(
                    child: Text(
                      translate("app_bar.text.setting"),
                      style: Styles.style30.copyWith(
                        fontWeight: FontWeight.bold,
                        color: titlecolor,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SettingViewProfile(
              image: _image,
              onEditProfileTap: () {
                showEditProfileDropdownMenu(context);
              },
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Container(
                    height: 550,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: colorTextField,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SettingViewItem(
                            icon: const Icon(
                              Icons.person,
                              color: titlecolor,
                            ),
                            title: "Personal Information",
                            iconNavSetting: const Icon(
                              Icons.arrow_forward,
                              color: titlecolor,
                            ),
                            navSetting: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Personal()),
                                (route) {
                                  return false;
                                },
                              );
                            },
                          ),
                          SettingViewItem(
                            icon: const Icon(
                              Icons.notifications_active,
                              color: titlecolor,
                            ),
                            title: "Notification",
                            iconNavSetting: const Icon(
                              Icons.arrow_forward,
                              color: titlecolor,
                            ),
                            navSetting: () {
                              // Navigator.pushAndRemoveUntil(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => Personal()),
                              //   (route) {
                              //     return false;
                              //   },
                              // );
                            },
                          ),
                          // SettingViewItem(
                          //   icon: const Icon(
                          //     Icons.notifications_active_outlined,
                          //     color: titlecolor,
                          //   ),
                          //   title: "notification",
                          //   iconNavSetting: FlutterSwitch(
                          //           width: 50.0,
                          //           height: 25.0,
                          //           toggleSize: 20.0,
                          //           value: switch2Status,
                          //           borderRadius: 30.0,
                          //           padding: 2.0,
                          //           toggleColor: Colors.white,
                          //           toggleBorder: Border.all(
                          //             color: Colors.white,
                          //             width: 5.0,
                          //           ),
                          //           activeColor: titlecolor,
                          //           inactiveColor: Colors.black38,
                          //           onToggle: (value) {
                          //             setState(() {
                          //               switch2Status = value;
                          //             });
                          //           },
                          //         ),
                          //   navSetting: () {},
                          // ),
                          SettingViewItem(
                            icon: const Icon(
                              Icons.language,
                              color: titlecolor,
                            ),
                            title: "Language",
                            iconNavSetting: Container(
                              // width: 75.0, // Set the desired width
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey[50],
                              ),
                              // child: DropdownButton<String>(
                              //   value: selectedLanguage,
                              //   onChanged: (String? newValue) async {
                              //     if (newValue != null) {
                              //       setState(() {
                              //         // saveSelectedLanguage(newValue);
                              //         if (newValue == 'Arabic') {
                              //           //  changeLocale(context, 'ar'); // Change locale to Arabic
                              //         } else {
                              //           // changeLocale(context, 'en_US'); // Change locale to English
                              //         } // Save the selected language
                              //         // changeLocale(context, newValue); // Change locale to the newly selected language
                              //         selectedLanguage =
                              //             newValue; // Update the selected language variable
                              //       });
                              //     }
                              //   },
                              //
                              //   icon: Icon(Icons.arrow_drop_down_sharp),
                              //   iconSize: 15.0, // Set the icon size as needed
                              //   elevation: 16,
                              //   style: TextStyle(
                              //       color: Colors.black,
                              //       fontSize: 14.0), // Set the font size
                              //   underline: Container(
                              //     height: 1,
                              //     color: Colors.transparent,
                              //   ),
                              //   dropdownColor: Colors
                              //       .grey[300], // Set dropdown background color
                              //   borderRadius: BorderRadius.circular(5),
                              //   items: languages.map((String language) {
                              //     return DropdownMenuItem<String>(
                              //       value: language,
                              //       child: Text(language),
                              //     );
                              //   }).toList(),
                              // ),
                              child: DropdownButton<String>(
                                value: selectedLanguage,
                                // onChanged: (String? newValue) async {
                                //   if (newValue != null) {
                                //     setState(() {
                                //     //   saveSelectedLanguage(newValue); // Save the selected language
                                //     //   if (newValue == 'Arabic') {
                                //     //     changeLocale(context, 'ar'); // Change locale to Arabic
                                //     //   } else {
                                //     //     changeLocale(context, 'en_US'); // Change locale to English
                                //     //   }
                                //     //   selectedLanguage = newValue; // Update the selected language variable
                                //     // });
                                //
                                //   }
                                // },

                                onChanged: (String? newValue) async {
                                  if (newValue != null) {
                                    setState(() {
                                      // Save the selected language
                                      saveSelectedLanguage(newValue);

                                      if (newValue == 'Arabic') {
                                        changeLocale(context,
                                            'ar'); // Change locale to Arabic
                                      } else {
                                        changeLocale(context,
                                            'en_US'); // Change locale to English
                                      }
                                      selectedLanguage =
                                          newValue; // Update the selected language variable
                                    });
                                  }
                                },


                                icon: Icon(Icons.arrow_drop_down_sharp),
                                iconSize: 15.0,
                                // Set the icon size as needed
                                elevation: 16,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14.0),
                                // Set the font size
                                underline: Container(
                                  height: 1,
                                  color: Colors.transparent,
                                ),
                                dropdownColor: Colors.grey[300],
                                // Set dropdown background color
                                borderRadius: BorderRadius.circular(5),
                                items: languages.map((String language) {
                                  return DropdownMenuItem<String>(
                                    value: language,
                                    child: Text(language),
                                  );
                                }).toList(),
                              ),
                            ),
                            navSetting: () {},
                          ),
                          SettingViewItem(
                            icon: const Icon(
                              Icons.key_off_outlined,
                              color: titlecolor,
                            ),
                            title: "Change Password",
                            iconNavSetting: const Icon(
                              Icons.arrow_forward,
                              color: titlecolor,
                            ),
                            navSetting: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChangePassword()),
                                (route) {
                                  return false;
                                },
                              );
                            },
                          ),
                          SettingViewItem(
                            icon: const Icon(
                              Icons.theater_comedy,
                              color: titlecolor,
                            ),
                            title: "Thems",
                            iconNavSetting: InkWell(
                              onTap: (){
                                context.read<ThemeProvider>().changeTheme(
                                  context.read<ThemeProvider>().currentTheme == ThemeEnum.Light
                                      ? ThemeEnum.Dark
                                      : ThemeEnum.Light,
                                );
                              },
                              child: const Icon(
                                Icons.arrow_forward,
                                color: titlecolor,
                              ),
                            ),
                            navSetting: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChangePassword()),
                                (route) {
                                  return false;
                                },
                              );
                            },
                          ),
                          SettingViewItem(
                            icon: const Icon(
                              Icons.help,
                              color: titlecolor,
                            ),
                            title: "Help",
                            iconNavSetting: const Icon(
                              Icons.arrow_forward,
                              color: titlecolor,
                            ),
                            navSetting: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHelp()),
                                (route) {
                                  return false;
                                },
                              );
                            },
                          ),
                          SettingViewItem(
                            icon: const Icon(
                              Icons.payment_outlined,
                              color: titlecolor,
                            ),
                            title: "Payment",
                            iconNavSetting: const Icon(
                              Icons.arrow_forward,
                              color: titlecolor,
                            ),
                            navSetting: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => mycartview()),
                                (route) {
                                  return false;
                                },
                              );
                            },
                          ),
                          SettingViewItem(
                            icon: const Icon(
                              Icons.sell,
                              color: titlecolor,
                            ),
                            title: "Select child",
                            iconNavSetting: const Icon(
                              Icons.arrow_forward,
                              color: titlecolor,
                            ),
                            navSetting: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => mycartview()),
                                (route) {
                                  return false;
                                },
                              );
                            },
                          ),
                          SettingViewItem(
                            icon: const Icon(
                              Icons.generating_tokens,
                              color: titlecolor,
                            ),
                            title: "Rating & Feedback",
                            iconNavSetting: const Icon(
                              Icons.arrow_forward,
                              color: titlecolor,
                            ),
                            navSetting: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyFeedback()),
                                (route) {
                                  return false;
                                },
                              );
                            },
                          ),
                          SettingViewItem(
                            icon: const Icon(
                              Icons.logout,
                              color: titlecolor,
                            ),
                            title: "Logout",
                            iconNavSetting: const Icon(
                              Icons.arrow_forward,
                              color: titlecolor,
                            ),
                            navSetting: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => mycartview()),
                                (route) {
                                  return false;
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNaviatonBar(),
    );

  }
  void saveSelectedLanguage(String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_locale', language);
  }
}

void showEditProfileDropdownMenu(BuildContext context) {
  showMenu(
    context: context,
    position: RelativeRect.fromLTRB(
        0, 100, 0, 0), // Adjust the position of the dropdown
    items: [
      PopupMenuItem(
        child: ListTile(
          title: Text('Edit Profile'),
          onTap: () {
            // Navigate to the edit profile screen
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => EditProfileView()));
          },
        ),
      ),
    ],
  );
}
