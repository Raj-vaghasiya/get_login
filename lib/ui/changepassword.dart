import 'package:flutter/material.dart';
import 'package:get_login/getx_controllers/edit_password_controller.dart';
import 'package:get/get.dart';
import 'package:get_login/getx_controllers/home_controller.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EditPasswordController editPassCtrl = Get.put(EditPasswordController());
    final HomePageController homeEditCtrl = Get.put(HomePageController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Change Password",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: editPassCtrl.editFormKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            obscureText: true,
                            controller: editPassCtrl.oldPasswordController,
                            decoration: InputDecoration(
                              labelText: "Old password",
                              contentPadding: new EdgeInsets.all(15.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            validator: (val) {
                              if (val!.isEmpty) return "can't empty null";
                              if (val != homeEditCtrl.editUser!.password) {
                                return "enter a valid password";
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            obscureText: true,
                            controller: editPassCtrl.newPasswordController,
                            decoration: InputDecoration(
                              labelText: "New password",
                              contentPadding: new EdgeInsets.all(15.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            validator: (val) {
                              if (val!.isEmpty) return "can't empty null";
                              if (val == homeEditCtrl.editUser!.password)
                                return "please,enter a new password";
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            obscureText: true,
                            controller: editPassCtrl.newPasswordMatchController,
                            decoration: InputDecoration(
                              labelText: "New password",
                              contentPadding: new EdgeInsets.all(15.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            validator: (val) {
                              if (val!.isEmpty) return "can't empty null";
                              if (val == homeEditCtrl.editUser!.password)
                                return "please,enter a new password";
                              if (val != editPassCtrl.newPasswordController.text)
                                return "Not Match";
                              return null;
                            },
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                           editPassCtrl.editPasswordButton();
                          },
                          child: Text('Done'),
                        ),
                      ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
