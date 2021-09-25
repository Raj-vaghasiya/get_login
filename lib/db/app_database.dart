import 'dart:async';

import 'package:floor/floor.dart';
import 'package:get_login/db/dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'modal_class.dart';

part 'app_database.g.dart';

@Database(version:1,entities: [User])
abstract class UserDatabase extends FloorDatabase {
  UserDAO get userDAO;
}