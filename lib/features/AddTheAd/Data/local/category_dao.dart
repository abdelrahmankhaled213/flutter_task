import 'package:sqflite/sqflite.dart';

import '../model/categoryModel.dart';

class CategoryDao {

  final Database db;

  CategoryDao(this.db);

  Future<List<CategoryModel>>getCategories()async{

    final maps = await db.query('categories2');
    return maps.map((e) => CategoryModel.fromMap(e)).toList();

  }
  Future<void>insertCategory(CategoryModel categoryModel)async{
    await db.insert('categories2', categoryModel.toMap());
  }

}