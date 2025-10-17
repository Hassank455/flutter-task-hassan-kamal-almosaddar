import 'package:flutter/material.dart';
import 'package:flutter_task/core/helpers/extensions.dart';
import 'package:flutter_task/core/helpers/responsive_helper/sizer_helper_extension.dart';
import 'package:flutter_task/core/helpers/spacing.dart';
import 'package:flutter_task/core/theme/app_colors.dart';
import 'package:flutter_task/core/theme/app_size.dart';
import 'package:flutter_task/core/theme/app_strings.dart';
import 'package:flutter_task/core/widgets/custom_text.dart';
import 'package:flutter_task/core/widgets/custom_text_form_field.dart';

class PriceFilterWidget extends StatelessWidget {
  const PriceFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: AppStrings.priceWord,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: context.setSp(AppSize.s16),
            color: AppColors.black.withOpacity(0.5),
          ),
        ),
        verticalSpace(context, AppSize.s12),
        Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                controller: TextEditingController(),
                validator: (val) {},
                hintText: AppStrings.minPriceWord,
              ),
            ),
            horizontalSpace(context, AppSize.s12),
            Expanded(
              child: CustomTextFormField(
                controller: TextEditingController(),
                validator: (val) {},
                hintText:AppStrings.maxPriceWord,
              ),
            ),
          ],
        ),
      ],
    ).marginSymmetric(horizontal: context.setWidth(AppSize.s16));
  }
}
