import 'package:flutter/material.dart';
import 'package:flutter_task/core/routing/routes.dart';
import 'package:flutter_task/core/theme/app_images.dart';
import 'package:flutter_task/core/theme/app_size.dart';
import 'package:flutter_task/core/theme/app_strings.dart';
import 'package:flutter_task/core/widgets/custom_image.dart';
import 'package:flutter_task/core/widgets/custom_text.dart';
import 'package:flutter_task/core/helpers/extensions.dart';
import 'package:flutter_task/core/helpers/responsive_helper/sizer_helper_extension.dart';
import 'package:flutter_task/core/helpers/spacing.dart';
import 'package:flutter_task/core/theme/app_colors.dart';
import 'package:flutter_task/features/home_screen/ui/widgets/category_widgets/list_view_categories_widget.dart';
import 'package:flutter_task/features/home_screen/ui/widgets/category_widgets/list_view_sup_categories_widget.dart';
import 'package:flutter_task/features/home_screen/ui/widgets/free_shipping_widget.dart';

class HeaderHomeAndCategoriesWidget extends StatelessWidget {
  const HeaderHomeAndCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // verticalSpace(context, context.setHeight(AppSize.s10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: AppStrings.headerTextForHomeScreen,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: context.setSp(AppSize.s16),
              ),
            ),
            GestureDetector(
              onTap: () {
                context.pushNamed(Routes.filterScreen);
              },
              child: Row(
                children: [
                  CustomText(
                    text: AppStrings.subTextForHomeScreen,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: context.setSp(AppSize.s16),
                      color: AppColors.black.withOpacity(0.5),
                    ),
                  ),
                  horizontalSpace(context, context.setWidth(AppSize.s8)),
                  CustomSvgImage(
                    imageName: AppSvgImage.arrowBack,
                    width: AppSize.s18,
                    height: AppSize.s18,
                    color: AppColors.black.withOpacity(0.70),
                  ),
                ],
              ),
            ),
          ],
        ).marginSymmetric(horizontal: context.setWidth(AppSize.s16)),
        verticalSpace(context, context.setHeight(AppSize.s12)),
        ListViewCategoriesWidget(),
        verticalSpace(context, context.setHeight(AppSize.s33)),
        ListViewSupCategoriesWidget(),
        verticalSpace(context, context.setHeight(AppSize.s33)),
        FreeShippingWidget(),
      ],
    );
  }
}
