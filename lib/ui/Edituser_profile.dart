import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_login/getx_controllers/edit_user_controller.dart';

class EditProfileOfUser extends StatelessWidget {
  const EditProfileOfUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EditUserController editUserTExtFeildData =  Get.put(EditUserController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Edit Profile",
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
                  key: editUserTExtFeildData.editformkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _textField(
                          editUserTExtFeildData.fristNameEditController,
                          "FristName"),
                      _textField(
                          editUserTExtFeildData.lastNameEditController,"LastName"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: editUserTExtFeildData.emailEditController,
                          decoration: InputDecoration(
                            labelText: 'Enter your email',
                            contentPadding: new EdgeInsets.all(8.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          validator: (val) {
                            RegExp regex = new RegExp(
                                r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                r"{0,253}[a-zA-Z0-9])?)*$");
                            if (!regex.hasMatch(val!)) {
                              return 'Enter a valid email address';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          // ignore: unnecessary_statements
                          editUserTExtFeildData.editButton();
                        },
                        child: Text('Done'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _textField(TextEditingController _controller, String _hintText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: _controller,
        decoration: InputDecoration(
          labelText: 'Enter your $_hintText',
          contentPadding: new EdgeInsets.all(8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        validator: (val) {
          if (val!.isEmpty)
            return "can't empty ${_hintText.toLowerCase()} null";

          return null;
        },
      ),
    );
  }
}
