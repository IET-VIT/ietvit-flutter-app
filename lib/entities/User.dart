import 'package:floor/floor.dart';

@Entity(tableName: 'userDb')
class User {

  @PrimaryKey(autoGenerate: true)
  final int primary_key;

  final String Name, Role, Profile, Instagram, LinkedIn, Github;
  final String FCM_Token;

  User({this.primary_key, this.Name, this.Role, this.Profile, this.Instagram, this.LinkedIn, this.Github, this.FCM_Token});
}