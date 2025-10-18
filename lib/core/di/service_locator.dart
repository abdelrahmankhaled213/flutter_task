import 'package:flutter_task/features/AddTheAd/Data/local/category_dao.dart';
import 'package:flutter_task/features/Profile/Presentation/view_model/plan_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';
import '../../features/AddTheAd/Data/local/product_dao.dart';
import '../../features/AddTheAd/Data/repo/category_repo.dart';
import '../../features/AddTheAd/Data/repo/product_repo.dart';
import '../../features/AddTheAd/presentation/viewmodel/ads_cubit.dart';
import '../../features/Profile/Data/local/plan_dao.dart';
import '../../features/Profile/Data/repo/plan_repo.dart';
import '../helpers/database_helper.dart';

final getIt=GetIt.instance;

Future<void> initServiceLocator() async{

 //... database...

final db = await DataBaseHelper.initDatabase();
  getIt.registerLazySingleton<Database>(() => db);


  //...dao...

  getIt.registerLazySingleton<ProductDao>(() => ProductDao(getIt()));
  getIt.registerLazySingleton<CategoryDao>(() => CategoryDao(getIt()));
  getIt.registerLazySingleton<PlanDao>(() => PlanDao(getIt()));
 //...repo...

  getIt.registerLazySingleton<ProductRepo>(() => ProductRepo(getIt()));
  getIt.registerLazySingleton<CategoryRepo>(() => CategoryRepo(getIt()));
  getIt.registerLazySingleton<PlanRepo>(() => PlanRepo(getIt()));

  //... cubit...

  getIt.registerFactory<AdsCubit>(() => AdsCubit(
  categoryRepo: getIt(),
  productRepo: getIt(),
  )

  );


getIt.registerFactory<PlanCubit>(() => PlanCubit(

 getIt(),
)

);



}

