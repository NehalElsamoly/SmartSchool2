import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zahra/core/ulits/const.dart';
import 'package:zahra/core/ulits/styles.dart';
import '../../../../../../core/ulits/apiservice3.dart';
import '../../../../Categories/presentation/view/news/news_view.dart';
import '../../../register/presentation/reg/register/presentation/views/register_child_body.dart';
import '../../../register/presentation/reg/register/presentation/views/register_parent.dart';
import '../../../register/presentation/reg/widgets/custom_button.dart';
import '../../../register/presentation/reg/widgets/customtextfield.dart';
import '../../data/repo/authrepoimpl.dart';
import '../../manager3/login3_cubit.dart';
import '../../manager3/login3_state.dart';
import 'forget_password.dart';

class Login extends StatefulWidget {
   Login({super.key});
  static String id = 'login page';
  String ?state;
  String? userType;
  @override
  State<Login> createState() => _LoginState();
}
class _LoginState extends State<Login> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController status = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
// Add this line
  String? state="";
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) => AuthCubit(
          AuthRepoImpl(
            ApiService(
              Dio(),
            ),)),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {},
        builder: (context, authState) {
          if (authState is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (authState != null) {
              return Scaffold(

                backgroundColor: Colors.white,
                body: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height / 15,
                          ),
                          SvgPicture.asset(
                            logoIc,
                            height: MediaQuery
                                .of(context)
                                .size
                                .height / 8,
                          ),
                          SizedBox(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height / 50,
                          ),
                          Text(
                            'Login',
                            style: Styles.style30.copyWith(
                              color: titlecolor,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height / 25,
                          ),
                          CustomTextfield(
                            hintTex: " Email",
                            labelTex: " Email",
                            controller: email,
                            type: TextInputType.emailAddress,
                            preicon: const Icon(Icons.mail, color: kprimarycolor),
                            obs: false,
                          ),
                          SizedBox(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height / 25,
                          ),
                          CustomTextfield(
                            hintTex: " Password",
                            labelTex: " password",
                            controller: password,
                            preicon: const Icon(
                              Icons.lock,
                              color: kprimarycolor,
                            ),
                            obs: true,
                          ),
                          SizedBox(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height / 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Spacer(
                                flex: 2,
                              ),
                              Radio(
                                value: "parent",
                                groupValue: state,
                                onChanged: (value) =>
                                {
                                  if (value != null) {
                                    setState(() {
                                      state = value;
                                    })
                                  }
                                },
                                activeColor: kprimarycolor,
                              ),
                              Text(
                                'parent',
                                style: Styles.style16.copyWith(
                                    color: kprimarycolor),
                              ),
                              const Spacer(
                                flex: 1,
                              ),
                              Radio(
                                value: "student",
                                groupValue: state,
                                onChanged: (value) =>
                                {
                                  if (value != null) {
                                    setState(() {
                                      state = value;
                                    })
                                  }
                                },
                                activeColor: kprimarycolor,
                              ),
                              Text(
                                'student',
                                style: Styles.style16.copyWith(
                                    color: kprimarycolor),
                              ),
                              const Spacer(
                                flex: 2,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height / 25,
                          ),
                          Container(
                            child: authState is AuthLoading
                                ? Center(child: CircularProgressIndicator())
                                : CustomButton(
                              tbutton: "Login",
                              wbutton: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 1.8,
                              hbutton: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 14,
                              colorbutton: kprimarycolor,

                              founbutton: ()async {
                                if (formKey.currentState!.validate()) {
                                  print ("my name");
                                  context.read<AuthCubit>().loginUser(
                                    email: email.text,
                                    password: password.text,
                                    status: state ?? "",
                                  );
                                  SharedPreferences prefs = await SharedPreferences.getInstance();

                                  // Save user type
                                  prefs.setString('userType', state!)??"";
                                 String ?Usertype= prefs.getString('userType');
                                 print(Usertype);
                                //  context.read<AuthCubit>().saveUserType(state!);
                                 // String userType=context.read<AuthCubit>().getUserType();
                                  //String? userType = await context.read<AuthCubit>().getUserType();
                                  if(Usertype == 'parent') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => NewsView()),
                                    );
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Container()),
                                    );
                                  }
                                  // Navigator.push(context, MaterialPageRoute(
                                  //     builder: (BuildContext context) {
                                  //       return  Login();
                                  //     }));

                                }
                              },
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height / 80,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgetPassword()),
                              );
                            },
                            child: Text(
                              'forget your password? ',
                              style: Styles.style12.copyWith(
                                color: textSmall,
                                decoration: TextDecoration.underline,
                                decorationStyle: TextDecorationStyle.solid,
                                decorationColor: textSmall,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height / 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Haven't any account?",
                                style: Styles.style14.copyWith(
                                  color: textsmall,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (
                                            context) =>  RegisterParent()),
                                  );
                                },
                                child: Text("Create account",
                                    style: Styles.style12.copyWith(
                                        color: textlink)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          }
        },
      ),
    );
  }
}


