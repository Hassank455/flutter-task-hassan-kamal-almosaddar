import 'package:flutter/material.dart';
import 'package:flutter_task/core/widgets/custom_text.dart';

class MyAdsScreen extends StatelessWidget {
  const MyAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CustomText(text: 'My Ads Screen')),
    );
  }
}
