import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_login/db/shared_prefrence.dart';
import 'package:get_login/ui/home_page.dart';
import 'package:get_login/ui/singalton_class.dart';

class LogInScrController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // final globalFormKey = GlobalKey<>();

  login() async {
    var data = await Db()
        .userDAO
        .loginData(emailController.text, passwordController.text);
    print(data);
    if (data.isNotEmpty) {
      print("success");
      AppPref().userLoginData = emailController.text;
      Get.off(HomePage());
      emailController.clear();
      passwordController.clear();
    } else {
      print('error');
      Fluttertoast.showToast(
          msg: "enter a valid email or password",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
