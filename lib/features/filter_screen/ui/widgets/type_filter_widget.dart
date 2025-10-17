import 'package:flutter/material.dart';
import 'package:flutter_task/core/helpers/extensions.dart';
import 'package:flutter_task/core/helpers/responsive_helper/sizer_helper_extension.dart';
import 'package:flutter_task/core/helpers/spacing.dart';
import 'package:flutter_task/core/theme/app_colors.dart';
import 'package:flutter_task/core/theme/app_size.dart';
import 'package:flutter_task/core/theme/app_strings.dart';
import 'package:flutter_task/core/widgets/custom_text.dart';
import 'package:flutter_task/features/filter_screen/ui/widgets/filter_container_item_widget.dart';

class TypeFilterWidget extends StatelessWidget {
  const TypeFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: AppStrings.typeWord,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: context.setSp(AppSize.s16),
            color: AppColors.black.withOpacity(0.5),
          ),
        ),
        verticalSpace(context, AppSize.s12),
        Wrap(
          spacing: AppSize.s12,
          runSpacing: AppSize.s12,
          children: ['الكل', 'توين هاوس', 'فيلا منفصلة', 'تاون هاوس']
              .map(
                (e) => FilterContainerItemWidget(
                  text: e,
                  onTap: () {},
                  isSelected: false,
                ),
              )
              .toList(),
        ),
      ],
    ).marginSymmetric(horizontal: context.setWidth(AppSize.s16));
  }
}
