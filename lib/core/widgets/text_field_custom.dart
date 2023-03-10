import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_test_project/core/utils/app_colors.dart';

enum TextFieldType { id, pin, text, name, email, phone, lastName, password }

class TextFieldCustom extends StatelessWidget {
  final bool enabled;
  final bool textInside;
  final bool textOutside;
  final String fieldName;
  final bool obscureText;
  final String? errorText;
  final TextFieldType type;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final void Function()? onTap;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final Function(String? value, TextFieldType type)? validator;

  const TextFieldCustom({
    Key? key,
    this.onTap,
    this.onChanged,
    this.validator,
    this.errorText,
    this.focusNode,
    this.suffixIcon,
    this.fieldName = '',
    this.enabled = true,
    this.textInside = false,
    this.textOutside = true,
    this.obscureText = false,
    required this.controller,
    this.type = TextFieldType.text,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        validateTextOutside(),
        TextFormField(
          onTap: onTap,
          enabled: enabled,
          onChanged: onChanged,
          focusNode: focusNode,
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          style: TextStyle(
            letterSpacing: .6,
            color: AppColors.title,
            fontWeight: FontWeight.w600,
          ),
          cursorColor: AppColors.primaryDark,
          inputFormatters: inputFormatters(type),
          validator: (value) => validator!(value, type),
          textCapitalization: validateTextCapitalization(type),
          decoration: InputDecoration(
            filled: true,
            errorText: errorText,
            suffixIcon: suffixIcon,
            hoverColor: Colors.white,
            focusColor: Colors.white,
            errorBorder: errorBorder(),
            fillColor: Colors.grey.shade300,
            focusedErrorBorder: errorBorder(),
            hintText: textInside ? fieldName : '',
            contentPadding: const EdgeInsets.all(10),
            border: OutlineInputBorder(
              gapPadding: 10,
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ],
    );
  }

  InputBorder errorBorder() => OutlineInputBorder(
        gapPadding: 10,
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(width: 1, color: AppColors.error),
      );

  List<TextInputFormatter>? inputFormatters(TextFieldType type) {
    return <TextInputFormatter>[] +
        ((type == TextFieldType.id ||
                type == TextFieldType.pin ||
                type == TextFieldType.phone)
            ? [
                FilteringTextInputFormatter.deny(RegExp(r"\s")),
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ]
            : []) +
        ((type == TextFieldType.email || type == TextFieldType.password)
            ? [FilteringTextInputFormatter.deny(RegExp(r"\s"))]
            : []);
  }

  Widget validateTextOutside() => textOutside
      ? Column(
          children: [
            Text(fieldName, style: const TextStyle(letterSpacing: .6)),
            const SizedBox(height: 10.0),
          ],
        )
      : const SizedBox();

  TextCapitalization validateTextCapitalization(TextFieldType type) =>
      (type == TextFieldType.password)
          ? TextCapitalization.none
          : (type == TextFieldType.name || type == TextFieldType.lastName)
              ? TextCapitalization.words
              : TextCapitalization.sentences;
}
