import 'package:bloc/bloc.dart';
import 'package:flutter_task/features/Profile/Data/repo/plan_repo.dart';
import 'package:flutter_task/features/Profile/Presentation/view_model/plan_state.dart';

import '../../../../core/error/app_exception.dart';

class PlanCubit extends Cubit<PlanState> {

  final PlanRepo planRepo;

  PlanCubit(this.planRepo) : super(PlanState(status: PlanStatus.initial));

  Future<void> getPlans() async {

    emit(state.copyWith(status: PlanStatus.getPlansLoading));

    try {
      final plans = await planRepo.getAllPlans();
      emit(state.copyWith(status: PlanStatus.getPlansSuccess, plans: plans));
    } on CacheException catch (e) {
      emit(state.copyWith(status: PlanStatus.getPlansFailure
          , errorMessage: e.message));
    }
  }


}
