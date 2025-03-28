import 'package:flutter/material.dart';
import 'package:flu_ecom/utils/theme/theme.dart';
import 'package:flu_ecom/utils/constants/colors.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:flu_ecom/bindings/general_bindings.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: TColors.primary,
        body: Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      ),
    );
  }
}
