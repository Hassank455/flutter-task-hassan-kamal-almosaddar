import 'package:flutter/material.dart';
import 'package:flutter_task/core/helpers/spacing.dart';
import 'package:flutter_task/core/theme/app_size.dart';

import 'package:flutter_task/features/home_screen/ui/widgets/header_home_and_categories_widget.dart';
import 'package:flutter_task/features/home_screen/ui/widgets/product_widgets/list_view_product_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderHomeAndCategoriesWidget(),
          verticalSpace(context, AppSize.s20),
          ListViewProductWidget(),
        ],
      ),
    );
  }
}
