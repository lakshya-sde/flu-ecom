import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flu_ecom/utils/constants/sizes.dart';
import 'package:flu_ecom/utils/validators/validation.dart';
import 'package:flu_ecom/utils/constants/text_strings.dart';
import 'package:flu_ecom/features/authentication/controllers/signup/signup_controller.dart';
import 'package:flu_ecom/features/authentication/screens/signup/widgets/terms_condition_checkbox.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          //First Name and Last Name
          Row(
            children: [
              //First Name
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) => TValidator.validateEmptyText(TTexts.firstName, value),
                  decoration: InputDecoration(
                    labelText: TTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),

              SizedBox(width: TSizes.spaceBtwInputFields),

              //Last Name
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) => TValidator.validateEmptyText(TTexts.lastName, value),
                  decoration: InputDecoration(
                    labelText: TTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: TSizes.spaceBtwItems),

          //Username
          TextFormField(
            controller: controller.username,
            validator: (value) => TValidator.validateEmptyText(TTexts.username, value),
            decoration: InputDecoration(
              labelText: TTexts.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          SizedBox(height: TSizes.spaceBtwItems),

          //Email
          TextFormField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            decoration: InputDecoration(
              labelText: TTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          SizedBox(height: TSizes.spaceBtwItems),

          //Mobile
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => TValidator.validatePhoneNumber(value),
            decoration: InputDecoration(
              labelText: TTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          SizedBox(height: TSizes.spaceBtwItems),

          //Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              obscureText: controller.isHidePassword.value,
              validator: (value) => TValidator.validatePassword(value),
              decoration: InputDecoration(
                labelText: TTexts.password,
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  icon: Icon(controller.isHidePassword.value ? Iconsax.eye : Iconsax.eye_slash),
                  onPressed: controller.toggleHidePassword,
                ),
              ),
            ),
          ),

          SizedBox(height: TSizes.spaceBtwSections),

          ///Privacy Policy & Terms-&-Conditions
          TermsAndConditionCheckbox(),
          SizedBox(height: TSizes.spaceBtwSections),

          ///Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: controller.signup,
              child: Text(TTexts.createAccount),
            ),
          ),
          SizedBox(height: TSizes.spaceBtwSections),
        ],
      ),
    );
  }
}
