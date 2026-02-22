import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/teacher/controllers/profile_teacher_controller.dart';
import 'package:telmeeth/core/api/teacher/model/request/update_profile_teacher_request.dart';
import 'package:telmeeth/core/constants/responsive_value.dart';

class ProfilePageTeacher extends StatefulWidget {
  const ProfilePageTeacher({super.key});

  @override
  State<ProfilePageTeacher> createState() => _ProfilePageTeacherState();
}

class _ProfilePageTeacherState extends State<ProfilePageTeacher> {
  bool showEditForm = false;

  // كنترولرز للفورم
  final _formKey = GlobalKey<FormState>();
  final nameArController = TextEditingController();
  final nameEnController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<ProfileTeacherController>().getProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0.7,
      ),
      backgroundColor: const Color(0xFFF8F3EE),
      body: Consumer<ProfileTeacherController>(
        builder: (context, ctrl, _) {
          if (ctrl.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          final data = ctrl.profileModel?.data?.teacherProfile;
          if (data == null) {
            return const Center(child: Text("Not Found"));
          }

          // ===== فورم التعديل =====
          if (showEditForm) {
            nameArController.text = data.nameAr ?? '';
            nameEnController.text = data.nameEn ?? '';
            phoneController.text = data.phoneNumber ?? '';
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(ResponsiveValues.w(context, 4)),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    constraints: const BoxConstraints(maxWidth: 450),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.orange.withOpacity(0.10),
                          blurRadius: 16,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Edit Profile",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: ResponsiveValues.font(context, 20),
                              color: const Color(0xFF39566C),
                            ),
                          ),
                          SizedBox(height: ResponsiveValues.h(context, 2)),
                          _styledFormField(
                            label: "Name ar",
                            controller: nameArController,
                            icon: Icons.person,
                          ),
                          _styledFormField(
                            label: "Name en",
                            controller: nameEnController,
                            icon: Icons.person_outline,
                          ),
                          _styledFormField(
                            label: "Number",
                            controller: phoneController,
                            icon: Icons.phone,
                            keyboardType: TextInputType.phone,
                          ),
                          SizedBox(height: ResponsiveValues.h(context, 2)),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFFFA962),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 14),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  await context.read<ProfileTeacherController>().updateProfile(
                                    UpdateProfileTeacherRequest(
                                      nameAr: nameArController.text,
                                      nameEn: nameEnController.text,
                                      phoneNumber: phoneController.text,
                                    ),
                                  );
                                  setState(() {
                                    showEditForm = false;
                                  });
                                  await context.read<ProfileTeacherController>().getProfile();
                                }
                              },
                              child: const Text("Save Edit", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                showEditForm = false;
                              });
                            },
                            child: const Text("Cancel", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }

          // ===== ديزاين العرض فقط =====
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(ResponsiveValues.w(context, 4)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // صورة شخصية كبيرة مع ظل
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.orange.withOpacity(0.15),
                          blurRadius: 18,
                          offset: const Offset(0, 6),
                        )
                      ],
                    ),
                    child: CircleAvatar(
                      radius: ResponsiveValues.w(context, 13),
                      backgroundColor: Colors.orange.shade50,
                      child: Icon(Icons.person, size: ResponsiveValues.icon(context, 45), color: Colors.orange),
                    ),
                  ),
                  SizedBox(height: ResponsiveValues.h(context, 2.5)),

                  // اسم بارز (أساسي)
                  Text(
                    data.nameAr ?? '-',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: ResponsiveValues.font(context, 18),
                      color: const Color(0xFF39566C),
                    ),
                  ),
                  // إيميل معلم
                  Padding(
                    padding: EdgeInsets.only(top: ResponsiveValues.h(context, 0.7)),
                    child: Text(
                      data.email ?? '-',
                      style: TextStyle(
                        fontSize: ResponsiveValues.font(context, 13),
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  SizedBox(height: ResponsiveValues.h(context, 2.5)),

                  // بيانات داخل كروت
                  _infoCard(Icons.person_outline, "Name en", data.nameEn),
                  _infoCard(Icons.phone, "Number", data.phoneNumber),
                  // أضف هنا معلومات إضافية لو أردت

                  SizedBox(height: ResponsiveValues.h(context, 3)),

                  // زر تعديل بارز
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.edit, color: Colors.white),
                      label: const Text("Edit Profile", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      onPressed: () {
                        setState(() {
                          showEditForm = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFA962),
                        padding: EdgeInsets.symmetric(vertical: ResponsiveValues.h(context, 1.4)),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(ResponsiveValues.h(context, 1.3)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // كارت معلومات أنيق
  Widget _infoCard(IconData icon, String label, String? value) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: ResponsiveValues.h(context, 0.8)),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.orange, size: 25),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              value ?? '-',
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 10, color: Colors.blueGrey),
          ),
        ],
      ),
    );
  }

  // فورم Styled مع أيقونة
  Widget _styledFormField({
    required String label,
    required TextEditingController controller,
    IconData? icon,
    TextInputType? keyboardType,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: (v) => (v == null || v.isEmpty) ? "مطلوب" : null,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: icon != null ? Icon(icon, color: Colors.orange) : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.orangeAccent),
          ),
          filled: true,
          fillColor: const Color(0xFFF9F6F1),
          contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
        ),
      ),
    );
  }
}
