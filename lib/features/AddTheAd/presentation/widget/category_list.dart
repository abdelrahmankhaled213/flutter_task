import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/features/AddTheAd/presentation/viewmodel/ads_cubit.dart';
import 'package:flutter_task/features/AddTheAd/presentation/viewmodel/ads_state.dart';
import '../../../../core/utils/app_color.dart';
import 'category_item.dart';

class CategoryList extends StatelessWidget {

  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {

    return

      BlocBuilder<AdsCubit,AdsState>(

          buildWhen: (previous, current) {
return current.getCategoriesSuccess ||
    current.getCategoriesFailure ||current.getProductsLoading;
          },
          builder: (context, state) {

            if(state.getCategoriesLoading){

              return Center(

                  child: CircularProgressIndicator(

                color: AppColor.instance.orange,
              )

              );

            }

if(state.getCategoriesSuccess){

  final data = state.categories;

  return SizedBox(

      height: 200.h,

      child: ListView.separated(

        scrollDirection: Axis.horizontal,

          itemBuilder: (context, index) {

            return CategoryItem(

              categoryItem: data![index],
            );

          }, separatorBuilder: (BuildContext context, int index) {

            return SizedBox(width: 12.h);

          },
       itemCount: state.categories?.length??0,

      )
      );
}

            if(state.getCategoriesFailure){

              return Center(child: Text(state.errorMessage!)

              );

            }

            return SizedBox.shrink();
      }
      );



  }
}