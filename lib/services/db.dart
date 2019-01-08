import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:presently/models/event.dart';
import 'package:presently/models/friend.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  Database db;

  DatabaseService() {
    init();
  }

  void init() async {
    Directory appDirectory = await getApplicationDocumentsDirectory();

    final path = join(appDirectory.path, 'presently.db');

    db = await openDatabase(path, version: 1,
        onCreate: (Database newDb, int version) {
      newDb.execute("""
      CREATE TABLE Auth(
      id STRING PRIMARY KEY,
      firstName STRING,
      lastName STRING,
      email STRING,
      phoneNumber STRING,
      profilePicture STRING,
      relationship STRING,
      FOREIGNKEY (events) REFERENCES Events(belongsTo)
      interests BLOB 
            """);
      newDb.execute("""
      CREATE TABLE Events()
      id STRING PRIMARY KEY,
      FOREIGNKEY belongsTo REFERENCES Friends(id)
      FOREIGNKEY ownedBy REFERENCES Friends(id)
      name STRING,
      date STRING,
""");
    });
  }

  Future<List<FriendModel>> getFriends() async {
    List<FriendModel> friends = [];
    final results = await this.db.rawQuery("SELECT * from Friends");
    print(results);
    for (var result in results.toList()) {
      print(result);
//      friends.add(new FriendModel.fromDb(result));
    }
    return friends;
  }

  Future<List<EventModel>> getFriendEvents(id) async {
    List<EventModel> events = [];
    final results = await this.db.rawQuery("SELECT * from EVENTS");
    for (var result in results.toList()) {
      print(result);
    }
  }

  Future<FriendModel> getFriend(int id) async {
    final friend = await db
        .query("Friends", columns: null, where: "id = ?", whereArgs: [id]);
    if (friend.length > 0) {
//      return FriendModel.fromDb(friend.first);
    }
    return null;
  }

  Future<int> addFriend(FriendModel friend) async {
    return 1;
//    return db.insert("Friends", friend.toDB());
  }
}

final DatabaseService dbService = DatabaseService();
