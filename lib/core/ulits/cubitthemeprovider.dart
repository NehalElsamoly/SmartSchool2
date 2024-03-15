// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_theme_management_tutorial/providers/theme_provider.dart';
// import 'package:json_theme/json_theme.dart';
// enum ThemeEnum { Dark, Light }
//
// abstract class ThemeState {}
//
// class ThemeInitial extends ThemeState {}
//
// class ThemeLoaded extends ThemeState {
//   final ThemeData themeData;
//
//   ThemeLoaded(this.themeData);
// }
// class ThemeProvider extends Cubit<ThemeState> {
//
//   ThemeProvider() : super(ThemeInitial()); // Initialize with initial state
//
//   ThemeEnum currentTheme = ThemeEnum.Light;
//   ThemeData? currentThemeData;
//
//   static ThemeProvider? _instance;
//   static ThemeProvider get instance {
//     _instance ??= ThemeProvider();
//     return _instance!;
//   }
//
//   // Future<void> changeTheme(ThemeEnum theme) async {
//   //   currentTheme = theme;
//   //   await _generateThemeData();
//   //   emit(ThemeLoaded(currentThemeData!));
//   // }
//   Future<void> changeTheme(ThemeEnum theme) async {
//     currentTheme = theme;
//     await _generateThemeData();
//     emit(ThemeLoaded(currentThemeData!)); // Emit the new state
//   }
//
//
//
//   Future<void> _generateThemeData() async {
//     String themeStr = await rootBundle.loadString(_getThemeJsonPath());
//     Map themeJson = jsonDecode(themeStr);
//     currentThemeData = ThemeDecoder.decodeThemeData(themeJson);
//   }
//
//   String _getThemeJsonPath() {
//     switch (currentTheme) {
//       case ThemeEnum.Light:
//         return "assets/themes/theme_light.json";
//       case ThemeEnum.Dark:
//         return "assets/themes/theme_dark.json";
//       default:
//         return "assets/themes/theme_light.json";
//     }
//   }
// }
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_theme/json_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeEnum { Dark, Light }

abstract class ThemeState {}

class ThemeInitial extends ThemeState {}

class ThemeLoaded extends ThemeState {
  final ThemeData themeData;

  ThemeLoaded(this.themeData);
}

class ThemeProvider extends Cubit<ThemeState> {
  ThemeProvider() : super(ThemeInitial()); // Initialize with initial state

  late SharedPreferences _prefs;

  static const _themeKey = 'currentTheme';

  static Future<ThemeProvider> create() async {
    var provider = ThemeProvider();
    await provider._init();
    return provider;
  }

  Future<void> _init() async {
    _prefs = await SharedPreferences.getInstance();
    currentTheme = _prefs.containsKey(_themeKey)
        ? ThemeEnum.values[_prefs.getInt(_themeKey)!]
        : ThemeEnum.Light;
    await _generateThemeData();
  }

  ThemeEnum currentTheme = ThemeEnum.Light;
  ThemeData? currentThemeData;

  Future<void> changeTheme(ThemeEnum theme) async {
    currentTheme = theme;
    await _prefs.setInt(_themeKey, theme.index);
    await _generateThemeData();
    emit(ThemeLoaded(currentThemeData!)); // Emit the new state
  }

  Future<void> _generateThemeData() async {
    String themeStr = await rootBundle.loadString(_getThemeJsonPath());
    Map themeJson = jsonDecode(themeStr);
    currentThemeData = ThemeDecoder.decodeThemeData(themeJson);
  }

  String _getThemeJsonPath() {
    switch (currentTheme) {
      case ThemeEnum.Light:
        return "assets/themes/theme_light.json";
      case ThemeEnum.Dark:
        return "assets/themes/theme_dark.json";
      default:
        return "assets/themes/theme_light.json";
    }
  }
}
