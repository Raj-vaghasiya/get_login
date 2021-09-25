import 'package:get/get.dart';
import 'package:get_login/db/shared_prefrence.dart';
import 'package:get_login/ui/home_page.dart';
import 'package:get_login/ui/intro_scr.dart';
import 'package:get_login/ui/login_page.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    Future.delayed(Duration(milliseconds: 1500), () => check());
  }

  Future cheeckLogin() async {
    print(AppPref().userLogin);

    if (AppPref().userLogin == null) {
      Get.off(LogInScreen());
    } else {
      Get.off(HomePage());
  }
  }

  Future check() async {
    print(AppPref().introScr);
    if (AppPref().introScr == null) {
      Get.off(IntroScr());
    } else {
      cheeckLogin();
    }
  }
}
