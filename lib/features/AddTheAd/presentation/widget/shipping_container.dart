import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/utils/app_style.dart';

import '../../../../core/utils/app_color.dart';

class ShippingText extends StatelessWidget {
  const ShippingText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 24.sp,

padding: EdgeInsetsGeometry.directional(

  top: 4.h,
  bottom: 4.h,
  start: 8.w,
  end: 8.w,

),
decoration: BoxDecoration(

color: AppColor.instance.orange.withOpacity(0.1),
  borderRadius: BorderRadius.circular(4.r),
),

      child: Row(

mainAxisAlignment:MainAxisAlignment.spaceBetween,

        children: [

          Row(

            children: [

              Icon(Icons.check,size: 16.sp,color: AppColor.instance.green,),

              SizedBox(width: 6.w,),

              Text("شحن مجانى",style: AppStyle.instance
                  .regularTajwalRed12.copyWith(
                color: AppColor.instance.green
              ),),

            ],

          ),

          Text("لأى عرض تطلبه دلوقتى !",style: AppStyle.instance.regularTajwalRed12.copyWith(
              color: AppColor.instance.black,
              fontSize: 10.sp
          )),

        ],

      )

    );
  }
}
