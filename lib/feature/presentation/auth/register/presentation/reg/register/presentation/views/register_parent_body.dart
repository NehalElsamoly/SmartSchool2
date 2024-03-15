import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zahra/core/ulits/apiservice3.dart';
import 'package:zahra/core/ulits/const.dart';
import 'package:zahra/core/ulits/styles.dart';
import 'package:zahra/feature/presentation/auth/login/presentation/views/loginscreen.dart';
import 'package:zahra/feature/presentation/auth/register/presentation/reg/register/presentation/views/register_child.dart';
import '../../../../../data/repo/authrepoimpl.dart';
import '../../../../../manager3/RegisterCubit.dart';
import '../../../../../manager3/RegisterState.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/customtextfield.dart';
import '../../../widgets/datepicker.dart';

class RegisterParentBody extends StatefulWidget {
  const RegisterParentBody({
    super.key,
  });

  @override
  State<RegisterParentBody> createState() => _RegisterParentBodyState();
}

class _RegisterParentBodyState extends State<RegisterParentBody> {
  GlobalKey<dynamic> parentrigister = GlobalKey();
  //  final TextEditingController nameengparent = TextEditingController();
  //  final TextEditingController namearbparent = TextEditingController();
  //  final TextEditingController emailparent = TextEditingController();
  //  final TextEditingController phoneparent = TextEditingController();
  //  final TextEditingController addressparent = TextEditingController();
  //  final TextEditingController idparent = TextEditingController();
  final TextEditingController photoidparent = TextEditingController();
  //File? selectedImage;
  //  DateTime birthparent = DatePicker().selectedDateTime;
  //  final TextEditingController job = TextEditingController();
  //  String? state3;

