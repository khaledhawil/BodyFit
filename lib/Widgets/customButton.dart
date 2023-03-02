import 'package:flutter/material.dart';

import 'customInkWell.dart';
import 'customText.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    this.onPressed,
    this.btnHeight,
    this.btnWidth,
    this.btnColor,
    this.btnBorderWidth,
    this.btnBorderColor,
    this.btnRadius,
    this.title,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.widget,
    this.isSecondWidget,
    this.startPosition,
    this.endPosition,
    Key? key}) : super(key: key);
  Function? onPressed;
  double? btnHeight;
  double? btnWidth;
  Color? btnColor;
  double? btnBorderWidth;
  Color? btnBorderColor;
  double? btnRadius;
  // double? btnRadiusTopLeft;
  // double? btnRadiusTopRight;
  // double? btnRadiusBottomLeft;
  // double? btnRadiusBottomRight;
  String? title;
  Color? textColor;
  double? fontSize;
  FontWeight? fontWeight;
  Widget? widget;
  bool? isSecondWidget;
  double? startPosition;
  double? endPosition;

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: onPressed,
      child: Container(
        width:btnWidth??double.infinity ,
        height:btnHeight??42 ,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: btnColor,
            border: Border.all(
                width: btnBorderWidth==null?0:btnBorderWidth!,
                color: btnBorderColor==null?Colors.transparent:btnBorderColor!
            ),
            borderRadius: BorderRadius.circular(btnRadius==null?0:btnRadius!)
        ),
        child: Stack(
          clipBehavior:Clip.none,
          children: [
            CustomText(
              title: title,
              color: textColor,
              textAlign: TextAlign.center,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
            isSecondWidget==true?
            Positioned.directional(
                textDirection: Directionality.of(context),
                // start: startPosition??0,
                end: endPosition??0,
                bottom: 0,
                top: 0,
                child: widget!):
            SizedBox(),
          ],
        ),
      ),
    );
  }
}
