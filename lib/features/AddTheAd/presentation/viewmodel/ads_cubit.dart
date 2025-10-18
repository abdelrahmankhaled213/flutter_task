import 'package:bloc/bloc.dart';
import 'package:flutter_task/features/AddTheAd/Data/repo/category_repo.dart';
import '../../../../core/error/app_exception.dart';
import '../../Data/repo/product_repo.dart';
import 'ads_state.dart';


class AdsCubit extends Cubit<AdsState> {

  final ProductRepo productRepo;
  final CategoryRepo categoryRepo;

  AdsCubit({
  required this.productRepo,
  required this.categoryRepo
}) : super(AdsState(

    status: AdsStatus.initial,

  ));


  Future<void> getProducts() async {

    emit(
        state.copyWith(status: AdsStatus.getProductsLoading));

    try {

      final products = await productRepo.getAllProducts();
      emit(
          state.copyWith(status: AdsStatus.getProductSuccess
          , products: products));


    } on CacheException catch (e,stacktrace) {


      emit(state.copyWith(status: AdsStatus.getProductsFailure
          , errorMessage: e.message));
    }

    }

    Future<void> getCategories() async {

    emit(state.copyWith(status: AdsStatus.getCategoriesLoading));

    try {

      final categories = await categoryRepo.getCategories();

      emit(state.copyWith(status: AdsStatus.getCategoriesSuccess,
          categories: categories
          , ));

    } on CacheException catch (e) {

      emit(state.copyWith(status: AdsStatus.getCategoriesFailure
          , errorMessage: e.message));
    }
 }
}
