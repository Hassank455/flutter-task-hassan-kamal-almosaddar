import 'package:flutter/material.dart';
import 'package:flutter_task/core/helpers/responsive_helper/sizer_helper_extension.dart';
import 'package:flutter_task/core/helpers/spacing.dart';
import 'package:flutter_task/core/theme/app_colors.dart';
import 'package:flutter_task/core/theme/app_images.dart';
import 'package:flutter_task/core/theme/app_size.dart';
import 'package:flutter_task/core/widgets/custom_image.dart';
import 'package:flutter_task/core/widgets/custom_text.dart';
import 'package:flutter_task/features/home_screen/data/models/product_model.dart';

class ItemListViewProductWidget extends StatelessWidget {
  final ProductModel product;
  const ItemListViewProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.radiusApp),
        border: Border.all(
          width: 1,
          color: AppColors.borderProductColor.withOpacity(0.1),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: context.setHeight(AppSize.heightImageProduct),
            decoration: BoxDecoration(color: AppColors.black.withOpacity(0.05)),
            child: Image.network(product.imageUrl!),
          ),
          verticalSpace(context, AppSize.s4),

          Expanded(
            child: Container(
              margin: EdgeInsets.all(AppSize.s8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomText(
                          text: product.title,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(fontSize: context.setSp(14)),
                        ),
                      ),
                      if (product.isOffer == 1)
                        CustomSvgImage(
                          imageName: AppSvgImage.boxOffer,
                          width: AppSize.s20,
                          height: AppSize.s20,
                        ),
                    ],
                  ),
                  verticalSpace(context, AppSize.s8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: RichText(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            text: '${product.price}جم/',
                            style: Theme.of(context).textTheme.titleMedium!
                                .copyWith(
                                  color: AppColors.red,
                                  fontSize: context.setSp(12),
                                ),
                            children: [
                              TextSpan(
                                text: product.oldPrice.toString(),
                                style: Theme.of(context).textTheme.titleSmall!
                                    .copyWith(
                                      fontSize: context.setSp(12),
                                      decoration: TextDecoration.lineThrough,
                                      color: AppColors.black.withOpacity(0.5),
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      CustomSvgImage(
                        imageName: AppSvgImage.favorite,
                        width: AppSize.s24,
                        height: AppSize.s24,
                      ),
                    ],
                  ),
                  verticalSpace(context, AppSize.s8),
                  Row(
                    children: [
                      CustomSvgImage(
                        imageName: AppSvgImage.fire,
                        width: AppSize.s9,
                        height: AppSize.s10,
                      ),
                      horizontalSpace(context, AppSize.s6),
                      CustomText(
                        text: 'تم بيع 3.3k+',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: context.setSp(10),
                          color: AppColors.textColor.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Badge(
                        backgroundColor: AppColors.lightBluePrimary,
                        alignment: AlignmentDirectional.topStart,
                        padding: EdgeInsets.all(2),
                        offset: Offset(4, -4),

                        label: CustomSvgImage(
                          imageName: AppSvgImage.check,
                          color: AppColors.white,
                          width: AppSize.s7,
                          height: AppSize.s6,
                        ),
                        child: Container(
                          width: context.setWidth(AppSize.s26),
                          height: context.setHeight(AppSize.s26),
                          padding: EdgeInsets.all(AppSize.s6),
                          decoration: BoxDecoration(
                            color: AppColors.lightBluePrimary.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: CustomSvgImage(
                            imageName: AppSvgImage.build,
                            width: AppSize.s15,
                            height: AppSize.s15,
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: context.setWidth(AppSize.s32),
                        height: context.setHeight(AppSize.s24),
                        padding: EdgeInsets.symmetric(
                          horizontal: context.setWidth(AppSize.s8),
                          vertical: context.setHeight(AppSize.s4),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: AppColors.black.withOpacity(0.1),
                          ),
                          borderRadius: BorderRadius.circular(
                            AppSize.radiusApp,
                          ),
                        ),
                        child: CustomSvgImage(
                          imageName: AppSvgImage.addShoppingCart,
                          width: AppSize.s16,
                          height: AppSize.s16,
                        ),
                      ),
                      horizontalSpace(context, AppSize.s12),
                      Image.network(
                        'https://i.ibb.co/pvCb8g3F/9d49f354-c245-4cac-9644-3d3ef4bf62b8-removalai-preview-1.png',
                        width: context.setWidth(AppSize.s15),
                        height: context.setHeight(AppSize.s22),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
