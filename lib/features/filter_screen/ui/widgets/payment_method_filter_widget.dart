import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/helpers/extensions.dart';
import 'package:flutter_task/core/helpers/responsive_helper/sizer_helper_extension.dart';
import 'package:flutter_task/core/helpers/spacing.dart';
import 'package:flutter_task/core/theme/app_colors.dart';
import 'package:flutter_task/core/theme/app_size.dart';
import 'package:flutter_task/core/theme/app_strings.dart';
import 'package:flutter_task/core/widgets/custom_text.dart';
import 'package:flutter_task/features/filter_screen/cubit/filter_cubit.dart';
import 'package:flutter_task/features/filter_screen/cubit/filter_state.dart';
import 'package:flutter_task/features/filter_screen/ui/widgets/filter_container_item_widget.dart';

class PaymentMethodFilterWidget extends StatelessWidget {
  const PaymentMethodFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: AppStrings.paymentMethodWord,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: context.setSp(AppSize.s16),
            color: AppColors.black.withOpacity(0.5),
          ),
        ),
        verticalSpace(context, AppSize.s12),
        BlocSelector<
          FilterCubit,
          FilterState,
          ({List<String> methods, String selected})
        >(
          selector: (state) => (
            methods: state.paymentMethods,
            selected: state.selectedPaymentMethod,
          ),
          builder: (context, data) {
            return Wrap(
              spacing: AppSize.s12,
              runSpacing: AppSize.s12,
              children: data.methods.map((method) {
                final isSelected = data.selected == method;
                return FilterContainerItemWidget(
                  text: method,
                  isSelected: isSelected,
                  onTap: () =>
                      context.read<FilterCubit>().changePaymentMethod(method),
                );
              }).toList(),
            );
          },
        ),
      ],
    ).marginSymmetric(horizontal: context.setWidth(AppSize.s16));
  }
}
