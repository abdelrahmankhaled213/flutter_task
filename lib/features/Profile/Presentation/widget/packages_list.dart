import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/features/Profile/Presentation/view_model/plan_cubit.dart';
import 'package:flutter_task/features/Profile/Presentation/view_model/plan_state.dart';
import 'package:flutter_task/features/Profile/Presentation/widget/packageItem.dart';
import 'package:flutter_task/features/Profile/Presentation/widget/support_content.dart';

import '../../../../core/utils/app_style.dart';

class PackagesList extends StatefulWidget {

  const PackagesList({super.key});

  @override
  State<PackagesList> createState() => _PackagesListState();

}

class _PackagesListState extends State<PackagesList> {

 int _currentIndex= 0;

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<PlanCubit,PlanState>

      (

      buildWhen: (previous, current) {


        return current.getPlansFailure || current.getPlansLoading || current.getPlansSuccess;

        },

      builder: (context, state) {


        if(state.getPlansLoading){

          return const Center(
            child: CircularProgressIndicator(),
          );

        }

        if(state.getPlansSuccess){

          final plans=state.plans;

          return Column(
            children: [

            ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 16.h,
                );
              },
            shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: plans!.length,
              itemBuilder: (context, index) {

                return PackageItem(planModel: plans[index],);

                },
              ),

              SizedBox(
                height: 12.h,
              ),


              Container(

  width: 328.w,
  padding: EdgeInsets.only(
    right: 5.w,
    left: 5.w
  ),
  decoration: BoxDecoration(

    border: Border.all(
       color: Colors.white70.withOpacity(0.5)
    ),
    borderRadius: BorderRadius.circular(8.r),
    color: Color.fromRGBO(0, 0, 0,0.05)

  ),
                child: SupportContent(),
),

              SizedBox(
                height: 20.h,
              ),
              
              Padding(
                padding: EdgeInsetsGeometry.all(12.sp),
                child: ElevatedButton.icon(
                  
                    style: ElevatedButton.styleFrom(
                      
                      fixedSize: Size(328.w, 44.h)
                    ,backgroundColor: Color(0xff0079FE),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.r)
                      )
                
                    ),
                
                    icon: Icon(Icons.chevron_left
                  ,color: Colors.white,size: 24.sp,),onPressed: () {
                  
                }, label:Text("التالي",style: AppStyle.instance.boldTajwalBlue16.copyWith(
                  color: Colors.white
                ),
                )
                ),
              )

          ] );

        }
if(state.getPlansFailure){

  return  Center(
    child: Text(state.errorMessage!),
  );
}

return Container();

    },);
  }
}
