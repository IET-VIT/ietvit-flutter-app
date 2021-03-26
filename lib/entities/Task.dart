import 'package:floor/floor.dart';

@Entity(tableName: 'taskDb')
class Task {

  @PrimaryKey(autoGenerate: true)
  final int primary_key;
  final String Description, Status;

  Task({this.primary_key, this.Description, this.Status});
}