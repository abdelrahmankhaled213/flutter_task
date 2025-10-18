import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_style.dart';

class SelectPacakge extends StatefulWidget {
final String planName;
final int price;

  const SelectPacakge({super.key,required this.planName,required this.price});

  @override
  State<SelectPacakge> createState() => _SelectPacakgeState();
}

class _SelectPacakgeState extends State<SelectPacakge> {

  bool value = false;

  @override
  Widget build(BuildContext context) {
return Padding(
  padding: EdgeInsets.only(
   left: 16.sp,
    right: 12.sp
  ),
  child: Row(

      mainAxisAlignment: MainAxisAlignment.spaceBetween,

    children: [

     Row(
       children: [

         Checkbox.adaptive(

               activeColor: value==true ? AppColor.instance.blue:
               AppColor.instance.black
           ,checkColor: Colors.white,value: value
            , onChanged: (selected) {

              setState(() {
            value = selected!;
              });
            },),

          SizedBox(
            width: 4.w,
          ),

          Text(
           widget .planName,
            style: value ? AppStyle.instance.mediumTajwalBlack16.copyWith(
              color: AppColor.instance.blue
            ) : AppStyle.instance.mediumTajwalBlack16,
          ),
       ],
     ),

  Text(
    "${widget.price}ج.م",
    style: AppStyle.instance.mediumTajwalBlack16.copyWith(
  color: AppColor.instance.orange,
  fontSize: 16.sp,
  decorationColor: AppColor.instance.orange,
  decoration: TextDecoration.underline,
  decorationStyle: TextDecorationStyle.solid,
    fontWeight: FontWeight.bold
    ),
  )

    ]
  ),
);
  }
}
