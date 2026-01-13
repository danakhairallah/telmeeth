import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/student/drawer.dart';
import 'package:telmeeth/core/widgets/student/navigation.dart';
import 'package:telmeeth/core/widgets/student/student_app_bar.dart';
import 'package:telmeeth/core/widgets/student/student_features_app_bar.dart';

class CompleteProfilePage extends StatefulWidget {
  const CompleteProfilePage({super.key});

  @override
  State<CompleteProfilePage> createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _aiNameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _aiNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: const StudentFeaturesAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: context.w(2.9),
          vertical: context.h(1.7),
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: context.w(102.1)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _header(context),
                SizedBox(height: context.h(1.5)),
                _sectionCard(
                  context,
                  title: "Basic Information",
                  child: _basicInfoSection(context),
                ),
                _sectionCard(
                  context,
                  title: "AI Assistant Name",
                  child: _aiSection(context),
                ),
                SizedBox(height: context.h(1.5)),
                SizedBox(
                  width: context.w(34),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF7818),
                      padding: EdgeInsets.symmetric(vertical: context.h(1)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(context.h(0.8)),
                      ),
                    ),
                    onPressed: () async {
                      // هنا ممكن تضيف إرسال البيانات للسيرفر
                      if (_nameController.text.isEmpty ||
                          _emailController.text.isEmpty ||
                          _phoneController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Please fill all required fields")),
                        );
                        return;
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Profile completed successfully")),
                      );
                    },
                    child: Text(
                      "Complete Profile",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: context.w(3.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.h(1), bottom: context.h(0.6)),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "Complete Profile",
              style: TextStyle(
                fontSize: context.w(7.2),
                fontWeight: FontWeight.bold,
                color: const Color(0xFF495C6E),
              ),
            ),
          ),
          Icon(
            Icons.check_circle_outline,
            color: const Color(0xFF7D4FF7),
            size: context.w(6),
          ),
        ],
      ),
    );
  }

  Widget _sectionCard(BuildContext context,
      {required String title, required Widget child}) {
    return Container(
      margin: EdgeInsets.only(bottom: context.h(1.5)),
      padding: EdgeInsets.all(context.w(3.8)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(context.h(1.5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 13,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: context.w(4.3),
              fontWeight: FontWeight.w600,
              color: const Color(0xFF495C6E),
            ),
          ),
          SizedBox(height: context.h(0.7)),
          child,
        ],
      ),
    );
  }

  Widget _basicInfoSection(BuildContext context) {
    return Column(
      children: [
        _CustomTextField(
          controller: _nameController,
          hintText: "Enter your full name",
          hintColor: Colors.grey.shade400,
        ),
        SizedBox(height: context.h(1.4)),
        _CustomTextField(
          controller: _emailController,
          hintText: "Enter your email",
          hintColor: Colors.grey.shade400,
        ),
        SizedBox(height: context.h(1.4)),
        _CustomTextField(
          controller: _phoneController,
          hintText: "Enter your phone number",
          hintColor: Colors.grey.shade400,
        ),
      ],
    );
  }

  Widget _aiSection(BuildContext context) {
    return Column(
      children: [
        _CustomTextField(
          controller: _aiNameController,
          hintText: "AI-Mohammed",
          hintColor: Colors.black,
        ),
      ],
    );
  }
}

class _CustomTextField extends StatefulWidget {
  final String hintText;
  final Color? textColor;
  final Color hintColor;
  final bool obscure;
  final TextEditingController? controller;

  const _CustomTextField({
    required this.hintText,
    this.textColor,
    required this.hintColor,
    this.obscure = false,
    this.controller,
  });

  @override
  State<_CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<_CustomTextField> {
  bool _isWriting = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.obscure,
      style: TextStyle(
        color: widget.textColor ?? (_isWriting ? Colors.black : widget.hintColor),
        fontWeight: FontWeight.w500,
        fontSize: context.w(3.4),
      ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        filled: true,
        fillColor: const Color(0xFFF5F5F5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(context.h(0.8)),
          borderSide: BorderSide.none,
        ),
        hintStyle: TextStyle(
          color: widget.hintColor,
          fontWeight: FontWeight.w500,
          fontSize: context.w(3.1),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: context.w(2.9),
          vertical: context.h(1.2),
        ),
      ),
      onChanged: (val) {
        setState(() {
          _isWriting = val.isNotEmpty;
        });
      },
    );
  }
}

const _labelStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 13.5,
  color: Color(0xFF495C6E),
);

