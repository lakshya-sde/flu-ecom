import 'package:flu_ecom/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:flu_ecom/app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flu_ecom/firebase_options.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  /// -- Widgets Bindings
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// -- GetX Local Storage
  await GetStorage.init();

  /// -- Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // -- Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((FirebaseApp value) {

    // Check User Auth
    Get.put(AuthenticationRepository());
  });


  /// -- Load all the Material Design / Themes / Localizations / Bindings
  runApp(const App());
}
