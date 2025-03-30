import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flu_ecom/utils/popup/loaders.dart';
import 'package:flu_ecom/data/repositories/user/user_repository.dart';
import 'package:flu_ecom/features/authentication/models/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final UserRepository userRepository = Get.put(UserRepository());

  /// Save user record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        // Convert Name to First and Last Name
        final displayName = userCredentials.user!.displayName ?? '';
        final nameParts = UserModel.nameParts(displayName);
        final lastName = nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '';
        final username = UserModel.generateUsername(displayName);

        // Map Data
        final user = UserModel(
          id: userCredentials.user!.uid,
          firstName: nameParts[0],
          lastName: lastName,
          username: username,
          email: userCredentials.user!.email ?? '',
          phoneNumber: userCredentials.user!.phoneNumber ?? '',
          profilePicture: userCredentials.user!.photoURL ?? '',
        );

        // Save user record
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      TLoaders.warningSnackBar(
        title: 'Data not saved',
        message: 'Something went wrong while saving you information. You can re-save your data in your Profile.',
      );
    }
  }
}
