import 'package:flutter/material.dart';
class CustomText extends StatelessWidget {
  CustomText({
    this.title,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.textAlign,
    this.decoration,
    this.maxLines,
    this.fontFamily,
    this.height,
    this.overflow,
    Key? key}) : super(key: key);
  String? title;
  Color? color;
  double? fontSize;
  FontWeight? fontWeight;
  FontStyle? fontStyle;
  TextAlign? textAlign;
  TextDecoration? decoration;
  int ? maxLines;
  String ? fontFamily;
  double? height;
  TextOverflow? overflow;
  @override
  Widget build(BuildContext context) {
    return Text(title??"",
      textAlign: textAlign?? TextAlign.left,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontSize:fontSize,
        color: color,
        fontWeight: fontWeight,
        decoration: decoration,
        fontStyle: fontStyle,
        fontFamily: fontFamily??"medium",
        height: height,
      ),);
  }
}
