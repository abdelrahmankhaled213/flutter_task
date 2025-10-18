import 'dart:convert';

import 'package:flutter/services.dart';

import '../local/category_dao.dart';
import '../model/categoryModel.dart';

class CategoryRepo {

  final CategoryDao categoryDao;

  CategoryRepo(this.categoryDao);

  Future<List<CategoryModel>>getCategories()async{

    final categories = await categoryDao.getCategories();

    if(categories.isEmpty){

final jsonString = await rootBundle.loadString("assets/data/category.json");

final data = json.decode(jsonString) as List;


final categoriesFormJson = data.map((e)
=> CategoryModel.fromMap(e)).toList();

for (var element in categoriesFormJson) {
  await categoryDao.insertCategory(element);
}



return categoriesFormJson;

    }

    else{
      return categories;

    }


  }

}