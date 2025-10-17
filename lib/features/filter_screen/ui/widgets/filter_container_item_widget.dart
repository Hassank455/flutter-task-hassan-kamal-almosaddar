import 'package:flutter/material.dart';
import 'package:flutter_task/core/helpers/responsive_helper/sizer_helper_extension.dart';
import 'package:flutter_task/core/theme/app_colors.dart';
import 'package:flutter_task/core/theme/app_size.dart';
import 'package:flutter_task/core/widgets/custom_text.dart';

class FilterContainerItemWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isSelected;
  const FilterContainerItemWidget({
    super.key,
    required this.text,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.setWidth(AppSize.s8),
          vertical: context.setHeight(AppSize.s11),
        ),

        decoration: BoxDecoration(
          color: isSelected ? AppColors.bluePrimary.withOpacity(0.05) : null,
          borderRadius: BorderRadius.circular(
            context.setMinSize(AppSize.radiusTypeFilter),
          ),
          border: isSelected
              ? Border.all(
                  color: AppColors.bluePrimary,
                  width: context.setWidth(AppSize.s2),
                )
              : Border.all(
                  color: AppColors.black.withOpacity(0.1),
                  width: context.setWidth(AppSize.s1),
                ),
        ),
        child: CustomText(
          text: text,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: isSelected
                ? AppColors.bluePrimary
                : AppColors.textColor.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
