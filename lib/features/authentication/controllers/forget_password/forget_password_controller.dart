import 'package:flu_ecom/data/repositories/authentication/authentication_repository.dart';
import 'package:flu_ecom/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:flu_ecom/utils/constants/image_strings.dart';
import 'package:flu_ecom/utils/helpers/network_manager.dart';
import 'package:flu_ecom/utils/popup/full_screen_loader.dart';
import 'package:flu_ecom/utils/popup/loaders.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send Reset Password Email
  void sendResetPasswordEmail() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog('Processing your request...', TImages.docerAnimation);

      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //Send Reset Password Email
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      // Remove Loading
      TFullScreenLoader.stopLoading();

      // Show success screen
      TLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link Sent to Reset your Password');

      //Redirect
      Get.to(ResetPassword(email: email.text.trim()));
    } catch (e) {
      // Remove loading
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Sanp!', message: e.toString());
    }
  }

  /// Re-Send Reset Password Email
  void resendResetPasswordEmail(String email) async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog('Processing your request...', TImages.docerAnimation);

      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //Send Reset Password Email
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove Loading
      TFullScreenLoader.stopLoading();

      // Show success screen
      TLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link Sent to Reset your Password');
    } catch (e) {
      // Remove loading
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Sanp!', message: e.toString());
    }
  }
}
