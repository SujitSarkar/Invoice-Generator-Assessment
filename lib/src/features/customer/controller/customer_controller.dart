import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/router/router_paths.dart';

class CustomerController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();

  void nextButtonOnTap() {
    if (formKey.currentState!.validate()) {
      Get.toNamed(RouterPaths.vehicleInformation);
    }
  }
}
