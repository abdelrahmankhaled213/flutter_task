import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/helpers/font_weight_helper.dart';
import 'package:flutter_task/core/utils/app_color.dart';

class AppStyle{

  AppStyle._internal();

  static AppStyle instance = AppStyle._internal();

  TextStyle mediumTajwalOrange14 = TextStyle(
    fontSize: 14.sp,
    fontFamily: 'Tajawal',
    fontWeight: FontWeightHelper.instance.medium
     , color:AppColor.instance.orange ,
  );


   TextStyle mediumTajwalCustomGrey12 = TextStyle(
    fontFamily: 'Tajawal',
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.instance.medium
     , color: AppColor.instance.customGrey ,
   );


   TextStyle boldTajwalBlue16 =TextStyle(


     fontSize: 16.sp,
     fontFamily: 'Tajawal',
     color: AppColor.instance.blue,
     fontWeight: FontWeightHelper.instance.extraBold



   );

  TextStyle regularTajwalRed12 = TextStyle(

    fontFamily: 'Tajawal',
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.instance.regular
    , color:AppColor.instance.red,

  );



  TextStyle mediumTajwalBlack16 = TextStyle(
    fontFamily: 'Tajawal',
    fontSize: 16.sp,
    fontWeight: FontWeight.bold
     , color:AppColor.instance.black ,

   );




}