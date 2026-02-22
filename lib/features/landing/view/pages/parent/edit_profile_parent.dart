import 'package:flutter/material.dart';
import 'package:telmeeth/core/widgets/parent/features_app_bar.dart';
import 'package:telmeeth/core/widgets/phone_utils.dart';
import '../../../../../core/constants/responsive.dart';

class EditProfileParent extends StatefulWidget {
  final String altNumber, phone, email, address, location;
  const EditProfileParent({
    super.key,
    required this.altNumber,
    required this.phone,
    required this.email,
    required this.address,
    required this.location,
  });

  @override
  State<EditProfileParent> createState() => _EditProfileParentState();
}

class _EditProfileParentState extends State<EditProfileParent> {
  late TextEditingController altNumberCtrl;
  late TextEditingController phoneCtrl;
  late TextEditingController emailCtrl;
  late TextEditingController addressCtrl;
  late TextEditingController locationCtrl;

  @override
  void initState() {
    altNumberCtrl = TextEditingController(text: widget.altNumber);
    phoneCtrl = TextEditingController(text: widget.phone);
    emailCtrl = TextEditingController(text: widget.email);
    addressCtrl = TextEditingController(text: widget.address);
    locationCtrl = TextEditingController(text: widget.location);
    super.initState();
  }

  @override
  void dispose() {
    altNumberCtrl.dispose();
    phoneCtrl.dispose();
    emailCtrl.dispose();
    addressCtrl.dispose();
    locationCtrl.dispose();
    super.dispose();
  }

  void _updateProfile() {

    final normalizedAlt =
    PhoneUtils.normalize(altNumberCtrl.text);

    if (!PhoneUtils.isValid(normalizedAlt)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Alternate number must be 9 digits and start with 7"),
        ),
      );
      return;
    }

    Navigator.pop(context, {
      "altNumber": normalizedAlt,
      "phone": phoneCtrl.text,
      "email": emailCtrl.text,
      "address": addressCtrl.text,
      "location": locationCtrl.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    final primary = const Color(0xFFFF8C00);
    final primaryDark = const Color(0xFFE67600);

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
            children: [

              /// ===== HEADER CARD =====
              Container(
                padding: EdgeInsets.all(context.w(5)),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFF8C00), Color(0xFFE67600)],
                  ),
                  borderRadius: BorderRadius.circular(context.radius(25)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: context.shadowBlur(18),
                      offset: Offset(0, context.shadowOffsetY(6)),
                      color: primary.withOpacity(.35),
                    ),
                  ],
                ),

                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(context.w(3)),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: context.icon(26),
                      ),
                    ),
                    SizedBox(width: context.w(4)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Edit Profile",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: context.font(18),
                          ),
                        ),
                        SizedBox(height: context.h(0.5)),
                        Text(
                          "Update your information",
                          style: TextStyle(
                            color: Colors.white.withOpacity(.9),
                            fontSize: context.font(12),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              SizedBox(height: context.h(2.5)),

              /// ===== FORM CARD =====
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(context.w(5)),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(context.radius(22)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.06),
                        blurRadius: 18,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [

                        _editField("Alternate Number *", altNumberCtrl, "Required. Must start with 05..."),
                        _editField("Phone Number", phoneCtrl, "Saudi format: 05XXXXXXXX"),
                        _editField("Email", emailCtrl, ""),
                        _editField("Address", addressCtrl, "Max 255 characters"),
                        _editField("Location (URL)", locationCtrl, "Valid URL, max 255 chars"),

                        SizedBox(height: context.h(2.5)),

                        /// ===== BUTTONS =====
                        Row(
                          children: [

                            /// CANCEL
                            Expanded(
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: primary, width: 1.5),
                                  padding: EdgeInsets.symmetric(
                                    vertical: context.h(1.6),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(context.radius(16)),
                                  ),
                                ),
                                onPressed: () => Navigator.pop(context),
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: context.font(14),
                                    color: primary,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(width: context.w(3)),

                            /// UPDATE
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primary,
                                  elevation: 6,
                                  shadowColor: primary.withOpacity(.4),
                                  padding: EdgeInsets.symmetric(
                                    vertical: context.h(1.6),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(context.radius(16)),
                                  ),
                                ),
                                onPressed: _updateProfile,
                                child: Text(
                                  "Update Profile",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: context.font(14),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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

  Widget _editField(String label, TextEditingController controller, String hint) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.h(2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: context.font(14),
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: context.h(0.7)),
          TextField(
            controller: controller,
            style: TextStyle(fontSize: context.font(15)),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: context.h(1.3),
                horizontal: context.w(3),
              ),
              filled: true,
              fillColor: const Color(0xFFF9FAFB),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(context.radius(16)),
                borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(context.radius(16)),
                borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(context.radius(16)),
                borderSide: const BorderSide(
                  color: Color(0xFFF59E0B),
                  width: 1.5,
                ),
              ),
              hintText: hint,
              hintStyle: TextStyle(
                fontSize: context.font(13),
                color: Colors.grey[400],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
