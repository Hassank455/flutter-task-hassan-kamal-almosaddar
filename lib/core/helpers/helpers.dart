import 'dart:ui'; // For BackdropFilter

import 'package:flutter/material.dart';
import 'package:flutter_task/core/helpers/responsive_helper/sizer_helper_extension.dart';

class Helper {
  void showSnackBar({
    required BuildContext context,
    required String? text,
    bool error = false,
    Color? color,
    String? actionTitle,
    Function()? onPressed,
  }) {
    // Using ScaffoldMessenger to show the snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.up,
        backgroundColor: Colors.transparent, // Make the background transparent
        elevation: 0, // Remove shadow
        content: Stack(
          children: [
            // Blurred background using BackdropFilter
            ClipRRect(
              borderRadius: BorderRadius.circular(context.setMinSize(10)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  height: context.setHeight(45),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(
                      0.4,
                    ), // Adjust opacity for visibility
                    borderRadius: BorderRadius.circular(context.setMinSize(10)),
                  ),
                ),
              ),
            ),
            // SnackBar content
            Positioned.fill(
              child: Center(
                child: Text(
                  text ?? '',
                  textAlign: TextAlign.center,
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall!.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        duration: const Duration(seconds: 3),
        margin: EdgeInsets.only(
          right: context.setWidth(20),
          left: context.setWidth(20),
          bottom: MediaQuery.of(context).size.height - (context.setHeight(250)),
        ),
      ),
    );
  }
}
