import 'dart:developer';

import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as P;
import 'package:testessava/models/pdv_model.dart';

class SqlDb extends GetxService {
  static Database? _db;
  SqlDb._privateConstructor();
  static final SqlDb instance = SqlDb._privateConstructor();
  static final String _tableName = "pdv";

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDb();
      return _db;
    } else {
      return _db;
    }
  }

  initialDb() async {
    String databasepath = await getDatabasesPath();
    String path = P.join(databasepath, 'essava.db');
    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onUpgrade(Database db, int oldversion, int newversion) {
    log('OnUpgrade =====================');
  }

  _onCreate(Database db, int version) async {
    await db.execute(''' 
    CREATE TABLE $_tableName (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      code TEXT NOT NULL,
      lon TEXT NOT NULL,
      lalt TEXT NOT NULL

    )
    ''');

    log('OnCreate =====================');
  }

// SELECT
  Future<List<Pdv>> selectData() async {
    Database? mydb = await instance.db;
    final List<Map<String, dynamic>> maps = await mydb!.query(_tableName);
    //List<Map> response = await mydb!.rawQuery(sql);
    return List.generate(maps.length, (index) {
      return Pdv(
        id: maps[index]["id"],
        code: maps[index]["code"],
        lon: maps[index]["lon"].toString(),
        lalt: maps[index]["lalt"].toString(),
      );
    });
  }

// INSERT
  Future<int> insertData(Pdv pdv) async {
    Database? mydb = await instance.db;
    //int response = await mydb!.rawInsert(sql);
    return await mydb!.insert(_tableName, pdv.toMap());
  }

// UPDATE

  Future<Pdv> updateData(Pdv pdv) async {
     Database? mydb = await instance.db;
    // //int response = await mydb!.rawUpdate(sql);
    // return await mydb!.update(
    //   _tableName,
    //   pdv.toMap(),
    //   where: "id = ?",
    //   whereArgs: [pdv.id],
    // );
    final id = await mydb!.rawUpdate(
        'UPDATE pdv SET code = ?, lon = ?, lalt = ? WHERE id = ?',
        [pdv.code, pdv.lon, pdv.lalt,pdv.id]);

      print(id);
    return pdv.copy(id : id);
  }

// DELETE

  Future<int> deleteData(Pdv pdv) async {
    Database? mydb = await instance.db;

    //int response = await mydb!.rawDelete(sql);
    return await mydb!.delete(
      _tableName,
      where: "id = ?",
      whereArgs: [pdv.id],
    );
  }
}
