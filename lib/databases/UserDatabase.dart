import 'package:floor/floor.dart';
import 'package:ietvit_app/databases/UserDao.dart';
import 'package:ietvit_app/entities/User.dart';

import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'UserDatabase.g.dart';

@Database(version: 1, entities: [User])
abstract class UserDatabase extends FloorDatabase{

  UserDao get userDao;
}