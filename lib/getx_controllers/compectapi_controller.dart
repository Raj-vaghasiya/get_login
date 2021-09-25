import 'package:get/get.dart';
import 'package:get_login/api_data/api_modals/compectsapi_modal.dart';
import 'package:get_login/dio/dio.dart';

class CompactApiFetchDataController extends GetxController {

  var compactDetailApiDetail = [];

  @override
  void onInit() {
    int id = Get.arguments;
    compactPostIdapiData(id);
    super.onInit();
  }

  compactPostIdapiData(int id) async {
    if (compactDetailApiDetail.isEmpty) {
      var response = await Api().dio!
          .get("https://jsonplaceholder.typicode.com/comments?postId=$id");
      this.compactDetailApiDetail = (response.data)
          .map<CompactsModal>((x) => CompactsModal.fromJson(x))
          .toList();
    }
    update();
  }
}