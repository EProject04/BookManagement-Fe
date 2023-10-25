import 'package:flutter/material.dart';

class Styles {

  ///---------------------------style_1A2F51-------------------------------
  static const TextStyle style_1A2F51_14 =
  TextStyle(color: ColorStyle.color_1A2F51, fontSize: 14);
  static const TextStyle style_1A2F51_16 =
  TextStyle(color: ColorStyle.color_1A2F51, fontSize: 16);
  static const TextStyle style_1A2F51_18 =
  TextStyle(color: ColorStyle.color_1A2F51, fontSize: 18);

  ///---------------------------style_B8C0D4-------------------------------
  static const TextStyle style_B8C0D4_11 =
  TextStyle(color: ColorStyle.color_B8C0D4, fontSize: 11);
  static const TextStyle style_B8C0D4_13 =
  TextStyle(color: ColorStyle.color_B8C0D4, fontSize: 13);
  static const TextStyle style_B8C0D4_14 =
  TextStyle(color: ColorStyle.color_B8C0D4, fontSize: 14);

  ///---------------------------style_9F9EA6-------------------------------
  static const TextStyle style_9F9EA6_11 =
  TextStyle(color: Color(0xff9F9EA6), fontSize: 11 , height: 1.1);
  static const TextStyle style_9F9EA6_14 =
  TextStyle(color: Color(0xff9F9EA6), fontSize: 14 , height: 1.1);
  static const TextStyle style_616169_11 =
  TextStyle(color: Color(0xff616169), fontSize: 11, height: 1.1);
  static const TextStyle style_6A6969_14 =
  TextStyle(color: ColorStyle.color_6A6969, fontSize: 14);
  static const TextStyle style_6A6969_16 =
  TextStyle(color: ColorStyle.color_6A6969, fontSize: 16);

  ///---------------------------style_white-------------------------------
  static const TextStyle style_white_10 =
  TextStyle(color: Colors.white, fontSize: 10 ,height: 1.1);
  static const TextStyle style_white_12 =
  TextStyle(color: Colors.white, fontSize: 12);
  static const TextStyle style_white_14 =
  TextStyle(color: Colors.white, fontSize: 14);
  static const TextStyle style_white_16 =
  TextStyle(color: Colors.white, fontSize: 16);
  static const TextStyle style_white_18 =
  TextStyle(color: Colors.white, fontSize: 18);
  static const TextStyle style_white_16_bold =
  TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700);
  static const TextStyle style_white24_18 =
  TextStyle(color: Colors.white24, fontSize: 18);
  static const TextStyle style_white_36 =
  TextStyle(color: Colors.white, fontSize: 36);
  ///---------------------------style_black_18-------------------------------
  static const TextStyle style_black_18_bold =
  TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700);
  static const TextStyle style_black_18_bold500 =
  TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500);
  static const TextStyle style_black_16_bold =
  TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700);
  static const TextStyle style_black_16_bold500 =
  TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500);
  static const TextStyle style_black_14 =
  TextStyle(color: Colors.black, fontSize: 14);
  static const TextStyle style_black_16 =
  TextStyle(color: Colors.black, fontSize: 16);
  static const TextStyle style_black_36 =
  TextStyle(color: Colors.black, fontSize: 36);
  static const TextStyle style_black_30 =
  TextStyle(color: Colors.black, fontSize: 30);
  static const TextStyle style_black_12 =
  TextStyle(color: Colors.black, fontSize: 12);
  static const TextStyle style_black_13 =
  TextStyle(color: Colors.black, fontSize: 13);
  static const TextStyle style_black_15 =
  TextStyle(color: Colors.black, fontSize: 15);

  static const TextStyle style_24CF5F_14 =
  TextStyle(color: ColorStyle.color_24CF5F, fontSize: 14);


  ///---------------------------style_FE8C28-------------------------------
  static const TextStyle style_FE8C28_24_bold = TextStyle(
      color: ColorStyle.color_FE8C28,
      fontSize: 24,
      fontWeight: FontWeight.w700);

  static const TextStyle style_FFAE2E_14 =
  TextStyle(color: ColorStyle.color_FFAE2E, fontSize: 14);

  static const TextStyle style_FFAE2E_16 =
  TextStyle(color: ColorStyle.color_FFAE2E, fontSize: 16);

  static const TextStyle style_FE8C28_11 =
  TextStyle(color: ColorStyle.color_FE8C28, fontSize: 11 , height: 1.1);
}

class Box {
  static Widget hBox3 = const SizedBox(width: 3);
  static Widget hBox5 = const SizedBox(width: 5);
  static Widget hBox6 = const SizedBox(width: 6);
  static Widget hBox10 = const SizedBox(width: 10);
  static Widget hBox12 = const SizedBox(width: 12);
  static Widget hBox15 = const SizedBox(width: 15);
  static Widget hBox20 = const SizedBox(width: 20);
  static Widget hBox30 = const SizedBox(width: 30);
  static Widget vBox3 = const SizedBox(height: 3);
  static Widget vBox5 = const SizedBox(height: 5);
  static Widget vBox10 = const SizedBox(height: 10);
  static Widget vBox12 = const SizedBox(height: 12);
  static Widget vBox15 = const SizedBox(height: 15);
  static Widget vBox20 = const SizedBox(height: 20);
  static Widget vBox30 = const SizedBox(height: 30);
  static Widget vBox50 = const SizedBox(height: 50);

  static Widget getHGap(double w) {
    return SizedBox(width: w);
  }

  static Widget getVGap(double h) {
    return SizedBox(height: h);
  }
}

class DividerStyle {

  static Widget divider1HalfPadding20 = const Divider(
    height: 0.5,
    thickness: 0.5,
    indent: 20,
    endIndent: 20,
    color: ColorStyle.colorShadow,
  );


  static Widget divider1Half = const Divider(
    height: 0.5,
    thickness: 0.5,
    color: ColorStyle.colorShadow,
  );


  static Widget divider20Half = const Divider(
    height: 20,
    thickness: 20,
    color: ColorStyle.color_F8F9FC,
  );
}
class ColorStyle{
  static const color_B8C0D4 = Color(0xFFB8C0D4);
  static const color_1A2F51 = Color(0xFF1A2F51);
  static const color_24CF5F = Color(0xFF24CF5F);
  static const color_FBE240 = Color(0xFFFBE240);
  static const color_FFAE2E = Color(0xFFFFAE2E);
  static const color_FE8C28 = Color(0xFFFE8C28);
  static const color_24CF5F_20 = Color(0xFF4C8D66);
  static const color_6A6969 = Color(0xFF6A6969);
  static const color_E2E3E8_33 = Color(0x33E2E3E8);
  static const color_E2E3E8_4D = Color(0x4DE2E3E8);
  static const color_E2E3E8_66 = Color(0x66E2E3E8);
  static const colorShadow = Color(0x66E0E6FD);
  static const color_474747 = Color(0xff474747);
  static const color_F9F9F9 = Color(0xFFF9F9F9);
  static const color_F3F3F3 = Color(0xFFF3F3F3);
  static const color_F8F9FC = Color(0xFFFCFCFC);
  static const color_EFF1F8 = Color(0xFFE7EBFA);
  static const color_FAFAFB = Color(0xFFFAFAFB);



}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex));

  return Color(int.parse(hex.substring(1), radix: 16) +
      (hex.length == 7 ? 0xFF000000 : 0x00000000));
}