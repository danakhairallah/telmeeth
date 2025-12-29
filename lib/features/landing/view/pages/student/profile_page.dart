import 'package:flutter/material.dart';
import 'package:telmeeth/core/widgets/student/student_app_bar.dart';
import 'package:telmeeth/core/widgets/student_bottom_nav_bar.dart';
import 'package:telmeeth/features/landing/view/pages/student/tasks_page.dart';

import '../../../../../core/widgets/student/navigation.dart';
import '../../../../../core/widgets/student/student_drawer.dart';
import 'home1_page.dart';
import 'materials_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: StudentAppBar(),
      drawer: StudentDrawer(),
      bottomNavigationBar: NavigationBarPrimary(),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _header(),
                const SizedBox(height: 14),
                _sectionCard(
                  title: "Student Information",
                  child: _studentInfoSection(),
                ),
                _sectionCard(
                  title: "Update Profile",
                  child: _updateProfileSection(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 6),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              "Profile",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFF495C6E),
              ),
            ),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF7D4FF7),
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9),
              ),
              elevation: 4,
            ),
            icon: const Icon(
              Icons.auto_fix_high,
              color: Colors.white,
              size: 18,
            ),
            label: const Text(
              "Complete Profile",
              style: TextStyle(
                color: Colors.white,
                fontSize: 13.7,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _sectionCard({required String title, required Widget child}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
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
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF495C6E),
            ),
          ),
          const SizedBox(height: 7),
          child,
        ],
      ),
    );
  }

  Widget _studentInfoSection() {
    // البيانات مع Divider رمادي فاتح بينهم
    final items = [
      ["Name", "Mohammed Ahmed Ali"],
      ["Email", "student1@example.com"],
      ["Phone", "0501111111"],
      ["Gender", "male"],
    ];
    return Column(
      children: [
        for (int i = 0; i < items.length; i++) ...[
          _infoRow(items[i][0], items[i][1]),
          if (i != items.length - 1)
            Divider(color: Colors.grey[200], thickness: 1.2, height: 6),
        ],
      ],
    );
  }

  Widget _updateProfileSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("New Password (optional)", style: _labelStyle),
        const SizedBox(height: 6),
        _CustomTextField(
          hintText: "Enter new password",
          obscure: true,
          hintColor: Colors.grey.shade400,
        ),
        const SizedBox(height: 13),
        const Text("AI Assistant Name", style: _labelStyle),
        const SizedBox(height: 6),
        _CustomTextField(
          hintText: "AI-Mohammed",
          textColor: Colors.black,
          hintColor: Colors.black,
        ),
        const SizedBox(height: 15),
        SizedBox(
          width: 140,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF7818),
              padding: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {},
            child: const Text(
              "Update Profile",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 14.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

const _labelStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 13.5,
  color: Color(0xFF495C6E),
);

Widget _infoRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF495C6E),
            fontSize: 14,
          ),
        ),
        const SizedBox(width: 9),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    ),
  );
}

/// Custom text field with style
class _CustomTextField extends StatefulWidget {
  final String hintText;
  final Color? textColor;
  final Color hintColor;
  final bool obscure;

  const _CustomTextField({
    required this.hintText,
    this.textColor,
    required this.hintColor,
    this.obscure = false,
  });

  @override
  State<_CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<_CustomTextField> {
  bool _isWriting = false;
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      obscureText: widget.obscure,
      style: TextStyle(
        color:
            widget.textColor ?? (_isWriting ? Colors.black : widget.hintColor),
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        filled: true,
        fillColor: const Color(0xFFF5F5F5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        hintStyle: TextStyle(
          color: widget.hintColor,
          fontWeight: FontWeight.w500,
          fontSize: 13,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 11,
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
