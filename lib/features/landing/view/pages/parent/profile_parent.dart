import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/parent/controllers/parent_profile_controller.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/parent/features_app_bar.dart';
import 'edit_profile_parent.dart';
import 'package:telmeeth/core/api/parent/model/request/profile_parent_update_request.dart';

class ProfileParent extends StatefulWidget {
  const ProfileParent({super.key});

  @override
  State<ProfileParent> createState() => _ProfileParentState();
}

class _ProfileParentState extends State<ProfileParent> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<ProfileParentController>(
        context,
        listen: false,
      ).getParentProfile();
    });
  }
  Widget build(BuildContext context) {
    final Color mainColor =  Colors.black;
    final controller = Provider.of<ProfileParentController>(context);

    if (controller.isLoading) {
      return Scaffold(
        appBar: FeaturesAppBar(),
        body: const Center(child: CircularProgressIndicator()),
      );
    }
    if (controller.errorMessage != null) {
      return Scaffold(
        appBar: FeaturesAppBar(),
        body: Center(child: Text(controller.errorMessage!)),
      );
    }
    final data = controller.parentProfile?.data;

    return Scaffold(
      appBar: FeaturesAppBar(),
      backgroundColor: const Color(0xFFF8FAFB),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.w(5),
            vertical: context.h(2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Profile',
                style: TextStyle(
                  fontSize: context.font(22),
                  fontWeight: FontWeight.bold,
                  color: mainColor,
                ),
              ),
              SizedBox(height: context.h(0.8)),
              Text(
                'Manage your contact and account information',
                style: TextStyle(
                  fontSize: context.font(14),
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: context.h(2)),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () async {
                    if (data == null) return;
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => EditProfileParent(
                          altNumber: data.alternateNumber ?? "",
                          phone: data.phoneNumber ?? "",
                          email: data.email ?? "",
                          address: data.address ?? "",
                          location: data.location ?? "",
                        ),
                      ),
                    );
                    // عند الرجوع من صفحة التعديل
                    if (result != null && result is Map) {
                      // اعمل تحديث للبيانات
                      await controller.updateParentProfile(
                        ProfileParentUpdateRequest(
                          email: result['email'],
                          address: result['address'],
                          location: result['location'],
                          alternateNumber: result['altNumber'],
                        ),
                      );
                      // أعد تحميل البروفايل من جديد بعد التحديث
                      await controller.getParentProfile();

                      // خيار: إظهار إشعار نجاح
                      if (context.mounted && controller.updateResponse?.success == true) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('تم تحديث الملف بنجاح!')),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF59E0B),
                    padding: EdgeInsets.symmetric(
                      horizontal: context.w(6),
                      vertical: context.h(1.6),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(context.radius(18)),
                    ),
                  ),
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(
                      fontSize: context.font(15),
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: context.h(2)),
              /// ===== PROFILE CARD =====
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: context.w(5),
                    vertical: context.h(2.5),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(context.radius(18)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: data == null
                        ? Center(child: Text("No Data Available"))
                        : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Profile Information',
                          style: TextStyle(
                            fontSize: context.font(17),
                            fontWeight: FontWeight.bold,
                            color: mainColor,
                          ),
                        ),
                        SizedBox(height: context.h(1.5)),
                        _item(context, 'Alternate Number', data.alternateNumber ?? "-"),
                        _item(context, 'Phone Number', data.phoneNumber ?? "-"),
                        _item(context, 'Email', data.email ?? "-"),
                        _item(context, 'Address', data.address ?? "-"),
                        _item(context, 'Location (URL)', data.location ?? "-", isLink: true),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _item(
      BuildContext context,
      String title,
      String value, {
        bool isLink = false,
      }) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.h(1.4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: context.font(14),
              fontWeight: FontWeight.w600,
              color:  Colors.black,
            ),
          ),
          SizedBox(height: context.h(0.4)),
          Text(
            value,
            style: TextStyle(
              fontSize: context.font(15),
              color: isLink ? Colors.blue : Colors.black87,
              decoration: isLink ? TextDecoration.underline : null,
            ),
          ),
        ],
      ),
    );
  }
}
