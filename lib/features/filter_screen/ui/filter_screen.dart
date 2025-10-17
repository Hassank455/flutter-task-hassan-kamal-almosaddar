import 'package:flutter/material.dart';
import 'package:flutter_task/core/helpers/extensions.dart';
import 'package:flutter_task/core/helpers/responsive_helper/sizer_helper_extension.dart';
import 'package:flutter_task/core/helpers/spacing.dart';
import 'package:flutter_task/core/theme/app_colors.dart';

import 'package:flutter_task/core/theme/app_size.dart';
import 'package:flutter_task/core/widgets/custom_elevation_button.dart';
import 'package:flutter_task/features/filter_screen/ui/widgets/category_filter_widget.dart';

import 'package:flutter_task/features/filter_screen/ui/widgets/header_filter_widget.dart';
import 'package:flutter_task/features/filter_screen/ui/widgets/location_filter_widget.dart';
import 'package:flutter_task/features/filter_screen/ui/widgets/monthly_installments_widget.dart';
import 'package:flutter_task/features/filter_screen/ui/widgets/number_of_rooms_filter_widget.dart';
import 'package:flutter_task/features/filter_screen/ui/widgets/payment_method_filter_widget.dart';
import 'package:flutter_task/features/filter_screen/ui/widgets/price_filter_widget.dart';
import 'package:flutter_task/features/filter_screen/ui/widgets/property_condition_widget.dart';
import 'package:flutter_task/features/filter_screen/ui/widgets/type_filter_widget.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderFilterWidget(),
              verticalSpace(context, AppSize.s32),
              CategoryFilterWidget(),
              verticalSpace(context, AppSize.s20),
              Divider(color: AppColors.black.withOpacity(0.1)),
              verticalSpace(context, AppSize.s20),
              LocationFilterWidget(),
              verticalSpace(context, AppSize.s20),
              Divider(color: AppColors.black.withOpacity(0.1)),
              verticalSpace(context, AppSize.s20),
              MonthlyInstallmentsWidget(),
              verticalSpace(context, AppSize.s20),
              TypeFilterWidget(),
              verticalSpace(context, AppSize.s20),
              NumberOfRoomsFilterWidget(),
              verticalSpace(context, AppSize.s20),
              PriceFilterWidget(),
              verticalSpace(context, AppSize.s20),
              PaymentMethodFilterWidget(),

              verticalSpace(context, AppSize.s20),
              PropertyConditionWidget(),
              verticalSpace(context, AppSize.s78),
              CustomElevatedButton(
                onTap: () {},
                title: 'شاهد 10,000+ نتائج',
              ).marginSymmetric(horizontal: context.setWidth(AppSize.s16)),
            ],
          ),
        ),
      ),
    );
  }
}
