// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TaskDatabase.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorTaskDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$TaskDatabaseBuilder databaseBuilder(String name) =>
      _$TaskDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$TaskDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$TaskDatabaseBuilder(null);
}

class _$TaskDatabaseBuilder {
  _$TaskDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$TaskDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$TaskDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<TaskDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$TaskDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$TaskDatabase extends TaskDatabase {
  _$TaskDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  TaskDao _taskDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `taskDb` (`primary_key` INTEGER PRIMARY KEY AUTOINCREMENT, `Description` TEXT, `Status` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  TaskDao get taskDao {
    return _taskDaoInstance ??= _$TaskDao(database, changeListener);
  }
}

class _$TaskDao extends TaskDao {
  _$TaskDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _taskInsertionAdapter = InsertionAdapter(
            database,
            'taskDb',
            (Task item) => <String, dynamic>{
                  'primary_key': item.primary_key,
                  'Description': item.Description,
                  'Status': item.Status
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _taskDbMapper = (Map<String, dynamic> row) => Task(
      primary_key: row['primary_key'] as int,
      Description: row['Description'] as String,
      Status: row['Status'] as String);

  final InsertionAdapter<Task> _taskInsertionAdapter;

  @override
  Future<void> clearTaskDb() async {
    await _queryAdapter.queryNoReturn('DELETE FROM taskDb');
  }

  @override
  Stream<List<Task>> loadAllTasks() {
    return _queryAdapter.queryListStream('SELECT * FROM taskDb',
        queryableName: 'taskDb', isView: false, mapper: _taskDbMapper);
  }

  @override
  Future<void> insertTask(Task task) async {
    await _taskInsertionAdapter.insert(task, OnConflictStrategy.abort);
  }
}
