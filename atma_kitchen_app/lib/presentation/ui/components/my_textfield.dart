import 'package:atma_kitchen_app/presentation/ui/styles/atma_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final IconData prefixIcon;
  final bool readOnly;
  final Function()? onTap;
  final FocusNode? focusNode;
  final TextInputAction textInputAction;
  final Color fillColor;
  final Function(String value)? onChanged;
  final List<TextInputFormatter> inputFormatters;
  final TextInputType keyboardType;
  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.prefixIcon,
      this.obscureText = false,
      this.readOnly = false,
      this.focusNode,
      this.onTap,
      this.textInputAction = TextInputAction.next,
      this.onChanged,
      this.fillColor = AtmaColors.lightGray,
      this.inputFormatters = const [],
      this.keyboardType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        readOnly: readOnly,
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        obscureText: obscureText,
        focusNode: focusNode,
        cursorColor: AtmaColors.primary,
        textInputAction: textInputAction,
        onTap: onTap,
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor,
          prefixIconColor: AtmaColors.primary,
          prefixIcon: Icon(prefixIcon),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AtmaColors.lightGray),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AtmaColors.primary),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hintText,
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
}
