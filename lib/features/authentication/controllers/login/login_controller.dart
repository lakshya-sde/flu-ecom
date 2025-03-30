import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flu_ecom/utils/popup/loaders.dart';
import 'package:flu_ecom/utils/helpers/network_manager.dart';
import 'package:flu_ecom/utils/constants/image_strings.dart';
import 'package:flu_ecom/utils/popup/full_screen_loader.dart';
import 'package:flu_ecom/data/repositories/authentication/authentication_repository.dart';

class LoginController extends GetxController {
  /// Varaiables
  final isRememberMe = false.obs;
  final isHidePassword = true.obs;
  final deviceStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    email.text = deviceStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = deviceStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  void toggleHidePassword() => isHidePassword.value = !isHidePassword.value;
  bool toggleRemeberMe(val) => isRememberMe.value = val;

  Future<void> login() async {
    try {
      /// Start loader
      TFullScreenLoader.openLoadingDialog('Logging you in...', TImages.docerAnimation);

      /// Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        /// Remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Form Validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Save Data if Remember Me is selected
      if (isRememberMe.value) {
        deviceStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        deviceStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Login user using Email and Password Authentication
      final userCredentials = await AuthenticationRepository.instance.login(email.text.trim(), password.text.trim());

      /// Remove loader
      TFullScreenLoader.stopLoading();

      /// Screen Redirection
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      ///Remove loader
      TFullScreenLoader.stopLoading();

      /// Show some generic error message to user
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
