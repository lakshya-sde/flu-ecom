import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flu_ecom/utils/constants/sizes.dart';
import 'package:flu_ecom/utils/validators/validation.dart';
import 'package:flu_ecom/utils/constants/text_strings.dart';
import 'package:flu_ecom/features/authentication/screens/signup/signup.dart';
import 'package:flu_ecom/features/authentication/controllers/login/login_controller.dart';
import 'package:flu_ecom/features/authentication/screens/password_configuration/forget_password.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            //Email
            TextFormField(
              controller: controller.email,
              validator: TValidator.validateEmail,
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TTexts.email,
              ),
            ),
            SizedBox(height: TSizes.spaceBtwInputFields),

            //Password
            Obx(
              () => TextFormField(
                controller: controller.password,
                obscureText: controller.isHidePassword.value,
                validator: (value) => TValidator.validateEmptyText('Password', value),
                decoration: InputDecoration(
                  labelText: TTexts.password,
                  prefixIcon: Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    icon: Icon(controller.isHidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                    onPressed: controller.toggleHidePassword,
                  ),
                ),
              ),
            ),
            SizedBox(height: TSizes.spaceBtwItems / 2),

            //Remeber me & Forgot password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Remeber me
                Row(
                  children: [
                    Obx(
                      () => Checkbox(value: controller.isRememberMe.value, onChanged: controller.toggleRemeberMe),
                    ),
                    Text(TTexts.rememberMe),
                  ],
                ),

                //Forgot password
                TextButton(
                  onPressed: () => Get.to(() => const ForgetPasswordScreen()),
                  child: Text(TTexts.forgetPassword),
                ),
              ],
            ),

            SizedBox(height: TSizes.spaceBtwSections),

            //Sign in Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.login,
                child: Text(TTexts.signIn),
              ),
            ),
            SizedBox(height: TSizes.spaceBtwItems),

            //Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: Text(TTexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
