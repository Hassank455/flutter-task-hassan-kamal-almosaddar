import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_task/core/helpers/responsive_helper/sizer_helper_extension.dart';
import 'package:flutter_task/core/theme/app_colors.dart';
import 'package:flutter_task/core/theme/app_size.dart';
import 'package:flutter_task/core/theme/styles.dart';

class Themes {
  static ThemeData light(BuildContext context) => ThemeData.light().copyWith(
    primaryColor: AppColors.bluePrimary,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    cardColor: Colors.white,
    textTheme: TextTheme(
      titleSmall: AppTextStyles.regular(context),
      titleMedium: AppTextStyles.medium(context),
      titleLarge: AppTextStyles.semiBold(context),
      headlineSmall: AppTextStyles.bold(context),
      headlineMedium: AppTextStyles.extraBold(context),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,
      contentPadding: EdgeInsets.symmetric(
        vertical: context.setHeight(AppSize.s16),
        horizontal: context.setWidth(AppSize.s10),
      ),
      hintStyle: AppTextStyles.regular(
        context,
        color: AppColors.black.withOpacity(0.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(context.setMinSize(AppSize.s12)),
        borderSide: BorderSide(
          color: AppColors.borderColor,
          width: context.setWidth(AppSize.s1),
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(context.setMinSize(AppSize.s12)),
        borderSide: BorderSide(
          color: AppColors.borderColor,
          width: context.setWidth(AppSize.s1),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(context.setMinSize(AppSize.s12)),
        borderSide: BorderSide(
          color: AppColors.borderColor,
          width: context.setWidth(AppSize.s1),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(context.setMinSize(AppSize.s12)),
        borderSide: BorderSide(
          color: AppColors.red,
          width: context.setWidth(AppSize.s1),
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(context.setMinSize(AppSize.s12)),
        borderSide: BorderSide(
          color: AppColors.borderColor,
          width: context.setWidth(AppSize.s1),
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(color: AppColors.black),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: AppTextStyles.bold(context),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Platform.isAndroid
            ? Brightness.dark
            : Brightness.light,
        statusBarBrightness: Platform.isAndroid
            ? Brightness.dark
            : Brightness.light,
      ),
    ),
    iconTheme: const IconThemeData(color: AppColors.black),
  );

  static ThemeData dark(BuildContext context) => ThemeData.dark().copyWith(
    primaryColor: AppColors.bluePrimary,
    scaffoldBackgroundColor: AppColors.darkBackGroundColor,
    cardColor: AppColors.darkCardColor,
    textTheme: TextTheme(
      titleSmall: AppTextStyles.regular(context, color: AppColors.white),
      titleMedium: AppTextStyles.medium(context, color: AppColors.white),
      titleLarge: AppTextStyles.semiBold(context, color: AppColors.white),
      headlineSmall: AppTextStyles.bold(context, color: AppColors.white),
      headlineMedium: AppTextStyles.extraBold(context, color: AppColors.white),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkCardColor,
      contentPadding: EdgeInsets.symmetric(
        vertical: context.setHeight(AppSize.s14),
        horizontal: context.setWidth(AppSize.s16),
      ),
      hintStyle: AppTextStyles.regular(context, color: AppColors.white),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(context.setMinSize(AppSize.s8)),
        borderSide: BorderSide(
          color: AppColors.darkCardColor,
          width: context.setWidth(AppSize.s1),
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(context.setMinSize(AppSize.s8)),
        borderSide: BorderSide(
          color: AppColors.darkCardColor,
          width: context.setWidth(AppSize.s1),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(context.setMinSize(AppSize.s8)),
        borderSide: BorderSide(
          color: AppColors.darkCardColor,
          width: context.setWidth(AppSize.s1),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(context.setMinSize(AppSize.s8)),
        borderSide: BorderSide(
          color: AppColors.red,
          width: context.setWidth(AppSize.s1),
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(context.setMinSize(AppSize.s8)),
        borderSide: BorderSide(
          color: AppColors.darkCardColor,
          width: context.setWidth(AppSize.s1),
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(color: AppColors.white),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: AppTextStyles.bold(context, color: AppColors.white),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Platform.isAndroid
            ? Brightness.light
            : Brightness.dark,
        statusBarBrightness: Platform.isAndroid
            ? Brightness.light
            : Brightness.dark,
      ),
    ),
  );
}
