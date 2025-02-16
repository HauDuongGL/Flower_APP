import 'package:flutter/material.dart';

const colorPrimary = Color(0xff4FACFE);
const colorMintyFresh = Color(0xff2DDA93);
const colorForm = Color(0xffE5F0F2);
const colorTextPrimary = Color(0xff000000);
const colorTextSecondary = Color(0xff27272A);
const colorSecondary = Color(0xff00F2F2);
const colorStroke = Color(0xff999999);
const colorComplete = Color(0xff0ACF97);
const colorPending = Color(0xffFAA500);
const colorFail = Color(0xffDE3138);
const colorLeftLiner = Color(0xff2C9F78);
const colorRightLinear = Color(0xff00B67F);
const colorSystemLeft = Color(0xff2C9F78);
const colorSystemRight = Color(0xff00B67F);
const colorShadow6 = Color(0xff162731);
const colorShadow9 = Color(0xff162731);
const colorBorder = Color(0xffEDEDED);
const colorChip = Color(0xffF0F0F0);
const colorExchange = Color(0xff596E73);
const colorAlert = Color(0xFFE31414);
const colorFDF6F6 = Color(0xFFFDF6F6);
const colorButton = Color(0xff36D7FF);
const colorDodgerBlue = Color(0xff36D7FF);
const colorWater26 = Color(0x26D5F0FF);
const colorSeaBlue = Color(0xff086E86);
const colorAliceBlue = Color(0xffF0FAFD);
const colorGrayPhilip = Color(0xff8E8E8E);
const colorGraySpain = Color(0xff9C9C9C);
const colorBlackRaisin55 = Color(0x8C252525);
const colorBlackChina20 = Color(0x33111111);
const colorBlackEerie = Color(0xff1E1E1E);
const colorBlueFrance = Color(0xff3998E8);
const colorSilverSand = Color(0xffC4C4C4);
const colorTabBar = Color(0xff369CB3);
const colorRate = Color(0xffF3B924);
const colorBubbles = Color(0xffE4F4FF);
const color00F2FE = Color(0xff00F2FE);
const colorD5F0FF = Color(0xffD5F0FF);
const colorWhite = Color(0xffffffff);
const colorBlack = Color(0xff000000);
const colorGrey = Color(0xff929FB3);
const colorA1A8B9 = Color(0xffA1A8B9);
const color495566 = Color(0xff495566);
const color6A6F7D = Color(0xff6A6F7D);

// Using https://www.color-name.com/ to find color name and put main color to first and attribute second

///=========== Using to make change app theme ================================
abstract class AppColor {
  Color get mintyFresh;
  Color get primaryColor;
  Color get formColor;
  Color get textPrimary;
  Color get textSecondary;
  Color get textStroke;
  Color get statusComplete;
  Color get statusPending;
  Color get statusFail;
  Color get shadow6;
  Color get shadow9;
  Color get secondaryColor;
  Color get dividerColor;
  Color get chipColor;
  Color get barrierColor;
  Color get exchangeColor;
  Color get alertColor;
  Color get primaryTextButtonColor;
  Color get dodgerBlue;
  Color get water26;
  Color get seaBlue;
  Color get aliceBlue;
  Color get grayPhilip;
  Color get graySpain;
  Color get blackRaisin55;
  Color get blackChina20;
  Color get blackEerie;
  Color get blueFrance63;
  Color get silverSand;
  Color get bubbles;
  Color get backGroundScopeOperation;
  Color get sliderColor;
  List<Color> get linearOnboarding;
  List<Color> get linearToolbar;
  List<Color> get linearSystemWallet;
  List<Color> get linearButton;
  List<Color> get linerBackground;
}

class LightApp extends AppColor {
  @override
  Color get primaryColor {
    return colorPrimary;
  }

  @override
  Color get mintyFresh {
    return colorMintyFresh;
  }

  @override
  Color get formColor {
    return colorForm;
  }

  @override
  Color get statusComplete {
    return colorComplete;
  }

  @override
  Color get statusFail {
    return colorFail;
  }

  @override
  Color get statusPending {
    return colorPending;
  }

  @override
  Color get textPrimary {
    return colorTextPrimary;
  }

  @override
  Color get textSecondary {
    return colorTextSecondary;
  }

  @override
  List<Color> get linearOnboarding {
    return [colorForm, Colors.white];
  }

  @override
  List<Color> get linearToolbar => [
        colorLeftLiner.withOpacity(0.2),
        colorRightLinear.withOpacity(0.2),
      ];

