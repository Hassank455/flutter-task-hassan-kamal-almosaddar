import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/helpers/enum.dart';
import 'package:flutter_task/core/helpers/responsive_helper/size_provider.dart';
import 'package:flutter_task/core/helpers/responsive_helper/sizer_helper_extension.dart';
import 'package:flutter_task/core/theme/app_size.dart';
import 'package:flutter_task/features/home_screen/cubit/home_cubit.dart';
import 'package:flutter_task/features/home_screen/cubit/home_state.dart';
import 'package:flutter_task/features/home_screen/data/models/category_model.dart';
import 'package:flutter_task/features/home_screen/ui/widgets/category_widgets/item_category_widget.dart';

class ListViewCategoriesWidget extends StatelessWidget {
  const ListViewCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizeProvider(
      baseSize: Size(context.screenWidth, AppSize.heightItemCategory),
      width: context.screenWidth,
      height: AppSize.heightItemCategory,
      child: Builder(
        builder: (context) {
          return BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state.homeStatus == RequestsStatus.loading) {
                return const SizedBox.shrink();
              } else if (state.homeStatus == RequestsStatus.success) {
                final List<CategoryModel>? categories = state.categories;
                return SizedBox(
                  height: context.sizeProvider.height,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: categories!.length,
                    padding: EdgeInsets.symmetric(
                      horizontal: context.setWidth(AppSize.s16),
                    ),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => ItemCategoryWidget(
                      name: categories[index].name,
                      onTap: () {
                        context.read<HomeCubit>().selectCategory(
                          categories[index].id,
                        );
                      },
                      isSelected:
                          state.selectedCategory!.id == categories[index].id,
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
