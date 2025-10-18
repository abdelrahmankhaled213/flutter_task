import 'package:flutter/material.dart';

 class FontWeightHelper{

  FontWeightHelper._internal();

  static FontWeightHelper instance = FontWeightHelper._internal();

  FontWeight thin = FontWeight.w100;
  FontWeight extraLight = FontWeight.w200;
  FontWeight light = FontWeight.w300;
  FontWeight regular = FontWeight.w400;
  FontWeight medium = FontWeight.w500;
  FontWeight semiBold = FontWeight.w600;
  FontWeight extraBold = FontWeight.w700;
  FontWeight black = FontWeight.w900;


}