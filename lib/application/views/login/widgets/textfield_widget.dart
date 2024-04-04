import 'package:codeland/core/constants/constant_color.dart';
import 'package:flutter/material.dart';

class LoginScreenTextfield extends StatelessWidget {
  const LoginScreenTextfield({
    super.key,
    required this.hintText,
    required this.controller,
    required this.errorValidator,
  });

  final TextEditingController controller;
  final String hintText;
  final String? Function(String?) errorValidator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: errorValidator,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: fTextfieldBorder),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: fTextfieldBorder),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: fTextfieldBorder),
        ),
      ),
    );
  }
}
