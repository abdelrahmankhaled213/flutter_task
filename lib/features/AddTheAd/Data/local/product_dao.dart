import 'package:flutter_task/features/AddTheAd/Data/model/product_model.dart';
import 'package:sqflite/sqflite.dart';

class ProductDao {

  final Database db;

  ProductDao(this.db);


  Future<void> insertProduct(ProductModel product) async {
    await db.insert(
      'products',
      product.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<ProductModel>> getAllProducts() async {

    final maps = await db.query('products');
    return maps.map((e) => ProductModel.fromMap(e)).toList();

  }

  Future<void> updateFavorite(int id, bool value) async {
    await db.update(
      'products',
      {'is_favorite': value ? 1 : 0},
      where: 'id = ?',
      whereArgs: [id],
    );

}

}