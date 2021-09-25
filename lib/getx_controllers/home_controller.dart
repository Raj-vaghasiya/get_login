import 'package:get/get.dart';
import 'package:get_login/api_data/api_modals/todos_api.dart';
import 'package:get_login/db/modal_class.dart';
import 'package:get_login/db/shared_prefrence.dart';
import 'package:get_login/dio/dio.dart';
import 'package:get_login/ui/singalton_class.dart';


class HomePageController extends GetxController {

  List<TodoModal> todosApiData = [];
  User? editUser;

  @override
  void onInit() {
    foredit();
    todosApiAllData();
    super.onInit();
  }

  todosApiAllData() async {
    if (todosApiData.isEmpty) {
      var response =
          await Api().dio!.get("https://jsonplaceholder.typicode.com/todos");
      todosApiData =
          (response.data).map<TodoModal>((x) => TodoModal.fromJson(x)).toList();
      update();
    }
  }

  foredit() async {
    var data = await Db().userDAO.emailData(AppPref().userLogin!);
    editUser = data!;
    print(editUser);
    update();
  }
}
