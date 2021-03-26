import 'package:floor/floor.dart';
import 'package:ietvit_app/entities/User.dart';

@dao
abstract class UserDao{

  @insert
  Future<void> insertUser(User user);

  @delete
  Future<void> deleteUser(User user);

  @Query('DELETE FROM userDb')
  Future<void> clearDb();

  @Query('SELECT * FROM userDb')
  Stream<List<User>> loadAllUsers();

  @Query('SELECT * FROM userDb WHERE Role = :role')
  Stream<List<User>> loadAllUsersByRole(String role);

  // @Query('SELECT FCM_Token FROM userDb WHERE FCM_Token IS NOT null')
  // Stream<List<String>> loadFCMTokens();

  // @Query('SELECT FCM_Token FROM userDb WHERE Role = :role AND FCM_Token IS NOT null')
  // Stream<List<String>> loadFCMTokensByRole(String role);

  // @Query('SELECT COUNT(*) FROM userDb')
  // Stream<int> getUserCount();

}