  @override
  List<Color> get linearSystemWallet => [
        colorSystemLeft,
        colorSystemRight,
      ];

  @override
  List<Color> get linearButton => [
        colorPrimary,
        colorSecondary,
      ];

  @override
  Color get shadow6 => colorShadow6;

  @override
  Color get secondaryColor => colorSecondary;

  @override
  Color get dividerColor => colorBorder;

  @override
  Color get chipColor => colorChip;

  @override
  Color get shadow9 => colorShadow9;

  @override
  Color get textStroke => colorStroke;

  @override
  Color get barrierColor => textSecondary.withOpacity(0.3);

  @override
  Color get exchangeColor => colorExchange;

  @override
  Color get alertColor => colorAlert;

  @override
  Color get primaryTextButtonColor => colorFDF6F6;

  @override
  Color get dodgerBlue => colorDodgerBlue;

  @override
  Color get water26 => colorWater26;

  @override
  Color get seaBlue => colorSeaBlue;

  @override
  Color get aliceBlue => colorAliceBlue;

  @override
  Color get grayPhilip => colorGrayPhilip;

  @override
  Color get graySpain => colorGraySpain;

  @override
  Color get blackRaisin55 => colorBlackRaisin55;

  @override
  Color get blackChina20 => colorBlackChina20;

  @override
  Color get blackEerie => colorBlackEerie;

  @override
  Color get blueFrance63 => colorBlueFrance.withOpacity(0.63);

  @override
  Color get silverSand => colorSilverSand;

  @override
  Color get bubbles => colorBubbles;

  @override
  Color get backGroundScopeOperation => colorButton.withOpacity(0.64);

  @override
  Color get sliderColor => color00F2FE;

  @override
  List<Color> get linerBackground => [colorD5F0FF, Colors.white];
}

class DarkApp extends AppColor {
  @override
  Color get primaryColor {
    return colorPrimary;
  }

  @override
  Color get mintyFresh {
    return colorMintyFresh;
  }

  @override
  Color get formColor {
    return colorForm;
  }

  @override
  Color get statusComplete {
    return colorComplete;
  }

  @override
  Color get statusFail {
    return colorFail;
  }

  @override
  Color get statusPending {
    return colorPending;
  }

  @override
  Color get textPrimary {
    return colorTextPrimary;
  }

  @override
  Color get textSecondary {
    return colorTextSecondary;
  }

  @override
  List<Color> get linearOnboarding {
    return [colorForm, Colors.white];
  }

  @override
  List<Color> get linearToolbar => [
        colorLeftLiner.withOpacity(0.2),
        colorRightLinear.withOpacity(0.2),
      ];

  @override
  List<Color> get linearSystemWallet => [
        colorSystemLeft,
        colorSystemRight,
      ];

  @override
  List<Color> get linearButton => [
        colorPrimary,
        colorSecondary,
      ];

  @override
  Color get shadow6 => colorShadow6;

  @override
  Color get secondaryColor => colorSecondary;

  @override
  Color get dividerColor => colorBorder;

  @override
  Color get chipColor => colorChip;

  @override
  Color get shadow9 => colorShadow9;

  @override
  Color get textStroke => colorStroke;

  @override
  Color get barrierColor => textSecondary.withOpacity(0.3);

  @override
  Color get exchangeColor => colorExchange;

  @override
  Color get alertColor => colorAlert;

  @override
  Color get primaryTextButtonColor => colorFDF6F6;

  @override
  Color get dodgerBlue => colorDodgerBlue;

  @override
  Color get water26 => colorWater26;

  @override
  Color get seaBlue => colorSeaBlue;

  @override
  Color get aliceBlue => colorAliceBlue;

  @override
  Color get grayPhilip => colorGrayPhilip;

  @override
  Color get graySpain => colorGraySpain;

  @override
  Color get blackRaisin55 => colorBlackRaisin55;

  @override
  Color get blackChina20 => colorBlackChina20;

  @override
  Color get blackEerie => colorBlackEerie;

  @override
  Color get blueFrance63 => colorBlueFrance.withOpacity(0.63);

  @override
  Color get silverSand => colorSilverSand;

  @override
  Color get bubbles => colorBubbles;

  @override
  Color get backGroundScopeOperation => colorButton.withOpacity(0.64);

  @override
  Color get sliderColor => color00F2FE;

  @override
  List<Color> get linerBackground => [colorD5F0FF, Colors.white];
}

///============ End setup app theme ======================================
