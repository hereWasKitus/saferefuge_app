// ignore_for_file: public_member_api_docs, inference_failure_on_function_return_type

import 'package:flutter/material.dart';
import 'package:saferefuge_ui/src/colors/sr_colors.dart';

class SRTextField extends StatelessWidget {
  const SRTextField({
    super.key,
    this.onEditingComplete,
    this.focusNode,
    this.controller,
    this.onChange,
    this.enabledBorderColor = const Color.fromRGBO(27, 50, 132, 0.2),
    this.focusedBorderColor = const Color.fromRGBO(27, 50, 132, 0.5),
    this.hintText,
    this.hintTextColor = SRColors.grey,
    this.prefixIcon,
    this.suffixIcon,
    this.textColor = SRColors.grey2,
    this.cursorColor = SRColors.grey2,
    this.fillColor = Colors.white,
    this.filled = true,
  });

  final VoidCallback? onEditingComplete;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final Function(String)? onChange;
  final Color enabledBorderColor;
  final Color focusedBorderColor;
  final String? hintText;
  final Color? hintTextColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? textColor;
  final Color? cursorColor;
  final Color? fillColor;
  final bool? filled;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onEditingComplete: onEditingComplete,
      focusNode: focusNode,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        fillColor: fillColor,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: enabledBorderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: focusedBorderColor,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        constraints: const BoxConstraints(maxHeight: 44),
        hintText: hintText,
        hintStyle: TextStyle(
          color: hintTextColor,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      style: TextStyle(
        color: textColor,
      ),
      cursorColor: cursorColor,
      onChanged: onChange,
    );
  }
}
