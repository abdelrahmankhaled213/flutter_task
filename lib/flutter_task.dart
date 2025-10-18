import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/home_layout.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class FlutterTask extends StatelessWidget {

  const FlutterTask({super.key});

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(


      designSize: const Size(360, 1940),

      builder: (context, child) => MaterialApp(

        locale: Locale('ar'),
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
        ],

        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],

        title: 'Flutter Task',
        debugShowCheckedModeBanner: false,
        home: HomeLayout() ,
      ),
    );
  }
}

