import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/utils/app_style.dart';
import 'package:flutter_task/features/AddTheAd/presentation/view/add_the_add.dart';
import 'package:flutter_task/features/Chat/Presentation/view/chat_view.dart';
import 'package:flutter_task/features/MyAdds/Presentation/view/my_adds_view.dart';
import 'package:flutter_task/features/Profile/Presentation/view/profile_view.dart';
import 'core/di/service_locator.dart';
import 'features/AddTheAd/presentation/viewmodel/ads_cubit.dart';
import 'features/Home/Presentation/view/home_view.dart';
import 'features/Profile/Presentation/view_model/plan_cubit.dart';

class HomeLayout extends StatefulWidget {

  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {

  int currentIndex = 0;

  final itemsNavigationBar = <ItemNavigationBar>[


    ItemNavigationBar(

        HomeView(), icon: Icon(Icons.home, size: 24.sp,)
        , label: 'الرئيسية'),


    ItemNavigationBar(

        ChatView(), icon: Icon(Icons.chat, size: 24.sp,)
        , label: 'محادثة'),


    ItemNavigationBar(

        BlocProvider(
          create: (context) =>
          getIt<AdsCubit>()
            ..getCategories()
            .. getProducts()

          ,
          child: AddTheAdView(),
        ), icon: Icon(Icons.add_box_outlined, size: 24.sp,)
        , label: 'اضف أعلان'),


    ItemNavigationBar(

        MyAddsView(), icon: Icon(Icons.dashboard_outlined
      , size: 24.sp,)
        , label: 'اعلاناتي'),


    ItemNavigationBar(

        BlocProvider(

          create: (context) => getIt<PlanCubit>()..getPlans(),

          child: PackagesView(),

        ),
        icon: Icon(Icons.account_circle, size: 24.sp,)
        , label: 'حسابي'),


  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(

        onTap: (value) {
          currentIndex = value;
          setState(() {

          });
        },
        selectedLabelStyle: AppStyle.instance.mediumTajwalCustomGrey12,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.indigo,
        unselectedLabelStyle: AppStyle.instance.mediumTajwalCustomGrey12,
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        items: itemsNavigationBar
            .map((ItemNavigationBar item) =>
            BottomNavigationBarItem(icon: item.icon
                , label: item.label)).toList()
        ,),

      body: itemsNavigationBar[currentIndex].screen,

    );
  }
}


class ItemNavigationBar {

  final Widget screen;
  final Widget icon;
  final String label;

  const ItemNavigationBar(this.screen,
      {required this.icon, required this.label});

}