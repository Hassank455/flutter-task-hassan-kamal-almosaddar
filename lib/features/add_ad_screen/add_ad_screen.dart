import 'package:flutter/material.dart';
import 'package:flutter_task/core/widgets/custom_text.dart';

class AddAdScreen extends StatelessWidget {
  const AddAdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CustomText(text: 'Add Ad Screen')),
    );
  }
}
