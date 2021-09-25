import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_login/ui/singalton_class.dart';

import 'home_controller.dart';


class EditPasswordController extends GetxController{

  final editFormKey = GlobalKey<FormState>();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController newPasswordMatchController = TextEditingController();

  final ctrl  = Get.put(HomePageController());

  editPasswordButton(){
    if (editFormKey.currentState!.validate()) {
      print('hi');
      updateForForgotpass(
          newPasswordMatchController.text,
          ctrl.editUser!.id);
      // AllDataController().allUsers();
      Get.back();
      Fluttertoast.showToast(
          msg: "Your changes is successful done!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }

  }

  updateForForgotpass(password, id) async {
    await Db().userDAO.updateForPassword(password, id);
  }
}