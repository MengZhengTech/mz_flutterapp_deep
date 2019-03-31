import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final String table = 'User';
final String columnId = 'id';
final String columnGuid = 'guid';
final String columnLoginName = 'loginName';
final String columnLoginPwd = 'loginPwd';
final String columnType = 'type';
final String columnChatSign = 'chatSign';
final String columnName = 'name';
final String columnSignature = 'signature';
final String columnDateTime = 'dateTime';
class User {
  int id;
  String guid;
  String loginName;
  String loginPwd;
  String type;
  String chatSign;
  String name;
  String signature;
  String dateTime;
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnGuid: guid,
      columnLoginName: loginName,
      columnLoginPwd: loginPwd,
      columnType: type,
      columnChatSign: chatSign,
      columnName: name,
      columnSignature: signature,
      columnDateTime: dateTime
    };
    if (id != null && id != 0) {
      map[columnId] = id;
    }
    return map;
  }

  User(int id, String guid, String loginName, String loginPwd, String type, String chatSign, String name, String signature,String dateTime) {
    this.id = id;
    this.guid = guid;
    this.loginName = loginName;
    this.loginPwd = loginPwd;
    this.type = type;
    this.chatSign = chatSign;
    this.name = name;
    this.signature = signature;
    this.dateTime = dateTime;
  }

  User.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    guid = map[columnGuid];
    loginName = map[columnLoginName];
    loginPwd = map[columnLoginPwd];
    type = map[columnType];
    chatSign = map[columnChatSign];
    name = map[columnName];
    signature = map[columnSignature];
    dateTime = map[columnDateTime];
  }
}
class UserSqlite {
  Database db;
  openSqlite() async {
    // 获取数据库文件的存储路径
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');

//根据数据库文件路径和数据库版本号创建数据库表
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute('CREATE TABLE $table ($columnId INTEGER PRIMARY KEY,$columnGuid TEXT,$columnLoginName TEXT,$columnLoginPwd REAL,$columnType TEXT,$columnChatSign TEXT,$columnName TEXT,$columnSignature TEXT,$columnDateTime TEXT)');
        });
  }

  // 插入一条数据
  Future<User> insert(User user) async {
    user.id = await db.insert(table, user.toMap());
    return user;
  }

  // 查找所有数据信息
  Future<List<User>> getAll() async {
    List<Map> maps = await db.query(table, columns: [
      columnId,
      columnGuid,
      columnLoginName,
      columnLoginPwd,
      columnType,
      columnChatSign,
      columnName,
      columnSignature,
      columnDateTime
    ]);

    //if (maps == null || maps.length == 0) {
      //return null;
    //}

    List<User> users = [];
    for (int i = 0; i < maps.length; i++) {
      users.add(User.fromMap(maps[i]));
    }
    return users;
  }

  // 根据guid查找数据
  Future<User> getUser(String guid) async {
    List<Map> maps = await db.query(table,
        columns: [
          columnId,
          columnGuid,
          columnLoginName,
          columnLoginPwd,
          columnType,
          columnChatSign,
          columnName,
          columnSignature,
          columnDateTime
        ],
        where: '$columnGuid = ?',
        whereArgs: [guid]);
    if (maps.length > 0) {
      return User.fromMap(maps.first);
    }
    return null;
  }

  // 根据guid删除数据
  Future<int> delete(String guid) async {
    return await db.delete(table, where: '$columnGuid = ?', whereArgs: [guid]);
  }

  // 更新数据
  Future<int> update(User user) async {
    return await db.update(table, user.toMap(),
        where: '$columnGuid = ?', whereArgs: [user.guid]);
  }

  // 记得及时关闭数据库，防止内存泄漏
  close() async {
    await db.close();
  }
}

