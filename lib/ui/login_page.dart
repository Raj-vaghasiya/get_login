import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_login/getx_controllers/login_controller.dart';
import 'package:get_login/ui/create_user.dart';

class LogInScreen extends StatelessWidget {
  LogInScrController logInScrController = Get.put(LogInScrController());

  final globalFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.account_circle),
        title: Text("LogIn Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Form(
              key: globalFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        controller: logInScrController.emailController,
                        decoration: InputDecoration(
                          contentPadding: new EdgeInsets.all(15.0),
                          hintText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        validator: (val) {
                          if (val!.isEmpty) return "can't empty null";
                          if (!GetUtils.isEmail(val))
                            return 'Enter a valid email address';

                          return null;
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        obscureText: true,
                        controller: logInScrController.passwordController,
                        decoration: InputDecoration(
                          contentPadding: new EdgeInsets.all(15.0),
                          hintText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        validator: (String? val) {
                          if (val!.isEmpty) return "can't empty null";

                          return null;
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("you don't have an account,"),
                      GestureDetector(
                        onTap: () {
                          Get.to(CreateUserScr());
                        },
                        child: Text(
                          "create account.",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (globalFormKey.currentState!.validate()) {
                          logInScrController.login();
                        }
                      },
                      child: Text("Login"),
                    ),
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
