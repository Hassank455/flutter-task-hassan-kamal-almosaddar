import 'package:flutter/material.dart';
import 'package:flutter_task/core/widgets/custom_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CustomText(text: 'Profile Screen')),
    );
  }
}
