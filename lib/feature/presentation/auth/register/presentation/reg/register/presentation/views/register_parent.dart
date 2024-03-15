import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zahra/core/ulits/const.dart';
import 'package:zahra/core/ulits/styles.dart';
import 'package:zahra/feature/presentation/auth/register/manager3/RegisterCubit.dart';
import 'package:zahra/feature/presentation/auth/register/presentation/reg/register/presentation/views/register_parent_body.dart';

import '../../../../../../../../../core/ulits/apiservice3.dart';
import '../../../../../data/repo/authrepoimpl.dart';
import '../../../../../manager3/RegisterState.dart';

class RegisterParent extends StatelessWidget {
  const RegisterParent({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
     backgroundColor: textbutton,
     body: Padding(
       padding: EdgeInsets.symmetric(horizontal: 25.sp),
       child: SingleChildScrollView(
         scrollDirection: Axis.vertical,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             SizedBox(
               height: MediaQuery
                   .of(context)
                   .size
                   .height / 50,
             ),
             SvgPicture.asset(
               logoIc,
               height: MediaQuery
                   .of(context)
                   .size
                   .height * 0.1,
             ),
             SizedBox(
               height: MediaQuery
                   .of(context)
                   .size
                   .height * 0.015,
             ),
             Text(
               'Register',
               style: Styles.style30.copyWith(
                   color: titlecolor),
             ),
             SizedBox(
               height: MediaQuery
                   .of(context)
                   .size
                   .height * 0.02,
             ),
             Text(
               "Please enter your name English, name Arabic, email, phone number Address, National ID, photo of National ID  and date of birth, Job and Gendar for your account",
               style: Styles.style16.copyWith(color: text),
             ),
             SizedBox(
               height: MediaQuery
                   .of(context)
                   .size
                   .height / 25,
             ),
             RegisterParentBody(),
           ],
         ),
       ),
     ),
            );

    }

  }


