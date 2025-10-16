import 'package:flutter/material.dart';
import 'package:flutter_task/core/helpers/responsive_helper/sizer_helper_extension.dart';
import 'package:flutter_task/core/theme/app_colors.dart';
import 'package:flutter_task/core/theme/app_size.dart';
import 'package:flutter_task/core/widgets/custom_text.dart';

class ItemCategoryWidget extends StatelessWidget {
  final String name;
  final VoidCallback onTap;

  final bool isSelected;
  const ItemCategoryWidget({
    super.key,
    required this.name,
    required this.onTap,

    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: context.sizeProvider.height,
        margin: EdgeInsetsDirectional.only(
          end: AppSize.marginCategoryContainer,
        ),
        padding: EdgeInsets.all(AppSize.paddingCategoryContainer),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.radiusApp),
          color: isSelected
              ? AppColors.orange.withOpacity(0.05)
              : Theme.of(context).cardColor.withOpacity(0.3),
          border: Border.all(width: 1, color: AppColors.black.withOpacity(0.1)),
        ),
        child: CustomText(
          text: name,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: isSelected
                ? AppColors.orange
                : AppColors.textColor.withOpacity(0.5),
            fontSize: context.setSp(14),
          ),
        ),
      ),
    );
  }
}
