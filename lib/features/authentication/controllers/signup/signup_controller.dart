import 'package:flu_ecom/data/repositories/authentication/authentication_repository.dart';
import 'package:flu_ecom/data/repositories/user/user_repository.dart';
import 'package:flu_ecom/features/authentication/models/user_model.dart';
import 'package:flu_ecom/utils/helpers/network_manager.dart';
import 'package:flu_ecom/utils/popup/loaders.dart';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:flu_ecom/utils/constants/image_strings.dart';
import 'package:flu_ecom/utils/popup/full_screen_loader.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final firstName = TextEditingController(); // controller for "firstName" input
  final lastName = TextEditingController(); // controller for "lastName" input
  final email = TextEditingController(); // controller for "email" input
  final username = TextEditingController(); // controller for "username" input
  final password = TextEditingController(); // controller for "password" input
  final phoneNumber = TextEditingController(); // controller for "phoneNumber" input
  final Rx<bool> isHidePassword = true.obs; // Observer for hiding / showing the password
  final Rx<bool> isTermsConditionCheckbox = false.obs; // Observer for hiding / showing the password

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// -- Sign up
  Future<void> signup() async {
    try {
      // -- Start Loading
      TFullScreenLoader.openLoadingDialog('We are processing your information...', TImages.docerAnimation);

      // -- Check Internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      // -- Form Validation
      if (!signupFormKey.currentState!.validate()) return;

      // -- Privacy Policy Check
      if (!isTermsConditionCheckbox.value) {
        TLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message: 'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use.',
        );
        return;
      }

      // -- Register user in the firebase authentication and save user data in the Firebase
      final userCredentials = await AuthenticationRepository.instance.signup(email.text.trim(), password.text.trim());

      // -- Save authenticated user data in the Firebase Firestore
      final newUser = UserModel(
        id: userCredentials.user!.uid,
        username: firstName.text.trim(),
        email: email.text.trim(),
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      userRepository.saveUserRecord(newUser);

      // -- Show success message
      TLoaders.successSnackBar(title: 'Congratulations', message: 'You account has been created! Verify email to continue');

      // -- Move to Verify email success screen
    } catch (e) {
      /// Show some generic error message to user
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      ///Remove loader
      TFullScreenLoader.stopLoading();
    }
  }

  void toggleHidePassword() => isHidePassword.value = !isHidePassword.value;
  ValueChanged<bool> toggleTermsConditionCheckbox(val) => isTermsConditionCheckbox.value = val;
}
