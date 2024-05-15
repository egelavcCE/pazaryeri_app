
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PrivacyPolicyController extends GetxController {
  var isChecked = false.obs;

  @override
  void onInit() {
    super.onInit();
    isChecked.value = false;
  }

  void toggleCheckbox(bool? value) {
    isChecked.value = value ?? false;
    update();
  }
}
