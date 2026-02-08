import 'package:flutter/material.dart';
import 'package:telmeeth/core/api/student/controllers/profile_controller.dart';
import 'package:telmeeth/core/api/student/model/request/update_profile_requect.dart';
import 'package:telmeeth/core/api/student/model/response/profile_data.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/student/student_features_app_bar.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController = TextEditingController();
  final TextEditingController _aiNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // جلب بيانات البروفايل عند فتح الصفحة
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileController>().getStudentProfile();
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    _aiNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: const StudentFeaturesAppBar(),
      body: Consumer<ProfileController>(
        builder: (context, controller, _) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final profile = controller.profileModel?.data;
          if (profile == null) {
            return const Center(child: Text("No profile data found"));
          }

          return SingleChildScrollView(
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
                      title: "Student Information",
                      child: _studentInfoSection(context, profile),
                    ),
                    _sectionCard(
                      context,
                      title: "Update Profile",
                      child: _updateProfileSection(context, controller),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
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
              "Profile",
              style: TextStyle(
                fontSize: context.w(7.2),
                fontWeight: FontWeight.bold,
                color: const Color(0xFF495C6E),
              ),
            ),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF7D4FF7),
              padding: EdgeInsets.symmetric(
                horizontal: context.w(3.1),
                vertical: context.h(0.8),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(context.h(0.9)),
              ),
            ),
            icon: Icon(
              Icons.auto_fix_high,
              color: Colors.white,
              size: context.w(4.3),
            ),
            label: Text(
              "Complete Profile",
              style: TextStyle(
                color: Colors.white,
                fontSize: context.w(3.3),
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {},
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

  Widget _studentInfoSection(BuildContext context, ProfileData student) {
    final items = [
      ["Name", student.nameAr ?? "-"],
      ["Email", student.email ?? "-"],
      ["Phone", student.phone ?? "-"],
      ["Gender", student.gender ?? "-"],
    ];

    return Column(
      children: [
        for (int i = 0; i < items.length; i++) ...[
          _infoRow(items[i][0], items[i][1], context),
          if (i != items.length - 1)
            Divider(
              color: Colors.grey[200],
              thickness: context.h(0.12),
              height: context.h(0.6),
            ),
        ],
      ],
    );
  }

  Widget _updateProfileSection(
      BuildContext context, ProfileController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("New Password (optional)", style: _labelStyle),
        SizedBox(height: context.h(0.6)),
        _CustomTextField(
          controller: _passwordController,
          hintText: "Enter new password",
          obscure: true,
          hintColor: Colors.grey.shade400,
        ),
        SizedBox(height: context.h(1.4)),
        const Text("Confirm Password (optional)", style: _labelStyle),
        SizedBox(height: context.h(0.6)),
        _CustomTextField(
          controller: _passwordConfirmController,
          hintText: "Confirm new password",
          obscure: true,
          hintColor: Colors.grey.shade400,
        ),
        SizedBox(height: context.h(1.4)),
        const Text("AI Assistant Name", style: _labelStyle),
        SizedBox(height: context.h(0.6)),
        _CustomTextField(
          controller: _aiNameController,
          hintText: "AI-Mohammed",
          textColor: Colors.black,
          hintColor: Colors.black,
        ),
        SizedBox(height: context.h(1.6)),
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
              final request = UpdateProfileRequest(
                password: _passwordController.text,
                passwordConfirmation: _passwordConfirmController.text,
                aiName: _aiNameController.text,
              );

              await controller.updateProfile(request);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Profile updated successfully")),
              );
            },
            child: Text(
              "Update Profile",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: context.w(3.5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ================= INFO ROW =================
Widget _infoRow(String label, String value, BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: context.h(0.4)),
    child: Row(
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: const Color(0xFF495C6E),
            fontSize: context.w(3.4),
          ),
        ),
        SizedBox(width: context.w(2.1)),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: context.w(3.4),
              color: Colors.grey[500],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    ),
  );
}

// ================= CUSTOM TEXT FIELD =================
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
