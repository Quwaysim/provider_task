import 'package:flutter/material.dart';
import 'package:provider_task/utils/text_styles.dart';

import '../../utils/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.controller,
    required this.keyboardType,
    required this.inputAction,
    this.labelText,
    this.hintText,
  }) : super(key: key);
  final TextInputType? keyboardType;
  final TextInputAction? inputAction;
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: inputAction,
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        labelText: labelText,
        hintText: hintText,
        labelStyle: AppTextStyles.labelextStyle,
        hintStyle: AppTextStyles.textfieldHint,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(3.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
