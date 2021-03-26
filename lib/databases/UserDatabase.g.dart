// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserDatabase.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorUserDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$UserDatabaseBuilder databaseBuilder(String name) =>
      _$UserDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$UserDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$UserDatabaseBuilder(null);
}

class _$UserDatabaseBuilder {
  _$UserDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$UserDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$UserDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<UserDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$UserDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$UserDatabase extends UserDatabase {
  _$UserDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  UserDao _userDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `userDb` (`primary_key` INTEGER PRIMARY KEY AUTOINCREMENT, `Name` TEXT, `Role` TEXT, `Profile` TEXT, `Instagram` TEXT, `LinkedIn` TEXT, `Github` TEXT, `FCM_Token` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _userInsertionAdapter = InsertionAdapter(
            database,
            'userDb',
            (User item) => <String, dynamic>{
                  'primary_key': item.primary_key,
                  'Name': item.Name,
                  'Role': item.Role,
                  'Profile': item.Profile,
                  'Instagram': item.Instagram,
                  'LinkedIn': item.LinkedIn,
                  'Github': item.Github,
                  'FCM_Token': item.FCM_Token
                },
            changeListener),
        _userDeletionAdapter = DeletionAdapter(
            database,
            'userDb',
            ['primary_key'],
            (User item) => <String, dynamic>{
                  'primary_key': item.primary_key,
                  'Name': item.Name,
                  'Role': item.Role,
                  'Profile': item.Profile,
                  'Instagram': item.Instagram,
                  'LinkedIn': item.LinkedIn,
                  'Github': item.Github,
                  'FCM_Token': item.FCM_Token
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _userDbMapper = (Map<String, dynamic> row) => User(
      primary_key: row['primary_key'] as int,
      Name: row['Name'] as String,
      Role: row['Role'] as String,
      Profile: row['Profile'] as String,
      Instagram: row['Instagram'] as String,
      LinkedIn: row['LinkedIn'] as String,
      Github: row['Github'] as String,
      FCM_Token: row['FCM_Token'] as String);

  final InsertionAdapter<User> _userInsertionAdapter;

  final DeletionAdapter<User> _userDeletionAdapter;

  @override
  Future<void> clearDb() async {
    await _queryAdapter.queryNoReturn('DELETE FROM userDb');
  }

  @override
  Stream<List<User>> loadAllUsers() {
    return _queryAdapter.queryListStream('SELECT * FROM userDb',
        queryableName: 'userDb', isView: false, mapper: _userDbMapper);
  }

  @override
  Stream<List<User>> loadAllUsersByRole(String role) {
    return _queryAdapter.queryListStream('SELECT * FROM userDb WHERE Role = ?',
        arguments: <dynamic>[role],
        queryableName: 'userDb',
        isView: false,
        mapper: _userDbMapper);
  }

  @override
  Future<void> insertUser(User user) async {
    await _userInsertionAdapter.insert(user, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteUser(User user) async {
    await _userDeletionAdapter.delete(user);
  }
}
