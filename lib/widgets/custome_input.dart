import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomeInput extends ConsumerWidget {
  const CustomeInput(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.textInputType,
      this.obscureText = false});
  final TextEditingController controller;
  final String labelText;
  final TextInputType textInputType;
  final bool? obscureText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      keyboardType: textInputType,
      controller: controller,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
          labelText: labelText,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.blue.shade500, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.orange.shade700))),
    );
  }
}
