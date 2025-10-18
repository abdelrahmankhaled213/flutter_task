import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/helpers/font_weight_helper.dart';
import 'package:flutter_task/features/AddTheAd/Data/model/product_model.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_image.dart';
import '../../../../core/utils/app_style.dart';

class ProductItem extends StatelessWidget {

  final ProductModel productModel;

  const ProductItem({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Container(


      decoration: BoxDecoration(
border: Border.all(
  color: Colors.grey.shade300,
),
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(4.r)
          ,topLeft: Radius.circular(4.r),),
      ),
      child: _buildProductColumn(),

    );
  }

  Widget _buildProductColumn() {

    return Column(

      children: [

        Expanded(
          child: Image.asset(productModel.image
            , height: 215.h, width: 158.w,
            fit: BoxFit.fitWidth,
            ),
        ),

        _buildProductDiscountIcon(),

        _buildProductDiscountPrice(),

        _buildHowManyPaid(),

        _buildLastContent()

      ],


    );
  }

  Widget _buildProductDiscountIcon() {

    return Padding(
      padding: EdgeInsetsGeometry.directional(

          start: 3.w,

          end: 3.w,

          top: 8.h,

          bottom: 4.h

      ),

      child: Row(

          children: [

            Text(productModel.name
              , style: AppStyle.instance.mediumTajwalCustomGrey12.copyWith(

                  fontSize: 14.sp,
                  color: AppColor.instance.black
              ),),

            Image.asset("assets/images/bxs_offer.png"
              , height: 50.h, width: 50.h, fit: BoxFit.cover,)
          ]
      ),
    );
  }

  Widget _buildProductDiscountPrice() {

    return Padding(

      padding: EdgeInsetsGeometry.directional(

          start: 2.w,

          end: 2.w,

          top: 4.h,

          bottom: 2.h

      ),

      child: Row(

          children: [

            Text.rich(

                maxLines: 1,

                TextSpan(

                    children: [


                      TextSpan(

                          text: " ${productModel.price} جم/",
                          style: AppStyle.instance.regularTajwalRed12
                      ),


                      TextSpan(
                          text: " ${productModel.oldPrice} ",
                          style: AppStyle.instance.regularTajwalRed12.copyWith(
                              color: Colors.grey,
                              overflow: TextOverflow.ellipsis,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: Colors.grey

                          )


                      ),

                      TextSpan(

                          text: "...",
                          style: AppStyle.instance.regularTajwalRed12
                      )

                    ]
                )
            ),

            IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border
              , size: 20.sp,)
            )

          ]
      ),
    );
  }


  Widget _buildHowManyPaid() {
    return Padding(

      padding: EdgeInsetsGeometry.directional(

          start: 8.w,

          end: 8.w,

          top: 4.h,

          bottom: 4.h


      ),
      child: Row(

        children: [

          Image.asset("assets/images/local_fire_department.png",

            height: 15.h, width: 15.h
            ,),

          SizedBox(width: 10.w,),

          Text("تم بيع 3.3k+",
            style: AppStyle.instance.mediumTajwalCustomGrey12
                .copyWith(

                fontSize: 12.sp,
                fontWeight: FontWeightHelper.instance.regular
            ),)

        ],


      ),


    );
  }

  Widget _buildLastContent() {

    return Padding(

      padding: EdgeInsetsGeometry.directional(

          start:2.w,

          end: 2.w,

          top: 4.h,

          bottom: 4.h


      ),
      child: Row(

        children: [



          Expanded(
            child: Image.asset(AppImage.instance.trusted,

              height: 50.h, width: 63.h,

              ),
          ),


          SizedBox(
            width: 12.w,
          ),

          Expanded(
            child: Row(
            children: [


            Image.asset(AppImage.instance.addToCart, width: 32.sp
              , height: 24.sp,),

            SizedBox(
              width: 5.w,
            ),

            Image.asset(

                AppImage.instance.tl3tMostafa,
                height: 22.sp, width: 15.sp
            )

                    ],

                  ),
          )

      ]
      ),


    );
  }

}
