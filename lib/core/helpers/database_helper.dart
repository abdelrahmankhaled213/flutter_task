import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

abstract class DataBaseHelper{

  static Future<Database> initDatabase() async {

    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'FlutterTask5.db');
    final db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
    
        CREATE TABLE products (
          id INTEGER PRIMARY KEY,
          name TEXT,
          image TEXT,
          price REAL,
          old_price REAL,
          discount INTEGER,
          is_favorite INTEGER,
          is_in_cart INTEGER,
          category TEXT,
          description TEXT
        )
      ''');


        await db.execute('''
    
        CREATE TABLE categories2 (
          id INTEGER PRIMARY KEY,
          name TEXT,
          image TEXT
        )
      ''');
      },
    );

    await db.execute('''
   CREATE TABLE IF NOT EXISTS plans  (
  id INTEGER PRIMARY KEY,
  name TEXT,
  price INTEGER,
  duration_days INTEGER,
  tag TEXT,
  features TEXT, 
  requests INTEGER,
  is_selected INTEGER
  
  )
    '''
    );

    if (kDebugMode) {

      print("....created......");
    }

    return db;
  }


}