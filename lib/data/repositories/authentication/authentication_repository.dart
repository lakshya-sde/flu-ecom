import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flu_ecom/utils/exceptions/format_exceptions.dart';
import 'package:flu_ecom/utils/exceptions/platform_exceptions.dart';
import 'package:flu_ecom/utils/exceptions/firebase_exceptions.dart';
import 'package:flu_ecom/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:flu_ecom/features/authentication/screens/login/login.dart';
import 'package:flu_ecom/features/authentication/screens/onboarding/onborading.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to show relevant screen
  screenRedirect() async {
    // Local Storage
    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') ? Get.offAll(OnboardingScreen()) : Get.offAll(LoginScreen());
  }

  //----------------------Email And Password Login------------------------

  /// [Email Authentication] - Sign In
  Future<UserCredential> signup(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
