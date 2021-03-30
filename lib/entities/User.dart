import 'package:floor/floor.dart';

@Entity(tableName: 'userDb')
class User {
  @PrimaryKey(autoGenerate: true)
  final int primary_key;

  final String Name, Role, Profile, Instagram, LinkedIn, Github;
  final String FCM_Token;

  User({this.primary_key,
    this.Name,
    this.Role,
    this.Profile,
    this.Instagram,
    this.LinkedIn,
    this.Github,
    this.FCM_Token});
}

User createUser(record) {
  Map<String, dynamic> attributes = {
    'Name': '',
    'Number': '',
    'Profile': '',
    'Role': '',
    'FCM_Token': '',
    'Instagram': '',
    'LinkedIn': ''
  };

  record.forEach((key, value) => {attributes[key] = value});

  User user = new User(
      Name: attributes['Name'],
      Role: attributes['Role'],
      Profile: attributes['Profile'],
      Instagram: attributes['Instagram'],
      LinkedIn: attributes['LinkedIn'],
      Github: attributes['Github'],
      FCM_Token: attributes['FCM_Token']
  );
  return user;
}
