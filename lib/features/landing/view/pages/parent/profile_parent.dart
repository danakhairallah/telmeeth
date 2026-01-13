import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/parent/features_app_bar.dart';
import 'edit_profile_parent.dart'; // تأكد من الاستيراد الصحيح

class ProfileParent extends StatefulWidget {
  const ProfileParent({super.key});

  @override
  State<ProfileParent> createState() => _ProfileParentState();
}

class _ProfileParentState extends State<ProfileParent> {
  // المتغيرات اللي راح تعدلها
  String altNumber = "-";
  String phone = "0502345678";
  String email = "parent2@example.com";
  String address = "King Abdullah Street – Amman";
  String location = "https://maps.app.goo.gl/FCCZjfZh42cp914MA";

  @override
  Widget build(BuildContext context) {
    final Color mainColor =  Colors.black;

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

              /// ===== EDIT BUTTON =====
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () async {
                    // انتقل لصفحة التعديل وانتظر البيانات
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => EditProfileParent(
                          altNumber: altNumber,
                          phone: phone,
                          email: email,
                          address: address,
                          location: location,
                        ),
                      ),
                    );
                    if (result != null && result is Map) {
                      setState(() {
                        altNumber = result['altNumber'] ?? altNumber;
                        phone = result['phone'] ?? phone;
                        email = result['email'] ?? email;
                        address = result['address'] ?? address;
                        location = result['location'] ?? location;
                      });
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
                    child: Column(
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
                        _item(context, 'Alternate Number', altNumber),
                        _item(context, 'Phone Number', phone),
                        _item(context, 'Email', email),
                        _item(context, 'Address', address),
                        _item(context, 'Location (URL)', location, isLink: true),
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
