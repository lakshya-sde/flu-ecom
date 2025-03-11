import 'package:flutter/material.dart';
import 'package:flu_ecom/utils/constants/sizes.dart';
import 'package:flu_ecom/common/widgets/appbar/appbar.dart';
import 'package:flu_ecom/utils/constants/image_strings.dart';
import 'package:flu_ecom/common/widgets/images/circular_image.dart';
import 'package:flu_ecom/common/widgets/texts/section_heading.dart';
import 'package:flu_ecom/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text('Profile')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// --  Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    CircularImage(image: TImages.user),
                    TextButton(onPressed: () {}, child: Text('Change Profile Picture')),
                  ],
                ),
              ),

              /// -- Details
              SizedBox(height: TSizes.spaceBtwItems / 2),
              Divider(),
              SizedBox(height: TSizes.spaceBtwItems),

              ///Heading Profile Info
              SectionHeading(title: 'Profile Information'),
              SizedBox(height: TSizes.spaceBtwItems),

              ProfileMenu(title: 'Name', value: 'Lakshya Goyal'),
              ProfileMenu(title: 'Username', value: 'lashyag567'),

              SizedBox(height: TSizes.spaceBtwItems),
              Divider(),
              SizedBox(height: TSizes.spaceBtwItems),

              //Heading Personal Info
              SectionHeading(title: 'Personal Information'),
              SizedBox(height: TSizes.spaceBtwItems),

              ProfileMenu(title: 'User Id', value: '456327', icon: Iconsax.copy),
              ProfileMenu(title: 'E-mail', value: 'lakshya@gmail.com'),
              ProfileMenu(title: 'Phone Number', value: '+91 8979034627'),
              ProfileMenu(title: 'Gender', value: 'Male'),
              ProfileMenu(title: 'Date of Birth', value: '04 Sept, 2024'),
              Divider(),
              SizedBox(height: TSizes.spaceBtwItems),

              Center(child: TextButton(onPressed: () {}, child: Text('Close Account', style: TextStyle(color: Colors.red)))),
            ],
          ),
        ),
      ),
    );
  }
}
