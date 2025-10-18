import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/utils/app_style.dart';
import 'package:flutter_task/features/AddTheAd/presentation/view/filter_screen.dart';


class OffersText extends StatelessWidget {

  const OffersText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Text(
          'استكشف العروض',
          style: AppStyle.instance.mediumTajwalBlack16.copyWith(
            fontSize: 16.sp
          ),
        ),

        Row
          (
          children: [

            GestureDetector(
              onTap: () {

                Navigator.push(context,

                    PageRouteBuilder(pageBuilder:
                        (context, animation, secondaryAnimation) {

                      return SlideTransition(position:
                      Tween<Offset>(

                        begin:
                        Offset(0, 1),
                        end: Offset.zero,
                      ).animate(animation),

                        child: FilterView(),

                      );

                    },)

                );

              },
              child: Text(
                  'الكل',
                  style: AppStyle.instance
                      .mediumTajwalCustomGrey12.copyWith(
              color: Colors.grey,
                    fontSize: 16.sp,

                  )
              ),
            ),

SizedBox(height: 4.w,),

            GestureDetector(
              onTap: () {

                Navigator.push(context,

                    PageRouteBuilder(pageBuilder:
                        (context, animation, secondaryAnimation) {

                      return SlideTransition(position:
                          Tween<Offset>(

                          begin:
                          Offset(0, 1),
                          end: Offset.zero,
                          ).animate(animation),

                          child: FilterView(),

                          );

                },)

                );
              },
              child: Icon(Icons.chevron_right,size: 24.sp
                ,color: Colors.grey,),
            )
          ],
        )
      ],
    );
  }
}
