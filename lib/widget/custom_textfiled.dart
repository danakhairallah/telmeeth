import 'package:flutter/material.dart';
import 'package:telmeeth1/core/responsive.dart';

class AppTextField extends StatelessWidget {
  final String hint;
  final IconData? icon;
  final bool isPassword;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;

  const AppTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.icon,
    this.onChanged,
    this.validator,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44, // h-11
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        style: TextStyle(
          fontSize: ResponsiveValues.font(context, 14), // text-base / md:text-sm
          color: const Color(0xFF0F172A), // text-slate-900
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: ResponsiveValues.font(context, 14),
            color: const Color(0xFF64748B), // slate-500
          ),

          prefixIcon: icon != null ? Icon(icon, size: 20) : null,

          filled: true,
          fillColor: const Color(0xFFF8FAFC), // bg-slate-50

          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12, // px-3
            vertical: 4,    // py-1 (تقريب)
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8), // rounded-md
            borderSide: const BorderSide(
              color: Color(0xFFE2E8F0), // border-slate-200
              width: 1,
            ),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Color(0xFF0F172A), // ring / focus
              width: 1.2,
            ),
          ),
        ),
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
