import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/app_color.dart';

class TitleText extends StatelessWidget {
  const TitleText(
      {super.key,
      required this.text,
      this.textAlign = TextAlign.left,
      this.textColor,
      this.overflow,
      this.textsize,
      this.fontFamily});
  final String text;
  final TextAlign textAlign;
  final Color? textColor;
  final double? textsize;
  final TextOverflow? overflow;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: textsize ?? 20.sp,
          overflow: overflow,
          fontFamily: fontFamily,
          color: textColor ?? AppColors.textColor),
    );
  }
}

class ButtonText extends StatelessWidget {
  const ButtonText(
      {super.key,
      required this.text,
      this.textAlign = TextAlign.left,
      this.textColor,
      this.textsize});
  final String text;
  final double? textsize;
  final TextAlign textAlign;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: textsize ?? 16.sp,
          color: textColor ?? AppColors.buttonTextColor),
    );
  }
}

class BodyText extends StatelessWidget {
  const BodyText(
      {super.key,
      required this.text,
      this.textAlign = TextAlign.left,
      this.textColor,
      this.overflow,
      this.maxLine,
      this.textsize});
  final String text;
  final TextAlign textAlign;
  final Color? textColor;
  final double? textsize;
  final TextOverflow? overflow;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLine,
      style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16.sp,
          color: textColor ?? AppColors.textColor),
    );
  }
}

class SmallBodyText extends StatelessWidget {
  const SmallBodyText(
      {super.key,
      required this.text,
      this.textAlign = TextAlign.left,
      this.textColor,
      this.overflow,
      this.maxLine,
      this.textsize});
  final String text;
  final TextAlign textAlign;
  final Color? textColor;
  final double? textsize;
  final TextOverflow? overflow;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLine,
      style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
          color: textColor ?? AppColors.textColor),
    );
  }
}