  // Future<void> _pickImage(ImageSource source) async {
  //   final picker = ImagePicker();
  //   final pickedFile = await picker.pickImage(source: source);
  //
  //   if (pickedFile != null) {
  //     setState(() {
  //
  //       context.read<AuthCubit2>().selectedImage = File(pickedFile.path);
  //       context.read<AuthCubit2>(). photoidparent.text = pickedFile.name;
  //     });
  //   }
  // }


File? selectedImage;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit2, AuthStateregister>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (state != null) {
              return Form(
                key: parentrigister,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextfield(
                        controller:
                            context.read<AuthCubit2>().nameengparent,
                        hintTex: ' Full Name in English',
                        labelTex: ' Full Name in English',
                        obs: false,
                        valid: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 25,
                      ),
                      CustomTextfield(
                        hintTex: ' Full Name in Arabic',
                        labelTex: ' Full Name in Arabic',
                        controller:
                            context.read<AuthCubit2>().namearbparent,
                        obs: false,
                        valid: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 25,
                      ),
                      CustomTextfield(
                        hintTex: ' Email address',
                        labelTex: ' Email address',
                        controller: context.read<AuthCubit2>().emailparent,
                        type: TextInputType.emailAddress,
                        obs: false,
                        valid: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                      CustomTextfield(
                        hintTex: 'Phone Number',
                        labelTex: 'Phone Number',
                        controller: context.read<AuthCubit2>().phoneparent,
                        type: TextInputType.phone,
                        obs: false,
                        inputformatter: [
                          FilteringTextInputFormatter.allow(
                            RegExp("[0-9]"),
                          ),
                          LengthLimitingTextInputFormatter(11)
                        ],
                        valid: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                      CustomTextfield(
                        hintTex: 'The Address',
                        labelTex: 'The Address',
                        type: TextInputType.streetAddress,
                        controller:
                            context.read<AuthCubit2>().addressparent,
                        obs: false,
                        valid: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                      CustomTextfield(
                        hintTex: "National ID",
                        labelTex: "National ID",
                        controller: context.read<AuthCubit2>().idparent,
                        type: TextInputType.number,
                        obs: false,
                        valid: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        inputformatter: [
                          FilteringTextInputFormatter.allow(
                              RegExp('[0-9]')),
                          LengthLimitingTextInputFormatter(11)
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                      CustomTextfield(
                        controller:
                            context.read<AuthCubit2>().photoidparent,
                        hintTex: 'upload photo  of the national id',
                        labelTex: 'National ID',
                        suficon: IconButton(
                            onPressed: () {
                              showImagePicker(context);
                            },
                            icon: const Icon(
                              Icons.upload,
                              color: kprimarycolor,
                            )),
                        obs: false,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).size.width / 35,
                        ),
                        child: DatePicker(),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                      CustomTextfield(
                        hintTex: 'Name of your Job',
                        labelTex: 'your Job',
                        controller: context.read<AuthCubit2>().job,
                        type: TextInputType.text,
                        obs: false,
                        valid: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                      Text(
                        'Select your gender:',
                        style:
                            Styles.style14.copyWith(color: kprimarycolor),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width / 10,
                              ),
                              Radio(
                                value: "male",
                                groupValue:
                                    context.read<AuthCubit2>().state3,
                                onChanged: (value) => {
                                  setState(() {
                                    context.read<AuthCubit2>().state3 =
                                        value;
                                  })
                                },
                                activeColor: kprimarycolor,
                              ),
                              Text(
                                'Male',
                                style: Styles.style14
                                    .copyWith(color: kprimarycolor),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width / 5,
                              ),
                              Radio(
                                value: "female",
                                groupValue:
                                    context.read<AuthCubit2>().state3,
                                onChanged: (value) => {
                                  setState(() {
                                    context.read<AuthCubit2>().state3 =
                                        value;
                                  })
                                },
                                activeColor: kprimarycolor,
                              ),
                              Text(
                                'Female',
                                style: Styles.style14
                                    .copyWith(color: kprimarycolor),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                      Center(
                          child: CustomButton(
                        tbutton: 'Continue',
                        wbutton: MediaQuery.of(context).size.width / 1.5,
                        hbutton: MediaQuery.of(context).size.height / 15,
                        colorbutton: kprimarycolor,
                        founbutton: () {

                          print("selected image 1");
                       // print(context.read<AuthCubit2>().selectedImage);
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return RegisterChild(image: selectedImage!,);
                          }));
                        },
                      )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 40,
                      ),
                      Row(
                        verticalDirection: VerticalDirection.down,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account? ",
                              style: Styles.style16.copyWith(
                                  color: text,
                                  fontWeight: FontWeight.w300)),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return Login();
                              }));
                            },
                            child: Text("Login",
                                style: Styles.style16.copyWith(
                                    color: textlink,
                                    decoration: TextDecoration.underline,
                                    decorationColor: textlink)),
                          ),
                        ],
                      ),
                    ]),
              );
            } else {
              return CircularProgressIndicator();
            }
          }
        });
  }
  Future pickImage({required ImageSource source}) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
selectedImage = imageTemporary;
      print(selectedImage);
      // print(image.path);
    } on PlatformException catch (e) {
      debugPrint('error$e');
    }
  }
  void showImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return  BlocProvider(
            create: (BuildContext context) => AuthCubit2(AuthRepoImpl2(
              ApiService(
                Dio(),
              ),
            )),
            child: BlocConsumer<AuthCubit2, AuthStateregister>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (state != null) {
                      return Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: const Icon(Icons.camera),
                              title: const Text('Take a photo'),
                              onTap: () async {
                                Navigator.pop(context);
                             await pickImage(source: ImageSource.camera);
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.image),
                              title: const Text('Choose from gallery'),
                              onTap: () async {
                                Navigator.pop(context);
                               await pickImage(source: ImageSource.gallery);
                                print("pick image");
                              //  print(context.read<AuthCubit2>().selectedImage);
                              },
                            ),
                          ],
                        ),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  }
                }));

      },
    );
  }
}
