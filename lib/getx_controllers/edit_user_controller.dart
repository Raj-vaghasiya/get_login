import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_login/ui/singalton_class.dart';

import 'alldata_controller.dart';
import 'home_controller.dart';

class EditUserController extends GetxController{



  HomePageController ctrl = Get.put(HomePageController());
  final editformkey = GlobalKey<FormState>();
  TextEditingController fristNameEditController = TextEditingController();
  TextEditingController lastNameEditController = TextEditingController();
  TextEditingController emailEditController = TextEditingController();

   @override
   void onInit() {
     textfilddata();
     super.onInit();
   }

  textfilddata(){
    var data =  ctrl.editUser;
    fristNameEditController..text =  data!.fristName!;
    lastNameEditController..text =  data.lastName!;
    emailEditController..text =  data.email!;
  }

  updateForEdit(int id) async {
    await Db().userDAO.updateForEdit(fristNameEditController.text,
        lastNameEditController.text, emailEditController.text, id);
    update();
  }

   editButton() {
     print('object');
     updateForEdit(ctrl.editUser!.id!);
     ctrl.foredit();
     AllDataController().allUsers();
     Get.back();
     update();
   }

  @override
  void removeListenerId(Object id, VoidCallback listener) {

  }
}