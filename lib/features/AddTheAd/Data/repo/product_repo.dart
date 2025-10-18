import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_task/features/AddTheAd/Data/local/product_dao.dart';

import '../model/product_model.dart';

class ProductRepo {

  final ProductDao productDao;

  ProductRepo(this.productDao);

  Future<List<ProductModel>> getAllProducts() async {

    final products = await productDao.getAllProducts();

    if(products.isEmpty){


      final jsonString = await rootBundle.loadString(
          'assets/data/products.json');
      final data = json.decode(jsonString) as List;

      final productsJson = data.map((e) => ProductModel.fromMap(e)).toList();

      for (var element in productsJson) {

        await productDao.insertProduct(element);

      }

      return productsJson;


    }else{
      return products;
    }


  }
}