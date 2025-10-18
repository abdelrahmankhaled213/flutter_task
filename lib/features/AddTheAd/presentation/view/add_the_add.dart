import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/features/AddTheAd/presentation/widget/offers_text.dart';
import 'package:flutter_task/features/AddTheAd/presentation/widget/shipping_container.dart';

import '../widget/category_list.dart';
import '../widget/offers_list.dart';
import '../widget/product_list.dart';

class AddTheAdView extends StatelessWidget {

  const AddTheAdView({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SafeArea(
          child: CustomScrollView(

            slivers: [

              SliverToBoxAdapter(

                child: SizedBox(
                  height: 40.h,
                ),
              ),

          SliverToBoxAdapter(
          child: OffersText()
          ),

              SliverToBoxAdapter(

                child: SizedBox(
                  height: 20.h,
                ),
              ),

              SliverToBoxAdapter(

                child: OffersList()

              ),

              SliverToBoxAdapter(

                child: SizedBox(
                  height: 60.h,
                ),
              ),

              SliverToBoxAdapter(

                child: CategoryList(

                ),

              ),

              SliverToBoxAdapter(

                child: SizedBox(
                  height: 40.h,
                ),
              ),

              SliverToBoxAdapter(

                child: ShippingText()
              ),

              SliverToBoxAdapter(

                child: SizedBox(
                  height: 25.h,
                ),
              ),



              SliverToBoxAdapter(

  child: ProductList()
)

            ],
          ),
        ),
      ),
    );
  }
}
