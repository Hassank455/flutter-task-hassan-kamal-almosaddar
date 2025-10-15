import 'package:flutter/material.dart';

import 'package:flutter_task/features/home_screen/ui/widgets/header_home_and_categories_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [HeaderHomeAndCategoriesWidget()]);
  }
}
