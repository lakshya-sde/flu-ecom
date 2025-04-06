import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:flu_ecom/utils/popup/loaders.dart';
import 'package:flu_ecom/utils/constants/image_strings.dart';
import 'package:flu_ecom/utils/helpers/network_manager.dart';
import 'package:flu_ecom/utils/popup/full_screen_loader.dart';
import 'package:flu_ecom/data/repositories/user/user_repository.dart';
import 'package:flu_ecom/features/personalization/screens/profile/profile.dart';
import 'package:flu_ecom/features/authentication/controllers/user/user_controller.dart';

class UpdateNameController extends GetxController {
  /// Instance
  static UpdateNameController get insance => Get.find();

  /// Variables
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  /// init user data when Home Screen Appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  /// Fetch User Record
  void initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  void updateUserName() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog('We are updating your information...', TImages.docerAnimation);

      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Update user's first & last name in the Firebase Firestore
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim(),
      };
      await userRepository.updateSingleField(name);

      // update the Rx User value
      userController.user.value.firstName = name['FirstName'];
      userController.user.value.lastName = name['LastName'];

      // Remove loader
      TFullScreenLoader.stopLoading();

      // Show Success Message
      TLoaders.successSnackBar(title: 'Congratulations', message: 'Your name has been updated');

      // Move to previous screen
      Get.off(ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
