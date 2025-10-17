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

class HeaderFilterWidget extends StatelessWidget {
  const HeaderFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => context.pop(),
          child: CustomPngImage(
            imageName: AppPngImage.close,
            width: AppSize.s24,
            height: AppSize.s24,
          ).marginOnly(bottom: context.setHeight(AppSize.s6)),
        ),
        horizontalSpace(context, AppSize.s12),
        CustomText(
          text: AppStrings.titleFilter,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: context.setSp(AppSize.s24),
          ),
        ),
        Spacer(),
        CustomText(
          text: AppStrings.backToDefaultFilter,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            fontSize: context.setSp(AppSize.s16),
            color: AppColors.bluePrimary,
          ),
        ),
      ],
    ).marginSymmetric(horizontal: context.setWidth(AppSize.s16));
  }
}
