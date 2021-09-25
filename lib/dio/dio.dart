import 'package:dio/dio.dart';

class Api {
  static final Api _instance = Api._internal();
  Dio? dio;

  factory Api() => _instance;

  Api._internal() {
    dio = Dio();
  }
}
