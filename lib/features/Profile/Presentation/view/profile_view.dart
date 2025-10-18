import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Profile/Presentation/widget/packages_text.dart';
import '../widget/packages_list.dart';

class PackagesView extends StatelessWidget {

  const PackagesView({super.key});


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: CustomScrollView(
        slivers: [
      
          SliverToBoxAdapter(
            child: SizedBox(
              height: 58.h,
            ),
          ),
          
          SliverToBoxAdapter(
      
              child: PackagesText()
      
          ),
      
      
          SliverToBoxAdapter(
            child: SizedBox(
              height: 24.h,
            ),
          ),
      
          SliverToBoxAdapter(
      
              child: PackagesList()
      
          ),
      
      
        ],
      ),
    );
  }
}
