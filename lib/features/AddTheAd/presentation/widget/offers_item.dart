import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_style.dart';

class OfferContainerItem extends StatelessWidget {

  final bool isSelected;
  final String text;
  const OfferContainerItem({super.key,required this.isSelected,required this.text});


  @override
  Widget build(BuildContext context) {


    return Container(

      height: 41.h,

    decoration: BoxDecoration(

color: isSelected? AppColor.instance.orange.withOpacity(0.1)
    :Colors.white70,

    borderRadius: BorderRadius.circular(8.r),

    ),

      padding: EdgeInsetsGeometry.directional(
        top: 8.h,
        bottom: 8.h,
        start: 12.w,
        end: 12.w,
      ),

      child: Text(text,
      style: isSelected? AppStyle.instance.mediumTajwalOrange14
          : AppStyle.instance.mediumTajwalCustomGrey12.copyWith(
        fontSize: 14.sp
      ),
      ),
    );
  }
}
