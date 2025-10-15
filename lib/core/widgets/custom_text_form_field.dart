import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_task/core/helpers/responsive_helper/sizer_helper_extension.dart';
import 'package:flutter_task/core/theme/app_size.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final String hintText;
  final int? maxLength;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;
  final bool obscureText;
  final bool textAlignCenter;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.validator,
    this.onChanged,
    this.maxLength,
    this.maxLines,
    this.readOnly = false,
    this.obscureText = false,
    this.textAlignCenter = false,
    this.inputFormatters,
    this.prefixIcon,
    this.suffixIcon,
    this.onFieldSubmitted,
    required this.hintText,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLines: maxLines,
      onTapUpOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      textAlign: textAlignCenter ? TextAlign.center : TextAlign.start,
      inputFormatters: inputFormatters ?? [],
      readOnly: readOnly,
      keyboardType: keyboardType,
      style: Theme.of(context).textTheme.titleMedium,
      maxLength: maxLength,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.setWidth(AppSize.s16),
          ),
          child: suffixIcon,
        ),
        hintText: hintText,
      ),
    );
  }
}
