import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/di/service_locator.dart';
import 'package:flutter_task/core/helpers/observer_helper.dart';
import 'package:flutter_task/flutter_task.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserverHelper();

  await Future.wait(
      [

  initServiceLocator(),

  SystemChrome.setPreferredOrientations([
  DeviceOrientation.portraitUp,
  DeviceOrientation.portraitDown,
  ]),
        ScreenUtil.ensureScreenSize(),

    ]
  );


  runApp(const FlutterTask());

}
