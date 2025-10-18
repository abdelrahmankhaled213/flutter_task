import 'package:sqflite/sqflite.dart';

import '../model/plan_model.dart';

class PlanDao{

  final Database db;
  PlanDao(this.db);

Future<void> insertPlan(PlanModel plan) async {


  await db.insert('plans', plan.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
}

Future<List<PlanModel>> getAllPlans() async {
  final maps = await db.query('plans');
  return maps.map((e) => PlanModel.fromMap(e)).toList();
}

Future<void> updateSelection(int id, bool value) async {

  await db.update('plans', {'is_selected': value ? 1 : 0},
      where: 'id = ?', whereArgs: [id]);

}

}