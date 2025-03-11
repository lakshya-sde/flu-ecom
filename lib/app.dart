import 'package:flutter/material.dart';
import 'package:flu_ecom/utils/theme/theme.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:flu_ecom/features/authentication/screens/onboarding/onborading.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}
