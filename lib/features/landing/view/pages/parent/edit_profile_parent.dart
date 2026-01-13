import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    Navigator.pop(context, {
      "altNumber": altNumberCtrl.text,
      "phone": phoneCtrl.text,
      "email": emailCtrl.text,
      "address": addressCtrl.text,
      "location": locationCtrl.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    final mainColor =  Colors.black;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: mainColor),
        title: Text(
          "Edit Profile",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: context.font(22),
            color: mainColor,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFF8FAFB),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.w(5), vertical: context.h(2)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _editField("Alternate Number *", altNumberCtrl, "Required. Must start with 05..."),
                _editField("Phone Number", phoneCtrl, "Saudi format: 05XXXXXXXX"),
                _editField("Email", emailCtrl, ""),
                _editField("Address", addressCtrl, "Max 255 characters"),
                _editField("Location (URL)", locationCtrl, "Valid URL, max 255 chars"),
                SizedBox(height: context.h(3)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF59E0B),
                        padding: EdgeInsets.symmetric(
                          horizontal: context.w(6),
                          vertical: context.h(1.6),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(context.radius(14)),
                        ),
                      ),
                      onPressed: _updateProfile,
                      child: Text(
                        "Update Profile",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: context.font(15),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: context.w(2)),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: mainColor, width: 1.2),
                        padding: EdgeInsets.symmetric(
                          horizontal: context.w(6),
                          vertical: context.h(1.6),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(context.radius(14)),
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: context.font(15),
                          color: mainColor,
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
    );
  }

  Widget _editField(String label, TextEditingController controller, String hint) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.h(1.7)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: context.font(15)),
          ),
          SizedBox(height: context.h(0.7)),
          TextField(
            controller: controller,
            style: TextStyle(fontSize: context.font(15)),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: context.h(1.1), horizontal: context.w(2)),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(context.radius(14)),
                borderSide: BorderSide(color: Colors.grey[400]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(context.radius(14)),
                borderSide: BorderSide(color: Colors.grey[400]!),
              ),
              hintText: hint,
              hintStyle: TextStyle(fontSize: context.font(14), color: Colors.grey[500]),
            ),
          ),
        ],
      ),
    );
  }
}
