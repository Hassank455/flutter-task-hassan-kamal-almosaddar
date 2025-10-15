import 'package:flutter/material.dart';
import 'package:flutter_task/core/helpers/responsive_helper/sizer_helper_extension.dart';
import 'package:flutter_task/core/helpers/spacing.dart';
import 'package:flutter_task/core/theme/app_colors.dart';
import 'package:flutter_task/core/theme/app_images.dart';
import 'package:flutter_task/core/theme/app_size.dart';
import 'package:flutter_task/core/theme/app_strings.dart';
import 'package:flutter_task/core/widgets/custom_image.dart';
import 'package:flutter_task/core/widgets/custom_text.dart';

class FreeShippingWidget extends StatelessWidget {
  const FreeShippingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.setWidth(AppSize.s16)),
      padding: EdgeInsets.symmetric(
        vertical: context.setHeight(AppSize.s8),
        horizontal: context.setWidth(AppSize.s8),
      ),
      decoration: BoxDecoration(
        color: AppColors.orange.withOpacity(0.05),
        borderRadius: BorderRadius.circular(AppSize.radiusApp),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomSvgImage(
            imageName: AppSvgImage.check,
            width: AppSize.s15,
            height: AppSize.s12,
          ),
          horizontalSpace(context, AppSize.s8),
          CustomText(
            text: AppStrings.titleFreeShipping,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: AppColors.green,
              fontSize: context.setSp(12),
            ),
          ),
          Spacer(),
          CustomText(
            text: AppStrings.subTitleFreeShipping,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
