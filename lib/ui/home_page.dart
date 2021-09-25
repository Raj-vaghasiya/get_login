import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_login/db/shared_prefrence.dart';
import 'package:get_login/getx_controllers/home_controller.dart';
import 'package:get_login/ui/changepassword.dart';
import 'package:get_login/ui/compact_api.dart';

import 'Edituser_profile.dart';
import 'login_page.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  var ctrl = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
      ),
      drawer: drawerManu(),
      body: GetBuilder<HomePageController>(builder: (_) {
        try {
          if (ctrl.todosApiData.isNotEmpty) {
            return ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: ctrl.todosApiData.length,
              padding: EdgeInsets.all(0),
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  color: ctrl.todosApiData[index].completed!
                      ? Colors.green
                      : Colors.red,
                  child: ListTile(
                    onTap: () {
                      Get.to(SecondApi(),
                          arguments: ctrl.todosApiData[index].id);
                    },
                    title:
                        Text("Id:-${ctrl.todosApiData[index].id.toString()}"),
                    subtitle: Text(
                        "Title:-${ctrl.todosApiData[index].title}\nCompleted:-${ctrl.todosApiData[index].completed}"),
                  ),
                ),
              ),
            );
          }
        } catch (e) {
          Fluttertoast.showToast(
              msg: "Oops! your network is slow",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
        return Center(child: CircularProgressIndicator());
      }),
    );
  }

   drawerManu() {
    return Container(
      width: 300,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromARGB(180, 250, 250, 250),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(31, 38, 135, 0.4),
            blurRadius: 8.0,
          )
        ],
        border: Border(
          right: BorderSide(
            color: Colors.white70,
          ),
        ),
      ),
      child: Stack(
        children: [
          SizedBox(
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 4.0,
                  sigmaY: 4.0,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.grey.withOpacity(0.0),
                      Colors.white.withOpacity(0.2),
                    ]),
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("images/profile.png"),
                      radius: 30.0,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                                "${ctrl.editUser!.fristName} ${ctrl.editUser!.lastName}"),
                          ),
                          SizedBox(height: 5),
                          Center(
                            child: Text("${ctrl.editUser!.email}"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      onTap: () {
                        Get.to(EditProfileOfUser());
                      },
                      leading: Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                      title: Text("Edit Profile"),
                    ),
                    ListTile(
                      onTap: () {
                        Get.to(ChangePassword());
                      },
                      leading: Icon(
                        Icons.change_circle,
                        color: Colors.black,
                      ),
                      title: Text("Change password"),
                    ),
                    ListTile(
                      onTap: () async {
                        dailog();
                      },
                      leading: Icon(
                        Icons.logout,
                        color: Colors.black,
                      ),
                      title: Text("Log Out"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  dailog() {
    Get.defaultDialog(
      title: "Log out",
      titleStyle: TextStyle(fontSize: 25),
      middleText: "Are you sure for logout?",
      middleTextStyle: TextStyle(fontSize: 15),
      textCancel: "Cancel",
      cancelTextColor: Colors.blue,
      textConfirm: "Log Out",
      confirmTextColor: Colors.white,
      onCancel: () {
        Get.back();
      },
      onConfirm: () {
        AppPref().removeUser();
        Get.off(LogInScreen());
      },
      barrierDismissible: false,
    );
  }
}
