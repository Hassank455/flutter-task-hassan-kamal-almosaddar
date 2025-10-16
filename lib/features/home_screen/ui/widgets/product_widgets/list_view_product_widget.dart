import 'package:flutter/material.dart';
import 'package:flutter_task/core/helpers/responsive_helper/device_utils.dart';
import 'package:flutter_task/core/helpers/responsive_helper/size_provider.dart';
import 'package:flutter_task/core/helpers/responsive_helper/sizer_helper_extension.dart';
import 'package:flutter_task/core/theme/app_size.dart';
import 'package:flutter_task/features/home_screen/ui/widgets/product_widgets/item_list_view_product_widget.dart';

class ListViewProductWidget extends StatelessWidget {
  const ListViewProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizeProvider(
      baseSize: Size(context.screenWidth, AppSize.heightItemProduct),
      width: context.screenWidth,
      height: context.setMinSize(AppSize.heightItemProduct),
      child: Builder(
        builder: (context) {
          return GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: context.setWidth(AppSize.s16),
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: DeviceUtils.valueDecider<int>(
                context,
                onMobile: 2,
                others: 3,
              ),
              mainAxisExtent: context.sizeProvider.height,
              crossAxisSpacing: context.setWidth(AppSize.s12),
              mainAxisSpacing: context.setHeight(AppSize.s12),
            ),
            itemCount: 10,
            itemBuilder: (context, index) => const ItemListViewProductWidget(),
          );
        }
      ),
    );
  }
}
