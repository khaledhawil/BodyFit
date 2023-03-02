import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Utilies/constants.dart';
import 'customText.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {this.enabled,
        this.obscureText,
        this.readOnly,
        this.focusNode,
        this.onChanged,
        this.onSubmited,
        this.validation,
        this.controller,
        this.keyboardType,
        this.hintText,
        this.labelText,
        this.isFilled,
        this.isUnderlineInputBorder,
        this.isOutlineInputBorder,
        this.isOutlineInputBorderColor,
        this.maxLength,
        this.fontSize,
        this.inputFormatter,
        this.onTap,
        this.fieldborderColor = blackColor,
        this.textFieldFillColor = whiteColor,
        this.fieldborderRadius = 7,
        this.maxLines,
        this.contentPaddingLeft,
        this.contentPaddingRight,
        this.contentPaddingTop,
        this.contentPaddingBottom,
        this.containerPadding,
        this.outlineTopLeftRadius = 7,
        this.outlineTopRightRadius = 7,
        this.outlineBottomLeftRadius = 7,
        this.outlineBottomRightRadius = 7,
        this.textColor,
        this.hintTextColor = blackColor,
        this.hintFontSize = 16,
        this.textFontSize,
        this.textAlign,
        this.prefixIcon,
        this.suffixIcon,
        this.isSearch = false,
        this.autofillHints,
        this.textInputAction,
        this.onEditingComplete,
        Key? key})
      : super(key: key);
  bool? enabled;
  bool? obscureText;
  bool? readOnly;
  String? Function(String?)? validation;
  String? Function(String?)? onChanged;
  String? Function(String?)? onSubmited;
  Function()? onEditingComplete;
  void Function()? onTap;
  FocusNode? focusNode;
  TextEditingController? controller;
  TextInputType? keyboardType;
  String? hintText;
  String? labelText;
  bool? isFilled;
  bool? isUnderlineInputBorder;
  bool? isOutlineInputBorder;
  bool? isSearch;
  Color? isOutlineInputBorderColor;
  int? maxLength;
  int? maxLines;
  double? fontSize;
  int? inputFormatter;
  Color? textFieldFillColor;
  Color? fieldborderColor;
  Color? textColor;
  Color? hintTextColor;
  double? textFontSize;
  double? hintFontSize;
  double? fieldborderRadius;
  double? contentPaddingTop;
  double? contentPaddingBottom;
  double? contentPaddingLeft;
  double? contentPaddingRight;
  double? containerPadding;
  double? outlineTopLeftRadius;
  double? outlineTopRightRadius;
  double? outlineBottomLeftRadius;
  double? outlineBottomRightRadius;
  TextAlign? textAlign;
  Widget? prefixIcon;
  Widget? suffixIcon;
  var autofillHints;
  TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      obscureText: obscureText ?? false,
      readOnly: readOnly??false,
      maxLength: maxLength,
      maxLines: maxLines ?? 1,
      maxLengthEnforcement: MaxLengthEnforcement.none,
      focusNode: focusNode,
      // onTap: () {
      //   onTap!();
      // },
      validator: validation,
      onChanged: onChanged,
      onFieldSubmitted: onSubmited,
      controller: controller,
      keyboardType: keyboardType,
      textAlign: textAlign ?? TextAlign.left,
      autofillHints: autofillHints,
      textInputAction: textInputAction,
      onEditingComplete: onEditingComplete,
      //  textAlignVertical:textAlign != null? TextAlignVertical.bottom:TextAlignVertical.center,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(
            left: contentPaddingLeft ?? 12, right: contentPaddingRight ?? 12, top: contentPaddingTop ?? 13, bottom: contentPaddingBottom ?? 13),
        isDense: true,
        hintText: hintText ?? "",
        hintStyle: TextStyle(fontSize: hintFontSize ?? 14, color: hintTextColor!.withOpacity(.5)),
        label: hintText == null
            ? CustomText(
          title: labelText ?? "",
          color: kPrimaryColor,
        )
            : null,
        helperStyle: const TextStyle(color: Colors.transparent),
        errorStyle: const TextStyle(color: Colors.red),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: textFieldFillColor,
        border: isUnderlineInputBorder == false && isOutlineInputBorder == false
            ? InputBorder.none
            : isOutlineInputBorder == false
            ? UnderlineInputBorder(borderSide: BorderSide(width: 1, color: greyColor))
            : OutlineInputBorder(
            borderSide: BorderSide(width: isOutlineInputBorderColor != null ? 0 : 1, color: isOutlineInputBorderColor ?? Colors.grey),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(outlineTopLeftRadius ?? 4),
              topRight: Radius.circular(outlineTopRightRadius ?? 4),
              bottomLeft: Radius.circular(outlineBottomLeftRadius ?? 4),
              bottomRight: Radius.circular(outlineBottomRightRadius ?? 4),
            )),
        enabledBorder: isUnderlineInputBorder == false && isOutlineInputBorder == false
            ? InputBorder.none
            : isOutlineInputBorder == false
            ? UnderlineInputBorder(borderSide: BorderSide(width: 1, color: greyColor))
            : OutlineInputBorder(
            borderSide: BorderSide(width: isOutlineInputBorderColor != null ? 0 : 1, color: isOutlineInputBorderColor ?? Colors.grey),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(outlineTopLeftRadius ?? 4),
              topRight: Radius.circular(outlineTopRightRadius ?? 4),
              bottomLeft: Radius.circular(outlineBottomLeftRadius ?? 4),
              bottomRight: Radius.circular(outlineBottomRightRadius ?? 4),
            )),
        focusedBorder: isUnderlineInputBorder == false && isOutlineInputBorder == false
            ? InputBorder.none
            : isOutlineInputBorder == false
            ? UnderlineInputBorder(borderSide: BorderSide(width: 1, color: greyColor))
            : OutlineInputBorder(
            borderSide: BorderSide(width: isOutlineInputBorderColor != null ? 0 : 1, color: isOutlineInputBorderColor ?? Colors.grey),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(outlineTopLeftRadius ?? 4),
              topRight: Radius.circular(outlineTopRightRadius ?? 4),
              bottomLeft: Radius.circular(outlineBottomLeftRadius ?? 4),
              bottomRight: Radius.circular(outlineBottomRightRadius ?? 4),
            )),
        errorBorder: isUnderlineInputBorder == false && isOutlineInputBorder == false
            ? InputBorder.none
            : isOutlineInputBorder == false
            ? UnderlineInputBorder(borderSide: BorderSide(width: 1, color: greyColor))
            : OutlineInputBorder(
            borderSide: BorderSide(width: isOutlineInputBorderColor != null ? 0 : 1, color: redColor),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(outlineTopLeftRadius ?? 4),
              topRight: Radius.circular(outlineTopRightRadius ?? 4),
              bottomLeft: Radius.circular(outlineBottomLeftRadius ?? 4),
              bottomRight: Radius.circular(outlineBottomRightRadius ?? 4),
            )),
        disabledBorder: isUnderlineInputBorder == false && isOutlineInputBorder == false
            ? InputBorder.none
            : isOutlineInputBorder == false
            ? UnderlineInputBorder(borderSide: BorderSide(width: 1, color: greyColor))
            : OutlineInputBorder(
            borderSide: BorderSide(width: isOutlineInputBorderColor != null ? 0 : 1, color: redColor),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(outlineTopLeftRadius ?? 4),
              topRight: Radius.circular(outlineTopRightRadius ?? 4),
              bottomLeft: Radius.circular(outlineBottomLeftRadius ?? 4),
              bottomRight: Radius.circular(outlineBottomRightRadius ?? 4),
            )),
      ),
      inputFormatters: [
        keyboardType == TextInputType.number ? FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')):
        LengthLimitingTextInputFormatter(inputFormatter)
      ],
      style: TextStyle(
        color: textColor ?? blackColor,
        fontSize: textFontSize ?? 15,
      ),
    );
  }
}
