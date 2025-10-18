import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/helpers/font_weight_helper.dart';
import 'package:flutter_task/core/utils/app_color.dart';
import 'package:flutter_task/core/utils/app_style.dart';

import 'package:flutter_task/features/AddTheAd/Data/model/categoryModel.dart';

class CategoryItem extends StatelessWidget {

  final CategoryModel categoryItem;

  const CategoryItem({super.key,required this.categoryItem});

  @override
  Widget build(BuildContext context) {

    return Column(

      children: [

        Container(

          width: 73.w,

          decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),

          ),

             child: Expanded(
               child: Image.asset(categoryItem.image),
             ),
        ),
SizedBox(height: 3.h,),
        Text(categoryItem.name,style: AppStyle.instance.mediumTajwalCustomGrey12.copyWith(

            fontWeight: FontWeightHelper.instance.regular,
          fontSize: 12.sp,
          color: AppColor.instance.black
        ),)
      ],

    );
  }
}
