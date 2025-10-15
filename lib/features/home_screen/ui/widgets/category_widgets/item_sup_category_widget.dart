import 'package:flutter/material.dart';
import 'package:flutter_task/core/helpers/responsive_helper/sizer_helper_extension.dart';
import 'package:flutter_task/core/helpers/spacing.dart';
import 'package:flutter_task/core/theme/app_colors.dart';
import 'package:flutter_task/core/theme/app_size.dart';
import 'package:flutter_task/core/widgets/custom_cached_network_image.dart';
import 'package:flutter_task/core/widgets/custom_text.dart';

class ItemSupCategoryWidget extends StatelessWidget {
  const ItemSupCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          // height: context.sizeProvider.height / 1.5,
          height: context.setHeight(56),
          width: context.sizeProvider.width,
          margin: EdgeInsetsDirectional.only(
            end: AppSize.marginSupCategoryContainer,
          ),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.radiusApp),
            color: AppColors.black.withOpacity(0.1),
          ),
          child: Image.network(
            'https://i.ibb.co/RJSP8t8/24b0962276e50c480329714a01704f0b21e03eac.png',
          ),
        ),
        verticalSpace(context, AppSize.s5),
        CustomText(
          text: 'ساعات',
          textAlign: TextAlign.center,
          style: Theme.of(
            context,
          ).textTheme.titleSmall!.copyWith(fontSize: context.setSp(12)),
        ),
      ],
    );
  }
}
