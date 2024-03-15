import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zahra/core/ulits/const.dart';
import 'package:zahra/core/ulits/styles.dart';
import 'package:zahra/feature/presentation/auth/register/presentation/reg/register/presentation/views/verficationotp_confirm_email.dart';

import '../../../../../../../../../core/ulits/apiservice3.dart';
import '../../../../../../login/manager3/login3_cubit.dart';
import '../../../../../data/model/getlevels.dart';
import '../../../../../data/repo/authrepoimpl.dart';
import '../../../../../manager3/RegisterCubit.dart';
import '../../../../../manager3/RegisterState.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/customtextfield.dart';
import '../../../widgets/datepicker.dart';
import '../../../widgets/selector.dart';

class RegisterChildBody extends StatefulWidget {
  const RegisterChildBody({
    super.key,
    required this.image,
  });

  final File image;

  @override
  State<RegisterChildBody> createState() => _RegisterChildBodyState();
}

class _RegisterChildBodyState extends State<RegisterChildBody> {
  GlobalKey<dynamic> childregister = GlobalKey();
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AuthCubit2>().FetchLevels();
  }
  // final TextEditingController childnameen = TextEditingController();
  // final TextEditingController childnamear = TextEditingController();
  // final TextEditingController childbirthcertificate = TextEditingController();
  // File? selectedImage;
  // DateTime childdatebirth = DatePicker().selectedDateTime;
  // final TextEditingController childschoolname = TextEditingController();
  // String? state2;

  // Future<void> _pickImage(ImageSource source) async {
  //   File? pickedFile;
  //   final picker = ImagePicker();
  //   File? pickedFile = await picker.pickImage(source: source);
  //
  //   if (pickedFile != null) {
  //     setState(() {
  //       print(pickedFile.path);
  //      context.read<AuthCubit2>() .selectedImage2 = File(pickedFile.path);
  //      // context.read<AuthCubit2>() .childbirthcertificate.text = pickedFile.name;
  //     });
  //   }
  // }
  File? selectedImage22;

  Future pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
       selectedImage22 = File(pickedFile.path);
      print(pickedFile.path);
     // print(context.read<AuthCubit2>().selectedImage2);
      // context.read<AuthCubit2>().setImage(context.read<AuthCubit2>().selectedImage2);
      //context.read<AuthCubit2>() .selectedImage2 = File(pickedFile.path);
    }
  }

  void showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Photo Library'),
                    onTap: () async{
                      Navigator.of(context).pop();
                       await pickImage(ImageSource.gallery);
                      // print(context.read<AuthCubit2>().selectedImage);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: const Text('Camera'),
                    onTap: () async{
                      Navigator.of(context).pop();
                     await pickImage(ImageSource.camera);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  /////// File? selectedImage2;
  // Future pickImage({required ImageSource source}) async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: source);
  //     if (image == null) return;
  //     final imageTemporary = File(image.path);
  //     setState(() {
  //     selectedImage2  = imageTemporary;
  //     });
  //     print(image.path);
  //   } on PlatformException catch (e) {
  //     debugPrint('error$e');
  //   }
  // }
  // Future<void> pickImage({required ImageSource source}) async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: source);
  //     if (image == null) return;
  //     final imageTemporary = File(image.path);
  //
  //     // setState(() {
  //     //   selectedImage2  = imageTemporary;
  //     // });
  //     // // setState(() {
  //     // //   context.read<AuthCubit2>().selectedImage2 = imageTemporary;
  //     // // });
  //     //  print(image.path);
  //     setState(() {
  //
  //       selectedImage2 = File(imageTemporary.path);
  //
  //       print(selectedImage2?.path); // print here
  //
  //     });
  //   } on PlatformException catch (e) {
  //     debugPrint('error$e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    List<Level> levels = context.read<AuthCubit2>().levelmodel?.levels ?? [];

    return BlocConsumer<AuthCubit2, AuthStateregister>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (state != null) {
              print("selected image");
             // print(context.read<AuthCubit2>().selectedImage);
              return Form(
                key: childregister,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextfield(
                        controller: context.read<AuthCubit2>().childnameen,
                        hintTex: ' Full Name in English',
                        labelTex: ' Full Name in English',
                        obs: false,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                      CustomTextfield(
                        controller: context.read<AuthCubit2>().childnamear,
                        hintTex: ' Full Name in Arabic',
                        labelTex: ' Full Name in Arabic',
                        obs: false,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                      CustomTextfield(
                        controller: context
                            .read<AuthCubit2>()
                            .childbirthcertificate,
                        hintTex: 'upload photo id brith config',
                        labelTex: 'brith config',
                        suficon: IconButton(
                            onPressed: () {
                              // showImagePicker(context);
                              // showImagePicker(context);
                              showPicker(context);
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
                        controller:
                            context.read<AuthCubit2>().childschoolname,
                        hintTex: "Enter The Previous School Name",
                        labelTex: "Enter The Previous School Name",
                        obs: false,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).size.width / 40,
                        ),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 15,
                          decoration: BoxDecoration(
                            color: textbutton,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:
                          Seletor(
                            hinttext: 'Select Level',
                            // items: const [
                            //   '1',
                            //   '2',
                            //   '3',
                            //   '4',
                            //   '5',
                            //   '6',
                            // ],



        levels:levels

          ),
                        ),
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


                                    context.read<AuthCubit2>().state2,
                                onChanged: (value) => {
                                  if (value != null)
                                    {
                                      setState(() {
                                        context.read<AuthCubit2>().state2 =
                                            value;
                                      })
                                    }
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
                                    context.read<AuthCubit2>().state2,
                                onChanged: (value) => {
                                  if (value != null)
                                    {
                                      setState(() {
                                        context.read<AuthCubit2>().state2 =
                                            value;
                                      })
                                    }
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
                        wbutton: MediaQuery.of(context).size.width / 2,
                        hbutton: MediaQuery.of(context).size.height / 12,
                        colorbutton: kprimarycolor,
                        founbutton: () {
                          // print(context.read<AuthCubit2>().selectedImage);
                          // print(context.read<AuthCubit2>().selectedImage2);
                          print(widget.image);
                          print(selectedImage22);

                          var C = context.read<AuthCubit2>();
                          print("nehal");
                          print(C.nameengparent.text);
                          context.read<AuthCubit2>().Register(
                                parent_name_en: C.nameengparent.text,
                                parent_name_ar: C.namearbparent.text,
                                parent_emai: C.emailparent.text,
                                parent_mobile: C.phoneparent.text,
                                parent_data_birth: C.birthparent.toString(),
                                parent_national_id: C.idparent.text,
                                parent_address: C.addressparent.text,
                                parent_job: C.job.text,
                                parent_gender: C.state2.toString(),
                                child_name_en: C.childnameen.text,
                                child_name_ar: C.childnamear.text,
                                child_date_birth:
                                    C.childdatebirth.toString(),
                                child_gender: C.state3.toString(),
                                child_level: C.selectedValue.toString(),
                                child_school_name:
                                    C.childschoolname.text,
                                image: widget.image ,
                                image2: selectedImage22 ?? File(""),
                              );
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const VerficationOTPEmail()));
                        },
                      )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                    ]),
              );
            } else {
              return CircularProgressIndicator();
            }
          }
        });
  }
