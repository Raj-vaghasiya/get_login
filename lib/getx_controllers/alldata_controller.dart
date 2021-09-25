import 'package:get/get.dart';
import 'package:get_login/db/modal_class.dart';
import 'package:get_login/ui/singalton_class.dart';

class AllDataController extends GetxController {
  late List<User> allUser;

  @override
  void onInit() {
    allUsers();
    super.onInit();
  }

  allUsers() async {
    var data = await Db().userDAO.getAllUser();
    allUser = data;
    print(data);
    update();
  }
}
