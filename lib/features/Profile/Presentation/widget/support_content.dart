import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/helpers/font_weight_helper.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_style.dart';

class SupportContent extends StatelessWidget {
  const SupportContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 9.h,
children: [

  Text("باقات مخصصة لك",style: AppStyle.instance.mediumTajwalCustomGrey12.copyWith(
    fontSize: 14.sp,
    color: AppColor.instance.black
  ),),


      Text("تواصل معنا لأختيار الباقة المناسبة لك",
        style: AppStyle.instance.mediumTajwalCustomGrey12.copyWith(
        color: AppColor.instance.black,
          fontWeight: FontWeightHelper.instance.regular
      ),),

      Text("فريق المبيعات",style: AppStyle.instance.boldTajwalBlue16,),

    ]);
  }
}
