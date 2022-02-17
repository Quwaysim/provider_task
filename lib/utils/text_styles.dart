// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider_task/utils/colors.dart';

class AppTextStyles {
  static TextStyle Headline1 = GoogleFonts.inter(
    color: AppColors.secondaryColor,
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  static TextStyle Headline2 = GoogleFonts.inter(
    color: AppColors.primaryColor,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static TextStyle defaultTextStyle = GoogleFonts.inter(
    color: AppColors.defaultTextColor,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static TextStyle defaultTextStyle14 = GoogleFonts.inter(
    color: AppColors.defaultTextColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static TextStyle defaultFaintTextStyle = GoogleFonts.inter(
    color: AppColors.faintTextColor2,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static TextStyle textfieldHint = GoogleFonts.inter(
    color: AppColors.hintTextColor,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static TextStyle buttonTextStyle = GoogleFonts.inter(
    color: AppColors.whiteColor,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static TextStyle faintTextStyle = GoogleFonts.inter(
    color: AppColors.faintTextColor,
    fontSize: 14,
  );

  static TextStyle bigBoldTextStyle = GoogleFonts.inter(
    color: AppColors.defaultTextColor,
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );

  static TextStyle bigBoldTextStyle14 = GoogleFonts.inter(
    color: AppColors.defaultTextColor,
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );
}
