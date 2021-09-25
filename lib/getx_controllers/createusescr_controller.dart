import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_login/db/modal_class.dart';
import 'package:get_login/getx_controllers/home_controller.dart';
import 'package:get_login/ui/home_page.dart';
import 'package:get_login/ui/singalton_class.dart';

import '../db/shared_prefrence.dart';
import 'alldata_controller.dart';

class CreateUserScrController extends GetxController {

  final createUserFormkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController fristNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conformPasswordController = TextEditingController();
  String _selectRadio = "";
// final ctrl = Get.find<HomePageController>();


  adduser() async {
    var emp = User(
        fristName: fristNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        password: conformPasswordController.text,
        gender: selectRadio);
    await Db().userDAO.inserttUser([emp]);
  }

  singUpButton() {
    if (createUserFormkey.currentState!.validate()) {
      adduser();
      AppPref().userLoginData = emailController.text;
      Get.off(() => HomePage());
    }
  }

  String get selectRadio => _selectRadio;

  radioButtonValue(value) {
    _selectRadio = value;
    update();
  }

  // @override
  // void onInit() {
  //   ctrl.foredit();
  // }
}
