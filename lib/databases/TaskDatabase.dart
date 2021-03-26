import 'package:floor/floor.dart';
import 'package:ietvit_app/databases/TaskDao.dart';
import 'package:ietvit_app/entities/Task.dart';

import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'TaskDatabase.g.dart';

@Database(version: 1, entities: [Task])
abstract class UserDatabase extends FloorDatabase{

  TaskDao get taskDao;
}