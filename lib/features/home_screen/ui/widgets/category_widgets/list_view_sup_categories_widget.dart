import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/helpers/app_logger.dart';
import 'package:flutter_task/core/helpers/enum.dart';
import 'package:flutter_task/core/helpers/responsive_helper/size_provider.dart';
import 'package:flutter_task/core/helpers/responsive_helper/sizer_helper_extension.dart';
import 'package:flutter_task/core/theme/app_size.dart';
import 'package:flutter_task/features/home_screen/cubit/home_cubit.dart';
import 'package:flutter_task/features/home_screen/cubit/home_state.dart';
import 'package:flutter_task/features/home_screen/data/models/category_model.dart';
import 'package:flutter_task/features/home_screen/ui/widgets/category_widgets/item_sup_category_widget.dart';

class ListViewSupCategoriesWidget extends StatelessWidget {
  const ListViewSupCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizeProvider(
      baseSize: Size(
        AppSize.widthItemSupCategory,
        AppSize.heightItemSupCategory,
      ),
      width: AppSize.widthItemSupCategory,
      height: AppSize.heightItemSupCategory,
      child: Builder(
        builder: (context) {
          return BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state.homeStatus == RequestsStatus.loading) {
                return const SizedBox.shrink();
              } else if (state.homeStatus == RequestsStatus.success) {
                final List<CategoryModel>? subCategories = state.subCategories;
                return SizedBox(
                  height: context.sizeProvider.height,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: subCategories!.length,
                    padding: EdgeInsets.symmetric(
                      horizontal: context.setWidth(AppSize.s16),
                    ),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => ItemSupCategoryWidget(
                      subCategory: subCategories[index],
                      
                    ),
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          );
        },
      ),
    );
  }
}
