// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:saferefuge_ui/src/colors/sr_colors.dart';

class SRFormField extends StatelessWidget {
  const SRFormField({
    super.key,
    this.labelText = '',
    this.hintText = '',
    this.isPassword = false,
    this.keyboardType,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.controller,
    this.initialValue,
    this.suffixIcon,
    this.focusNode,
    this.enabled,
    this.maxLines = 1,
    this.onEditingComplete,
    this.errorText,
  });

  final String labelText;
  final String hintText;
  final bool isPassword;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final TextEditingController? controller;
  final String? initialValue;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final bool? enabled;
  final int? maxLines;
  final void Function()? onEditingComplete;
  final String? errorText;

  OutlineInputBorder _borderStyle({Color color = SRColors.primary}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: color),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              labelText,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: SRColors.black,
              ),
            ),
          ),
        TextFormField(
          onEditingComplete: onEditingComplete,
          focusNode: focusNode,
          controller: controller,
          onSaved: onSaved,
          enabled: enabled,
          style: const TextStyle(fontSize: 16),
          maxLines: maxLines,
          decoration: InputDecoration(
            errorText: errorText,
            border: _borderStyle(),
            enabledBorder:
                _borderStyle(color: const Color.fromRGBO(44, 83, 218, 0.8)),
            focusedBorder: _borderStyle(),
            disabledBorder:
                _borderStyle(color: const Color.fromRGBO(44, 83, 218, 0.5)),
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color.fromRGBO(27, 50, 132, 0.2),
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: maxLines! > 1 ? 8 : 1,
              horizontal: 16,
            ),
            suffixIcon: suffixIcon,
          ),
          obscureText: isPassword,
          enableSuggestions: !isPassword,
          autocorrect: !isPassword,
          validator: validator,
          onChanged: onChanged,
          initialValue: initialValue,
        )
      ],
    );
  }
}
