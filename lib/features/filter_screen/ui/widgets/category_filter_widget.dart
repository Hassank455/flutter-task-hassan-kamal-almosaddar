import 'package:flutter/material.dart';
import 'package:flutter_task/core/helpers/extensions.dart';
import 'package:flutter_task/core/helpers/responsive_helper/sizer_helper_extension.dart';
import 'package:flutter_task/core/helpers/spacing.dart';
import 'package:flutter_task/core/theme/app_colors.dart';
import 'package:flutter_task/core/theme/app_images.dart';
import 'package:flutter_task/core/theme/app_size.dart';
import 'package:flutter_task/core/theme/app_strings.dart';
import 'package:flutter_task/core/widgets/custom_image.dart';
import 'package:flutter_task/core/widgets/custom_text.dart';

class CategoryFilterWidget extends StatelessWidget {
  const CategoryFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: AppStrings.categoryWord,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: context.setSp(AppSize.s16),
            color: AppColors.black.withOpacity(0.5),
          ),
        ),
        verticalSpace(context, AppSize.s12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomPngImage(imageName: AppPngImage.realEstate),
            horizontalSpace(context, AppSize.s15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'عقارات',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                CustomText(
                  text: 'فلل البيع',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: AppColors.black.withOpacity(0.5),
                  ),
                ),
              ],
            ),
            Spacer(),
            CustomText(
              text: 'عقارات',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontSize: context.setSp(AppSize.s14),
                color: AppColors.purple,
              ),
            ),
          ],
        ),
      ],
    ).marginSymmetric(horizontal: context.setWidth(AppSize.s16));
  }
}
