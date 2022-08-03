import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HelperClass {
  // Height 802/ (Provided height like height 20 so, 802/220=3.64 then the screenHeight/3.64= 220)
  // width 392
  //Getx  **************************************************
  static double screenHeight = Get.context!.height;

  static double screenWidth = Get.context!.width;
  //*********************
//   static double height5 = screenHeight / 160.4;
//   static double height10 = screenHeight / 80.2;
//   static double height15 = screenHeight / 53.47;
//   static double height25 = screenHeight / 32.08;
//   static double height30 = screenHeight / 26.73;
//   static double height35 = screenHeight / 22.91;
//   static double height16 = screenHeight / 40.10;
//   static double height20 = screenHeight / 6.68;
//   static double height45 = screenHeight / 17.82;
//   static double height120 = screenHeight / 6.68;
//   static double height150 = screenHeight / 5.34;
//   static double height130 = screenHeight / 6.19;
//   static double height140 = screenHeight / 5.72;
//   static double height110 = screenHeight / 7.29;
//   static double height220 = screenHeight / 3.64;
//   static double height250 = screenHeight / 3.20;
//   static double height300 = screenHeight / 2.67;
//   static double height320 = screenHeight / 2.50;
//   static double height350 = screenHeight / 2.29;
//
// // Icon size
//
//   // Get Width
//   static double width10 = screenWidth / 39.2;
//   static double width15 = screenWidth / 26.1;
//   static double width20 = screenWidth / 19.6;
//   static double width25 = screenWidth / 15.6;
//   static double width30 = screenWidth / 13.6;
//   static double width35 = screenWidth / 11.2;
//   static double width40 = screenWidth / 9.8;
//   static double width5 = screenWidth / 78.4;
//   static double width45 = screenWidth / 8.71;
//   static double width120 = screenWidth / 3.26;
//
// // Get font
//
// // Get Radius
//   static double radius5 = screenHeight / 160.4;
//   static double radius8 = screenHeight / 100.2;
//   static double radius10 = screenHeight / 80.2;
//   static double radius15 = screenHeight / 53.4;
//   static double radius20 = screenHeight / 40.1;
//   static double radius25 = screenHeight / 32.8;
//   static double radius30 = screenHeight / 26.7;
//
  //ScreenUtil ***********************************************

  // height
  static var height8 = 8.h;
  static var height3 = 3.h;
  static var height2 = 2.h;
  static var height12 = 12.h;
  static var height20 = 20.h;
  static var height23 = 23.h;
  static var height18 = 18.h;
  static var height16 = 16.h;
  static var height10 = 10.h;
  static var height30 = 30.h;
  static var height35 = 35.h;
  static var height40 = 40.h;
  static var height44 = 44.h;
  static var height56 = 56.h;
  static var height54 = 54.h;
  static var height50 = 50.h;
  static var height140=140.h;
  static var height280 = 280.h;
  static var height300 = 300.h;
  static var height320 = 320.h;
  static var height330 = 330.h;
  static var height220 = 220.h;
  static var height230 = 230.h;
  static var height335 = 335.h;
  static var height350=350.h;
  static var height268 = 268.h;
  static var height250 = 250.h;
  static var height400 = 400.h;
  static var height70 = 70.h;
  static var height65 = 65.h;
  static var height150 = 150.h;
  static var height155 = 155.h;
  static var height158 = 158.h;
  static var height175 = 175.h;
  static var height178 = 178.h;
  static var height160 = 160.h;
  static var height90 = 90.h;
  static var height95 = 95.h;
  static var height110 = 110.h;
  static var height60 = 60.h;
  static var height80 = 80.h;
  static var height15 = 15.h;
  static var height32 = 32.h;
  static var height24 = 24.h;
  static var width44 = 44.h;
  static var height45 = 45.h;
  static var height28 = 28.h;
  static var height27 = 27.h;
  static var height5 = 5.h;
  static var height7= 7.h;
  static var height6 = 6.h;
  static var height4 = 4.h;
  static var height84 = 84.h;
  static var height88 = 88.h;
  static var height92 = 92.h;
  static var height100 = 100.h;

  static var height500 = 500.h;
  static var height450 = 450.h;
  static var height120 = 120.h;

// Width
  static var width1 = 1.w;
  static var width5 = 5.w;
  static var width6 = 6.w;
  static var width3 = 3.w;
  static var width8 = 8.w;
  static var width7 = 7.w;
  static var width20 = 20.w;
  static var width50 = 50.w;
  static var width16 = 16.w;
  static var width25 = 25.w;
  static var width30= 30.w;
  static var width35 = 35.w;
  static var width10 = 10.w;
  static var width13 = 13.w;
  static var width40 = 40.w;
  static var width45 = 45.w;
  static var width15 = 15.w;
  static var width23= 23.w;
  static var width24 = 24.w;
  static var width120= 120.w;

  //App bar
  static var appbarLogoHeight = 37.h;
  static var appbarLogoWidth = 75.w;
  static var widthSixty = 60.w;

//Radius
  static var radius5 = 5.r;
  static var radius8 = 8.r;
  static var radius12 = 12.r;
  static var radius15 = 15.r;
  static var radius6 = 6.r;
  static var radius7 = 7.r;
  static var radius3= 3.r;
  static var radius60 = 60.r;
  static var radius30 = 30.r;
  static var radius22 = 22.r;
  static var radius28 = 28.r;
  static var radius47 = 47.r;
  static var radius20 = 20.r;

//Font size
  static var textSize12 = 12.sp;
  static var largeTextSize = 14.sp;
  static var textSize16 = 16.sp;
  static var textSize18 = 18.sp;
  static var textSize20 = 20.sp;
  static var textSize24 = 24.sp;
  static var textSize15 = 15.sp;
  static var textSize14 = 14.sp;
  static var textSize13 = 13.sp;
  static var textSize26=26.sp;

  static var disbursementCardHeight = 230.h;
  static var realizationCardHeight = 260.h;
  static var overdueCardHeight = 190.h;
}
