import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_login/getx_controllers/createusescr_controller.dart';

class CreateUserScr extends StatelessWidget {
  const CreateUserScr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CreateUserScrController createUserScrController =
        Get.put(CreateUserScrController());
    return Scaffold(
      appBar: AppBar(
        title: Text("SingUp Screen"),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Form(
              key: createUserScrController.createUserFormkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: TextField(
                              controller:
                                  createUserScrController.fristNameController,
                              decoration: InputDecoration(
                                contentPadding: new EdgeInsets.all(10.0),
                                hintText: 'First Name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Expanded(
                          child: Container(
                            child: TextField(
                              controller:
                                  createUserScrController.lastNameController,
                              decoration: InputDecoration(
                                contentPadding: new EdgeInsets.all(10.0),
                                hintText: 'Last name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: createUserScrController.emailController,
                      decoration: InputDecoration(
                        contentPadding: new EdgeInsets.all(15.0),
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (val) {
                        if (val!.isEmpty) return "can't empty null";
                        if (!GetUtils.isEmail(val)) {
                          return 'Enter a valid email address';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      obscureText: true,
                      controller: createUserScrController.passwordController,
                      decoration: InputDecoration(
                        contentPadding: new EdgeInsets.all(15.0),
                        hintText: 'password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (val) {
                        if (val!.isEmpty) return "can't empty null";

                        return null;
                      },
                    ),
                  ),
                  Padding(


                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      obscureText: true,
                      controller:
                          createUserScrController.conformPasswordController,
                      decoration: InputDecoration(
                        contentPadding: new EdgeInsets.all(15.0),
                        hintText: 'Conform password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (val) {
                        if (val!.isEmpty) return "can't empty null";
                        if (val !=
                            createUserScrController.passwordController.text)
                          return "your password is not match";
                        return null;
                      },
                    ),
                  ),
                  GetBuilder<CreateUserScrController>(
                    init: CreateUserScrController(),
                    builder: (radioVal) => Row(
                      children: [
                        Row(
                          children: [
                            Radio(
                                value: "male",
                                groupValue: radioVal.selectRadio,
                                onChanged: (value) {
                                  radioVal.radioButtonValue(value);
                                }),
                            Text("Male"),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                value: "female",
                                groupValue: radioVal.selectRadio,
                                onChanged: (value) {
                                  radioVal.radioButtonValue(value);
                                }),
                            Text("Female")
                          ],
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      createUserScrController.singUpButton();
                    },
                    child: Text('Singin'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
