import 'package:flutter/material.dart';
import 'package:flutter_task/core/helpers/constants.dart';
import 'package:flutter_task/core/helpers/responsive_helper/sizer_helper_extension.dart';
import 'package:flutter_task/core/theme/app_colors.dart';
import 'package:flutter_task/core/theme/app_size.dart';
import 'package:flutter_task/core/theme/font_weight_helper.dart';

class AppTextStyles {
  static TextStyle _baseTextStyle({
    required double fontSize,
    required FontWeight fontWeight,
    required Color color,
    required BuildContext context,
  }) {
    return TextStyle(
      fontSize: context.setSp(fontSize),
      fontFamily: Constants.fontFamily,
      color: color,
      fontWeight: fontWeight,
    );
  }

  static TextStyle regular(
    BuildContext context, {
    double fontSize = AppSize.s12,
    Color color = AppColors.textColor,
  }) => _baseTextStyle(
    context: context,
    fontSize: fontSize,
    fontWeight: FontWeightHelper.regular,
    color: color,
  );

  static TextStyle medium(
    BuildContext context, {
    double fontSize = AppSize.s16,
    Color color = AppColors.textColor,
  }) => _baseTextStyle(
    context: context,
    fontSize: fontSize,
    fontWeight: FontWeightHelper.medium,
    color: color,
  );

  static TextStyle semiBold(
    BuildContext context, {
    double fontSize = AppSize.s16,
    Color color = AppColors.textColor,
  }) => _baseTextStyle(
    context: context,
    fontSize: fontSize,
    fontWeight: FontWeightHelper.semiBold,
    color: color,
  );

  static TextStyle bold(
    BuildContext context, {
    double fontSize = AppSize.s18,
    Color color = AppColors.textColor,
  }) => _baseTextStyle(
    context: context,
    fontSize: fontSize,
    fontWeight: FontWeightHelper.bold,
    color: color,
  );
  static TextStyle extraBold(
    BuildContext context, {
    double fontSize = AppSize.s24,
    Color color = AppColors.textColor,
  }) => _baseTextStyle(
    context: context,
    fontSize: fontSize,
    fontWeight: FontWeightHelper.bold,
    color: color,
  );
}
