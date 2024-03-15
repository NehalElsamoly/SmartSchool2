import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/model/getlevels.dart';
import '../data/repo/authrepo.dart';
import '../presentation/reg/widgets/datepicker.dart';
import 'RegisterState.dart';

class AuthCubit2 extends Cubit<AuthStateregister> {

  AuthCubit2(this.authRepo) : super(AuthInitial());
  final AuthRepo2 authRepo;
  final TextEditingController nameengparent = TextEditingController();
  final TextEditingController namearbparent = TextEditingController();
  final TextEditingController emailparent = TextEditingController();
  final TextEditingController phoneparent = TextEditingController();
  final TextEditingController addressparent = TextEditingController();
  final TextEditingController idparent = TextEditingController();
  final TextEditingController photoidparent = TextEditingController();
//  File? selectedImage;
  DateTime birthparent = DatePicker().selectedDateTime;
  final TextEditingController job = TextEditingController();

  //child
  final TextEditingController childnameen = TextEditingController();
  final TextEditingController childnamear = TextEditingController();
  final TextEditingController childbirthcertificate = TextEditingController();
//  File? selectedImage2;
  DateTime childdatebirth = DatePicker().selectedDateTime;
  final TextEditingController childschoolname = TextEditingController();
  String? state2;
  String? state3;

  //selector
  String? selectedValue;

  // void setImage(File? image) {
  //   selectedImage = image;
  // }

  // Future pickImage({required ImageSource source}) async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: source);
  //     if (image == null) return;
  //     final imageTemporary = File(image.path);
  //
  //     selectedImage = imageTemporary;
  //     print(selectedImage);
  //     // print(image.path);
  //   } on PlatformException catch (e) {
  //     debugPrint('error$e');
  //   }
  // }

  Future<void> Register(
      {required parent_name_en,
      required parent_name_ar,
      required parent_emai,
      required parent_mobile,
      required parent_data_birth,
      required parent_national_id,
      required parent_address,
      required parent_job,
      required parent_gender,
      required child_name_en,
      required child_name_ar,
      required child_date_birth,
      required child_gender,
      required child_level,
      required child_school_name,
      required File? image,
      required File? image2}) async {
    emit(AuthLoading());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      var result = await authRepo.Register(
        parent_name_en: parent_name_en,
        parent_name_ar: parent_name_ar,
        parent_email: parent_emai,
        parent_mobile: parent_mobile,
        parent_data_birth: parent_data_birth,
        parent_national_id: parent_national_id,
        parent_address: parent_address,
        parent_job: parent_job,
        parent_gender: parent_gender,
        child_name_en: child_name_en,
        child_name_ar: child_name_ar,
        child_date_birth: child_date_birth,
        child_gender: child_gender,
        child_level: child_level,
        child_school_name: child_school_name,
        child_birth_certificate: image ?? File(''),
        parent_personal_identification: image2 ?? File(''),
      );
    } on Exception catch (e) {
      print(e.toString());
    }
    print("error");
    // result.fold((failure) {
    //   emit(
    //     AuthFailure(errMessage: failure.errMessage),
    //   );
    // },
    (Message) {
      // prefs.setString('auth-token', token);
      print(Message);
      emit(AuthSuccess());
    };
  }
  GetLevelsResponse? levelmodel ;
  Future<void> FetchLevels() async {
    emit(AuthLoading());
    var result = await authRepo.FetchLevels();
    result.fold(
          (failure) {
        emit(AuthFailure(errMessage: failure.errMessage));
        print ( failure.errMessage);
      },
          (posts) {
        print("sucess cubit");
        levelmodel =posts;
        emit(LevelSuess(levelmodel:levelmodel));
      },
    );
  }
// Future<void> signupUser(
//     {required name, required email, required password}) async {
//   emit(AuthLoading());
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//
//   var result =
//   await authRepo.signupUser(name: name, email: email, password: password);
//   result.fold((failure) {
//     emit(
//       AuthFailure(errMessage: failure.errMessage),
//     );
//   }, (token) {
//     prefs.setString('auth-token', token);
//     emit(AuthSuccess());
//   });
}
