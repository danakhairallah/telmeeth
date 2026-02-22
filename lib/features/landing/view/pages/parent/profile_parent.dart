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
    print("📱 PROFILE PAGE INIT");
    Future.microtask(() {
      print("📡 CALLING getParentProfile()");
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

              /// ===== TITLE =====
              /// ===== HEADER CARD =====
              Container(
                padding: EdgeInsets.all(context.w(5)),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFFF8C00),
                      Color(0xFFE67600),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(context.radius(25)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: context.shadowBlur(18),
                      offset: Offset(0, context.shadowOffsetY(6)),
                      color: const Color(0xFFF59E0B).withOpacity(0.35),
                    ),
                  ],
                ),
                child: Row(
                  children: [

                    /// ICON
                    Container(
                      padding: EdgeInsets.all(context.w(3)),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.person_outline,
                        color: Colors.white,
                        size: context.icon(28),
                      ),
                    ),

                    SizedBox(width: context.w(4)),

                    /// TEXT
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Profile",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: context.font(18),
                            ),
                          ),
                          SizedBox(height: context.h(0.5)),
                          Text(
                            "Manage your contact and account information",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: context.font(12),
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// 🔥 EDIT CHIP BUTTON
                    GestureDetector(
                      onTap: () async {
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

                        if (result != null && result is Map) {
                          await controller.updateParentProfile(
                            ProfileParentUpdateRequest(
                              email: result['email'],
                              address: result['address'],
                              location: result['location'],
                              alternateNumber: result['altNumber'],
                            ),
                          );

                          await controller.getParentProfile();
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.w(3.5),
                          vertical: context.h(1),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(context.radius(30)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.15),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.edit,
                              color: const Color(0xFFF59E0B),
                              size: context.icon(16),
                            ),
                            SizedBox(width: context.w(1.5)),
                            Text(
                              "Edit",
                              style: TextStyle(
                                color: const Color(0xFFF59E0B),
                                fontWeight: FontWeight.bold,
                                fontSize: context.font(13),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: context.h(2)),


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
                    borderRadius: BorderRadius.circular(context.radius(22)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 18,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: data == null
                        ? Center(
                      child: Text(
                        "No Data Available",
                        style: TextStyle(
                          fontSize: context.font(14),
                          color: Colors.grey,
                        ),
                      ),
                    )
                        : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _styledItem(context, 'Alternate Number', data.alternateNumber ?? "-"),
                        _styledItem(context, 'Phone Number', data.phoneNumber ?? "-"),
                        _styledItem(context, 'Email', data.email ?? "-"),
                        _styledItem(context, 'Address', data.address ?? "-"),
                        _styledItem(context, 'Location (URL)', data.location ?? "-", isLink: true),
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

  Widget _styledItem(
      BuildContext context,
      String title,
      String value, {
        bool isLink = false,
      }) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.h(1.8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: context.font(13),
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: context.h(0.6)),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: context.w(3),
              vertical: context.h(1.4),
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFF9FAFB),
              borderRadius: BorderRadius.circular(context.radius(14)),
              border: Border.all(color: const Color(0xFFE5E7EB)),
            ),
            child: Text(
              value,
              style: TextStyle(
                fontSize: context.font(15),
                color: isLink ? const Color(0xFFF59E0B) : Colors.black87,
                decoration: isLink ? TextDecoration.underline : null,
              ),
            ),
          ),
        ],
      ),
    );
  }

}
