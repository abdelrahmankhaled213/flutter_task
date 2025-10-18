import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/features/AddTheAd/presentation/viewmodel/ads_cubit.dart';
import 'package:flutter_task/features/AddTheAd/presentation/widget/product_item.dart';
import '../../../../core/utils/app_color.dart';
import '../viewmodel/ads_state.dart';

class ProductList extends StatelessWidget {

  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<AdsCubit,AdsState>(

      buildWhen: (previous, current) {

        return current.getProductSuccess ||
            current.getProductsFailure ||current.getProductsLoading;
      },
      builder: (context, state) {

        if(state.getProductsLoading){

          return Center(

              child: CircularProgressIndicator(

            color: AppColor.instance.orange,
          )

          );
        }
        if(state.getProductSuccess){

          final products=state.products;

          return GridView.builder(

            shrinkWrap: true,

            physics: NeverScrollableScrollPhysics(),


            itemCount: products?.length,

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

              crossAxisCount: 2,
crossAxisSpacing: 12.sp,
mainAxisSpacing: 8.sp,
              childAspectRatio: (1/1.95),
            )
            , itemBuilder: (context, index) {

            return ProductItem(

              productModel: products![index],

            );

          },
          );
        }

        if(state.getProductsFailure){

          return Text(state.errorMessage!);
        }

       return SizedBox();

      }
    );
  }
}
