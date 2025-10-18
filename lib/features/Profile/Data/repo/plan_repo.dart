import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_task/features/Profile/Data/model/plan_model.dart';

import '../local/plan_dao.dart';

class PlanRepo{

  final PlanDao planDao;

  PlanRepo(this.planDao);

  Future<List<PlanModel>>getAllPlans()async{

    final plans = await planDao.getAllPlans();

  if(plans.isEmpty){

    final jsonString = await rootBundle.loadString('assets/data/plans.json');
    final data = json.decode(jsonString) as List;
    final dataFromJson= data.map((e) => PlanModel.fromMap(e)).toList();

    for (var element in dataFromJson) {
     await planDao.insertPlan(element);

    }

   return dataFromJson;

  }

else{

  return plans;

}

  }
}