import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/helpers/responsive_helper/size_provider.dart';
import 'package:flutter_task/core/helpers/spacing.dart';
import 'package:flutter_task/core/theme/app_colors.dart';
import 'package:flutter_task/core/theme/app_images.dart';
import 'package:flutter_task/core/theme/app_strings.dart';
import 'package:flutter_task/core/widgets/custom_image.dart';
import 'package:flutter_task/core/widgets/custom_text.dart';
import 'package:flutter_task/features/bottom_nav/cubit/bottom_nav_cubit.dart';
import 'package:flutter_task/features/bottom_nav/cubit/bottom_nav_state.dart';
import 'package:flutter_task/core/helpers/responsive_helper/sizer_helper_extension.dart';
import 'package:flutter_task/core/theme/app_size.dart';

class CustomNavBottom extends StatelessWidget {
  const CustomNavBottom({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavCubit = context.read<BottomNavCubit>();
    return SizeProvider(
      baseSize: Size(context.screenWidth, AppSize.heightBottomNavigationBar),
      width: context.screenWidth,
      height: AppSize.heightBottomNavigationBar,
      child: BlocBuilder<BottomNavCubit, BottomNavState>(
        builder: (context, state) => Container(
          height: context.sizeProvider.height,
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: context.setMinSize(11),
            vertical: context.setMinSize(4),
          ),

          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: AppColors.black.withOpacity(0.1),
                width: 1,
              ),
            ),
            // color: Theme.of(context).cardColor,
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey.withOpacity(0.2),
            //     spreadRadius: 1,
            //     blurRadius: 3,
            //     offset: const Offset(0, 2),
            //   ),
            // ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                context,
                title: AppStrings.homeBottomNavigationBar,
                imageName: AppSvgImage.home,
                isSelected: state.currentIndex == 0,
                onTap: () {
                  bottomNavCubit.setIndexScreen(0);
                },
              ),
              _buildNavItem(
                context,
                title: AppStrings.chatBottomNavigationBar,
                imageName: AppSvgImage.chat,
                isSelected: state.currentIndex == 1,
                onTap: () {
                  bottomNavCubit.setIndexScreen(1);
                },
              ),
              _buildNavItem(
                context,
                title: AppStrings.addAnAdBottomNavigationBar,
                imageName: AppSvgImage.addAd,
                isSelected: state.currentIndex == 2,
                onTap: () {
                  bottomNavCubit.setIndexScreen(2);
                },
                isCenter: true,
              ),
              _buildNavItem(
                context,
                title: AppStrings.myAdsBottomNavigationBar,
                imageName: AppSvgImage.myAds,
                isSelected: state.currentIndex == 3,
                onTap: () {
                  bottomNavCubit.setIndexScreen(3);
                },
              ),
              _buildNavItem(
                context,
                title: AppStrings.profileBottomNavigationBar,
                imageName: AppSvgImage.account,
                isSelected: state.currentIndex == 4,
                onTap: () {
                  bottomNavCubit.setIndexScreen(4);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required String imageName,
    required String title,
    required VoidCallback onTap,
    required bool isSelected,
    bool isCenter = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context.setWidth(AppSize.widthItemBottomNavigationBar),
        height: context.setHeight(AppSize.heightItemBottomNavigationBar),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(context.setMinSize(AppSize.s4)),
          border: isSelected
              ? Border(bottom: BorderSide(width: 1, color: AppColors.textColor))
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            CustomSvgImage(
              imageName: imageName,
              width: AppSize.s20,
              height: AppSize.s20,
              color: isCenter
                  ? AppColors.lightBluePrimary
                  : isSelected
                  ? AppColors.textColor
                  : AppColors.textColor.withOpacity(0.5),
              fit: BoxFit.cover,
            ),
            horizontalSpace(context, AppSize.s3),
            CustomText(
              text: title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: context.setSp(AppSize.s12),
                color: isCenter
                    ? AppColors.lightBluePrimary
                    : isSelected
                    ? null
                    : AppColors.textColor.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
