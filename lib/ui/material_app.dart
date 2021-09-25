import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_login/dio/dio.dart';
import 'package:get_login/ui/singalton_class.dart';
import 'package:get_login/ui/splesh_screen.dart';

import '../db/shared_prefrence.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    Db();
    AppPref();
    Api();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
