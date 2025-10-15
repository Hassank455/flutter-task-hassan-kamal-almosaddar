import 'package:flutter/material.dart';
import 'package:flutter_task/core/helpers/responsive_helper/sizer_helper_extension.dart';
import 'package:flutter_task/core/theme/app_colors.dart';
import 'package:flutter_task/core/theme/app_size.dart';
import 'package:flutter_task/core/widgets/custom_text.dart';

class ItemCategoryWidget extends StatelessWidget {
  const ItemCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.sizeProvider.height,
      margin: EdgeInsetsDirectional.only(end: AppSize.marginCategoryContainer),
      padding: EdgeInsets.all(AppSize.paddingCategoryContainer),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.radiusApp),
        color: Theme.of(context).cardColor.withOpacity(0.3),
        border: Border.all(width: 1, color: AppColors.black.withOpacity(0.1)),
      ),
      child: CustomText(
        text: 'ملابس',
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: AppColors.textColor.withOpacity(0.5),
          fontSize: context.setSp(14),
        ),
      ),
    );
  }
}
