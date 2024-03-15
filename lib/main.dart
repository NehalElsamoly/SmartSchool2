import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; // Add this line
import 'package:zahra/feature/presentation/Categories/presentation/view/news/data/repo/repoimpl.dart';
import 'package:zahra/feature/presentation/Categories/presentation/view/news/manager/news_cubit.dart';
import 'package:zahra/feature/presentation/Categories/presentation/view/news/news_view.dart';


import 'package:zahra/feature/presentation/auth/login/presentation/views/loginscreen.dart';
import 'package:zahra/feature/presentation/onboarding/presentation/view/onbording.dart';
import 'package:zahra/feature/presentation/onboarding/presentation/widgets/onboarding_video.dart';
import 'package:zahra/feature/presentation/payment/paymentDetails.dart';

import 'core/ulits/apiservice3.dart';
import 'core/ulits/cachehelper.dart';
import 'core/ulits/cubitthemeprovider.dart';
import 'core/ulits/lang.dart';
import 'feature/presentation/Categories/data/repo/repoImpl.dart';
import 'feature/presentation/Categories/manager/posts_cubit.dart';
import 'feature/presentation/Categories/presentation/view/anouncment.dart';
import 'feature/presentation/Categories/presentation/view/postes_view.dart';
import 'feature/presentation/auth/login/presentation/views/forget_password.dart';
import 'feature/presentation/auth/register/data/repo/authrepoimpl.dart';
import 'feature/presentation/auth/register/manager3/RegisterCubit.dart';
import 'feature/presentation/auth/register/presentation/reg/register/presentation/views/register_parent.dart';
import 'feature/presentation/settings/settings/feedback.dart';
import 'feature/presentation/settings/settings/setting_view.dart';
int ?initScreen;
void main() async{
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized
  SharedPreferences preferences= await SharedPreferences.getInstance();
  await preferences.setInt("initScreen", 1);
  initScreen=await preferences.getInt("initScreen")??1;
  //await CacheHelper.init();
   Widget ?widget;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (initScreen ==0|| initScreen ==null) {
    widget = const Onbording();
    //GoRouter.of(context).push(OnboardingScreen.routeName);
  } else if (prefs.getString('auth-token')?.isEmpty??false ||
      prefs.getString('auth-token') == null) {
    widget = Login();
  } else {
    String ?Usertype= prefs.getString('userType');
    print(Usertype);
    //  context.read<AuthCubit>().saveUserType(state!);
    // String userType=context.read<AuthCubit>().getUserType();
    //String? userType = await context.read<AuthCubit>().getUserType();
    if(Usertype == 'parent') {
      widget= const ForgetPassword();

    } else {
  widget= const ForgetPassword();

  }
  }

  var themeProvider = await ThemeProvider.create(); // Create the provider

  //Widget widget;


  SharedPreferences s= await SharedPreferences.getInstance();
// Ensure Flutter is initializedبتتاكد ان كل الكلام الي ف ماين اتنفذ الاول
  var delegate = await LocalizationDelegate.create(
      fallbackLocale: 'en_US',
      preferences: TranslatePreferences(), //nehaaaaaaaaaaaaaaaaaaaaaaal
      supportedLocales: [
        'en_US',
        'ar',
        'es', // Adding Spanish locale
      ]);
  runApp(
      LocalizedApp(delegate,

      MultiBlocProvider(
      providers: [
    BlocProvider(
    create: (context) => ThemeCubit()..init(),
  ),
  BlocProvider.value(
  value: themeProvider,),
        BlocProvider(create: (contect)=>AuthCubit2(
            AuthRepoImpl2(
              ApiService(
                Dio(),
              ),
            )
        )),
            BlocProvider(

            create: (BuildContext context) =>PostsCubit(HomeRepoImpl(ApiService(Dio(),),)),
            ),
        BlocProvider(
          create: (BuildContext context) =>NewsCubit(NewsRepoImpl(ApiService(Dio(),),))..fetchNews()
        )
  ], child: MyApp(startWidget: widget,),
      )));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.startWidget,});
 final Widget startWidget;
  Future<Locale>  loadSelectedLanguage(LocalizationDelegate delegate) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedLanguage = prefs.getString('selectedLanguage');
    if (savedLanguage != null) {
      return Locale(savedLanguage);
    }
    return delegate.currentLocale;
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;

    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return BlocBuilder<ThemeProvider, ThemeState>(
              builder: (context, state) {
                ThemeData themeData = context.read<ThemeProvider>().currentThemeData!;
                if (state is ThemeLoaded) {
                  themeData = state.themeData;
                }

      return MaterialApp(
          theme: themeData,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          localizationDelegate
        ],
        supportedLocales: localizationDelegate.supportedLocales,
        locale: localizationDelegate.currentLocale,
  home: NewsView()
  // home:AnouncmentView(),
   // home:WelcomeStarting(),
    // home:startWidget
     //   home:RegisterParent(),
       // home: SettingView(),
      //  home: MyImageSlider(),
        // home: ReactsPost(),
       //  home: initScreen ==0|| initScreen ==null ?const Onbording(): Login(),
        // home:  Login(),
        // home: const Massage(),
        // home: const MassageRegister(),
        // home: const ForgetPassword(),
      );
    });


        });
  }
}
class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(lightThemeData);

  static const _themeKey = 'theme';

  void init() async {
    final prefs = await SharedPreferences.getInstance();
    final themeIndex = prefs.getInt(_themeKey);
    if (themeIndex != null) {
      emit(_themeFromIndex(themeIndex));
    }
  }



  void toggleTheme() async {
    final newTheme = state == lightThemeData ? darkThemeData : lightThemeData;
    emit(newTheme);
    final prefs = await SharedPreferences.getInstance();
    final themeIndex = newTheme == lightThemeData ? 0 : 1;
    prefs.setInt(_themeKey, themeIndex);
  }

  ThemeData _themeFromIndex(int index) {
    return index == 0 ? lightThemeData : darkThemeData;
  }
}

final lightThemeData = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.blue,
  primaryColor: Colors.blue, // Example primary color
  textTheme: const TextTheme(
    bodyText1: TextStyle(color: Colors.black), // Example text color
  ),
);

final darkThemeData = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,
  primaryColor: Colors.green, // Example primary color
  textTheme: const TextTheme(
    bodyText1: TextStyle(color: Colors.white), // Example text color
  ),
);