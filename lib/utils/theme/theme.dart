import 'package:flu_ecom/utils/theme/widget_themes/appbar_theme.dart';
import 'package:flu_ecom/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:flu_ecom/utils/theme/widget_themes/text_theme.dart';
import 'package:flu_ecom/utils/theme/widget_themes/checkbox_theme.dart';
import 'package:flu_ecom/utils/theme/widget_themes/chip_theme.dart';
import 'package:flu_ecom/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:flu_ecom/utils/theme/widget_themes/text_field_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  //singleton constructor
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    chipTheme: TChipTheme.lightChipTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    textTheme: TTextTheme.darkTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    chipTheme: TChipTheme.darkChipTheme,
  );
}
