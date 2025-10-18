import 'package:flutter/material.dart';

class AppColor{

  AppColor._internal();

  static AppColor instance = AppColor._internal();
  
  Color customGrey = const Color.fromRGBO(0, 0, 0, 0.5);
  Color black = const Color(0xff090F1F);
  Color orange = const Color(0xffF95B1C);
  Color red = const Color(0xffFF4144);
  Color green=const Color(0xff3A813F);
  Color blue = const Color(0xff3B4CF2);
  Color borderColor= const Color.fromRGBO(0,0, 0, 0.1);
}