import 'package:flutter/material.dart';
import 'package:flutter_task/core/widgets/custom_text.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CustomText(text: 'Chat Screen')),
    );
  }
}
