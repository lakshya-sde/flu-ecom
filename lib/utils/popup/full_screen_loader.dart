import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flu_ecom/utils/constants/colors.dart';
import 'package:flu_ecom/utils/helpers/helper_functions.dart';
import 'package:flu_ecom/utils/loaders/animation_loader.dart';

class TFullScreenLoader {
  /// Opens a full screen loading dialog with a given text and navigation

  /// Parameters:-
  ///   - text: The text to be displayed in the loading dialog
  ///   - animation: The Lottie animation to be shown

  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: THelperFunctions.isDarkMode(Get.context!) ? TColors.dark : TColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 250),
              TAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  /// Stop the currently open loading page
  /// This method doesn't return nothing
  static void stopLoading() {
    Navigator.of(Get.overlayContext!).pop(); // Close the dialog using the Navigator
  }
}
