import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/utils/app_style.dart';
import 'package:flutter_task/features/Profile/Data/model/plan_model.dart';
import 'package:flutter_task/features/Profile/Presentation/widget/banner_widget.dart';
import 'package:flutter_task/features/Profile/Presentation/widget/draw_arc.dart';
import 'package:flutter_task/features/Profile/Presentation/widget/selectPacakge.dart';

import '../../../../core/utils/app_color.dart';


class PackageItem extends StatelessWidget {

  final PlanModel planModel;

  const PackageItem({super.key,required this.planModel});

  @override
  Widget build(BuildContext context) {
    return Stack(

children: [
  if(planModel.tag.isNotEmpty)
  Positioned(right: 2,top: -12,child: BannerWidget(text: planModel.tag,backgroundColor: AppColor.instance.orange.withOpacity(0.3),
  textColor: AppColor.instance.orange,

  )),

_buildCardItem()
],



    );
  }

Widget _buildCardItem(){

    return Padding(
      padding: const EdgeInsets.all(8.0),

      child: Container(

      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(8.r),
      border: Border.all(

        color: AppColor.instance.borderColor,
        width: 1.w,
      ),

        boxShadow: [

      BoxShadow(

        color: Colors.white70.withOpacity(0.2),
        blurRadius: 7.r,
      )
        ]

      ),

      child: _buildColumn(),

      ),
    );

}

Widget _buildColumn() {

return Column(

  children: [

    SelectPacakge(planName: planModel.name
        , price: planModel.price),

  Divider(
  color: AppColor.instance.customGrey.withOpacity(.7),
  thickness: 0.3,
),

SizedBox(
  height: 8.h,
),


    _buildRowFeatures(),
  ]

);
}

Widget _buildRowFeatures() {

    return Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Column(

children: planModel.features.map((e) {

  return _buildFeature(e.message, e.icon);
},).toList()

        ),


GaugeWidget(value: planModel.requests.toDouble(),size: 100.w ,progress: .7,)
      ],
    );
}


Widget _buildFeature(String item,String image){

  String beforeParenthesis = item;
  String afterParenthesis = '';

  if (item.contains('(')) {
    int indexOfParenthesis = item.indexOf('(');
    beforeParenthesis = item.substring(0, indexOfParenthesis).trim();
    afterParenthesis = item.substring(indexOfParenthesis).trim();
  }



    return Padding(
      padding: EdgeInsets.only(top: 8.h,bottom: 8.h),
      child: Align(
        alignment: Alignment.centerRight,
        child: Row(
          children: [

        if(image.isNotEmpty)
            Image.asset(image,),

        SizedBox(
          width: 4.w,
        ),

        Column(
         children: [   Text(
           textAlign: TextAlign.start,
              beforeParenthesis,
              style: AppStyle.instance.mediumTajwalOrange14.copyWith(
                color: AppColor.instance.black,
              ),
            ),

            if (afterParenthesis.isNotEmpty)
              Text(
                ' $afterParenthesis',
                style: AppStyle.instance.mediumTajwalOrange14.copyWith(
                  color: AppColor.instance.orange,
                ),
              ),



          ]

        ) ]
          ),
      ),
    );









}

}

