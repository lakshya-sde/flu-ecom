import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flu_ecom/features/shop/models/category_model.dart';
import 'package:flu_ecom/utils/exceptions/platform_exceptions.dart';
import 'package:flu_ecom/utils/exceptions/firebase_auth_exceptions.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get to => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get All Categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      return snapshot.docs.map((doc) => CategoryModel.fromSnapshot(doc)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again. Error- ${e.toString()}';
    }
  }

  /// Get Sub Categories

  /// Upload Categories to the Cloud Firebase
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    // try {
    //   // Upload all the Categories along with their Images
    //   // final storage = Get.put()

    //   // Loop through each category
    //   for (var category in categories) {
    //     // Get ImageData Link from the local assets
    //     final file = await storage.getImageDataFromAssets(category.image);

    //     // Upload Image and Get its URL
    //     final url = await storage.uploadImageData('Categories', file, category.name);

    //     // Assign URL to Category.image attribute
    //     category.image = url;

    //     // Store category in Firestore
    //     await _db.collection('Categories').doc(category.id).set(category.toJson());
    //   }
    // } on FirebaseException catch (e) {
    //   throw TFirebaseAuthException(e.code).message;
    // } on PlatformException catch (e) {
    //   throw TPlatformException(e.code).message;
    // } catch (e) {
    //   throw 'Something went wrong. Please try again. Error- ${e.toString()}';
    // }
  }
}
