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

class LocationFilterWidget extends StatelessWidget {
  const LocationFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomPngImage(
          imageName: AppPngImage.location,
          width: AppSize.s16,
          height: AppSize.s20,
        ),
        horizontalSpace(context, AppSize.s12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: AppStrings.locationWord,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            CustomText(
              text: 'مصر',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: AppColors.black.withOpacity(0.5),
              ),
            ),
          ],
        ),
        Spacer(),
        CustomPngImage(
          imageName: AppPngImage.backward,
          width: AppSize.s7,
          height: AppSize.s12,
        ),
      ],
    ).marginSymmetric(horizontal: context.setWidth(AppSize.s16));
  }
}
