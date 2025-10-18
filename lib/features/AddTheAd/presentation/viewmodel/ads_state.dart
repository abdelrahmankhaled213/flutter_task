import 'package:equatable/equatable.dart';

import '../../Data/model/categoryModel.dart';
import '../../Data/model/product_model.dart';

extension AdsStateX on AdsState {

  bool get getProductsLoading =>AdsStatus.getProductsLoading == status;

  bool get getProductSuccess =>AdsStatus.getProductSuccess == status;

  bool get getProductsFailure =>AdsStatus.getProductsFailure == status;

  bool get getCategoriesLoading =>AdsStatus.getCategoriesLoading == status;

  bool get getCategoriesSuccess =>AdsStatus.getCategoriesSuccess == status;

  bool get getCategoriesFailure =>AdsStatus.getCategoriesFailure == status;

}

enum AdsStatus {

  initial,
  getProductsLoading,
  getProductSuccess,
  getProductsFailure,
  getCategoriesLoading,
  getCategoriesSuccess,
  getCategoriesFailure

}

class AdsState extends Equatable {

  final List<ProductModel>? products;
  final List<CategoryModel>? categories;
  final AdsStatus status;
  final String? errorMessage;

  const AdsState({
    this.categories,
    this.products,
    required this.status,
    this.errorMessage,

  });

  AdsState copyWith({
    List<ProductModel>? products,
    List<CategoryModel>? categories,
    AdsStatus? status,
    String? errorMessage,
  }) {
    return AdsState(

      products: products ?? this.products,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      categories: categories ?? this.categories,

    );
  }

  @override

  List<Object?> get props => [products, status, errorMessage, categories];


}
