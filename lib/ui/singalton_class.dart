import 'package:get_login/db/app_database.dart';
import 'package:get_login/db/dao.dart';

class Db {
  static final Db _db = Db._internal();
  late UserDatabase database;
  late UserDAO userDAO;

  factory Db() {
    return _db;
  }

  Db._internal() {
    builder();
  }

  builder() async {
    database = await $FloorUserDatabase.databaseBuilder('app_database.db').build();
    userDAO = database.userDAO;
  }
}