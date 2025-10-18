import 'package:equatable/equatable.dart';

import '../../Data/model/plan_model.dart';

extension PlanStateX on PlanState {

  bool get getPlansLoading =>PlanStatus.getPlansLoading == status;

  bool get getPlansSuccess =>PlanStatus.getPlansSuccess == status;

  bool get getPlansFailure =>PlanStatus.getPlansFailure == status;
}

enum PlanStatus {

  initial,
  getPlansLoading,
  getPlansSuccess,
  getPlansFailure,

}

class PlanState extends Equatable {

  final List<PlanModel>? plans;
  final PlanStatus status;
  final String? errorMessage;

  const PlanState({
    this.plans,
    required this.status,
    this.errorMessage,
  });

  PlanState copyWith({
    List<PlanModel>? plans,
    PlanStatus? status,
    String? errorMessage,
  }) {
    return PlanState(
      plans: plans ?? this.plans,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [plans, status, errorMessage];

}