// void showImagePicker(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     builder: (BuildContext context) {
//       return Container(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             ListTile(
//               leading: const Icon(Icons.camera),
//               title: const Text('Take a photo'),
//               onTap: () async {
//                 Navigator.pop(context);
//                 pickImage( source:
//                     ImageSource.camera);
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.image),
//               title: const Text('Choose from gallery'),
//               onTap: () async {
//                 Navigator.pop(context);
//                 pickImage(source:  ImageSource.gallery);
//               },
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }
// void showImagePicker(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     builder: (BuildContext context) {
//       return Container(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             ListTile(
//               leading: const Icon(Icons.camera),
//               title: const Text('Take a photo'),
//               onTap: () async {
//                 Navigator.pop(context);
//                 await pickImage(source: ImageSource.camera);
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.image),
//               title: const Text('Choose from gallery'),
//               onTap: () async {
//                 Navigator.pop(context);
//                 await pickImage(source: ImageSource.gallery);
//               },
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }
//
// Future<void> pickImage({required ImageSource source}) async {
//   try {
//     final image = await ImagePicker().pickImage(source: source);
//     if (image == null) return;
//     final imageTemporary = File(image.path);
//     context.read<AuthCubit2>().selectedImage2 = imageTemporary;
//     setState(() {
//       selectedImage2 = imageTemporary;
//     });
//     print(image.path);
//   } on PlatformException catch (e) {
//     debugPrint('error$e');
//   }
// }
}
