import 'package:get/get.dart';

class SettingController extends GetxController{
  static SettingController get instance => Get.find();

  Rx<bool> switch1 = false.obs;
  Rx<bool> switch2 = false.obs;
  Rx<bool> switch3 = false.obs;

  void toggleSwitch1(val){
      switch1.value = val;
  }
  void toggleSwitch2(val){
      switch2.value = val;
  }
  void toggleSwitch3(val){
      switch3.value = val;
  }

}