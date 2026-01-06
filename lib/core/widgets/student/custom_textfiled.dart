import 'package:flutter/material.dart';
import '../../constants/responsive.dart';

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
      height: context.h(4.8), // h-11
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        style: TextStyle(
          fontSize: context.w(3.4),
          // text-base / md:text-sm
          color: const Color(0xFF0F172A), // text-slate-900
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: context.w(3.4),
            color: const Color(0xFF64748B), // slate-500
          ),

          prefixIcon: icon != null ? Icon(icon, size: context.w(5)) : null,

          filled: true,
          fillColor: const Color(0xFFF8FAFC),

          // bg-slate-50
          contentPadding: EdgeInsets.symmetric(
            horizontal: context.w(2.9), // px-3
            vertical: context.h(0.4), // py-1 (تقريب)
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(context.h(0.8)), // rounded-md
            borderSide: BorderSide(
              color: Color(0xFFE2E8F0), // border-slate-200
              width: context.w(0.2),
            ),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(context.h(0.8)),
            borderSide: BorderSide(
              color: Color(0xFF0F172A), // ring / focus
              width: context.w(0.2),
            ),
          ),
        ),
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
