import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/utils/app_style.dart';

import '../../../../core/utils/app_color.dart';

class PackagesText extends StatelessWidget {

  const PackagesText({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(

      children: [

        _buildRow(),

        SizedBox(
          height: 12.sp,
        ),

        _buildText()

      ],
    );

  }

 Widget _buildRow() {

    return Builder(
   builder: (context) =>  Padding(

    padding: EdgeInsetsGeometry.only(

      right: 12.sp,
      left: 16.sp
        
    ), child: Row(

          children: [

            GestureDetector(onTap: () {

              Navigator.pop(context);

            },child: Icon(Icons.chevron_right,color: AppColor.instance.black,size: 24.sp,)),

            SizedBox(
              width: 12.sp,
            ),

            Text(
              "أختر الباقات اللى تناسبك",
              style: AppStyle.instance.mediumTajwalBlack16.copyWith(
              fontSize: 24.sp
            ),
            ),

          ],
        ),
   ),
    );
  }
  Widget _buildText () {
    return Padding(
      padding: EdgeInsetsGeometry.only(
        right: 12.sp,
        left: 16.sp,
        
      ),
      child: Text("أختار من باقات التمييز بل أسفل اللى تناسب أحتياجاتك",style: AppStyle.instance
            .regularTajwalRed12.copyWith(
        fontSize: 14.sp,
        color:Colors.grey,
      ),),
    );
  }
}
