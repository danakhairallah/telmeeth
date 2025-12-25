import 'package:flutter/material.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  bool showForm = false;

  void _openForm() => setState(() => showForm = true);
  void _closeForm() => setState(() => showForm = false);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    final double imageHeight = isMobile ? 340 : 420;
    final double imageWidth = isMobile ? double.infinity : 520;

    return Container(
      color: const Color(0xFFFEF8F2),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 32),
          Text(
            "FREQUENTLY ASKED QUESTIONS",
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
              fontSize: isMobile ? 11 : 13,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Have inquiries?\nReach out to us!",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? 25 : 30,
              height: 1.08,
            ),
          ),
          const SizedBox(height: 16),

          Center(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.asset(
                    'assets/abjadnmanara.jpg',
                    width: imageWidth,
                    height: imageHeight,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 5,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: ElevatedButton.icon(
                      onPressed: _openForm,
                      icon: const Icon(
                        Icons.mail_outline,
                        size: 17,
                        color: Colors.black87,
                      ),
                      label: const Text(
                        "Contact Us",
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(color: Colors.black),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                        minimumSize: const Size(92, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                  ),
                ),
                if (showForm)
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.98),
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.13),
                            blurRadius: 12,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          // فورم
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 18, 10, 10),
                            child: SingleChildScrollView(
                              child: _ContactForm(isMobile: isMobile),
                            ),
                          ),
                          // زر الإغلاق
                          Positioned(
                            right: 3,
                            top: -7,
                            child: IconButton(
                              icon: const Icon(Icons.close_rounded, color: Colors.black87, size: 22),
                              onPressed: _closeForm,
                              splashRadius: 18,
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 110),
        ],
      ),
    );
  }
}

class _ContactForm extends StatefulWidget {
  final bool isMobile;
  const _ContactForm({required this.isMobile});

  @override
  State<_ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<_ContactForm> {
  int focused = -1;

  void _onFocus(int idx) => setState(() => focused = idx);
  void _onUnfocus() => setState(() => focused = -1);

  @override
  Widget build(BuildContext context) {
    final isMobile = widget.isMobile;
    final double fontSize = isMobile ? 11.5 : 12.5;
    final double fieldPadding = isMobile ? 7 : 9;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: _ContactTextField(
                label: 'Name *',
                hint: 'Enter your name',
                fontSize: fontSize,
                fieldPadding: fieldPadding,
                focused: focused == 0,
                onFocus: () => _onFocus(0),
                onUnfocus: _onUnfocus,
              ),
            ),
            SizedBox(width: isMobile ? 10 : 18),
            Expanded(
              child: _ContactTextField(
                label: 'Email *',
                hint: 'Enter your email',
                fontSize: fontSize,
                fieldPadding: fieldPadding,
                focused: focused == 1,
                onFocus: () => _onFocus(1),
                onUnfocus: _onUnfocus,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        _ContactTextField(
          label: 'Phone',
          hint: 'Enter your number',
          fontSize: fontSize,
          fieldPadding: fieldPadding,
          focused: focused == 2,
          onFocus: () => _onFocus(2),
          onUnfocus: _onUnfocus,
        ),
        const SizedBox(height: 8),
        _ContactTextField(
          label: 'Message',
          hint: 'Enter your message',
          minLines: 2,
          maxLines: 3,
          fontSize: fontSize,
          fieldPadding: fieldPadding,
          focused: focused == 3,
          onFocus: () => _onFocus(3),
          onUnfocus: _onUnfocus,
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Checkbox(
              value: false,
              onChanged: (_) {},
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            Flexible(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: "I agree that my submitted data is being "),
                    TextSpan(
                      text: "collected and stored.",
                      style: TextStyle(color: Color(0xFFFF8C00)),
                    ),
                  ],
                ),
                style: TextStyle(fontSize: fontSize),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        SizedBox(
          width: isMobile ? double.infinity : 92,
          height: 32,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF8C00),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
              textStyle: TextStyle(fontSize: fontSize + 2, fontWeight: FontWeight.bold),
              elevation: 0,
            ),
            child: const Text("Send"),
          ),
        ),
      ],
    );
  }
}

class _ContactTextField extends StatelessWidget {
  final String label;
  final String hint;
  final int minLines;
  final int maxLines;
  final double fontSize;
  final double fieldPadding;
  final bool focused;
  final VoidCallback onFocus;
  final VoidCallback onUnfocus;

  const _ContactTextField({
    required this.label,
    required this.hint,
    this.minLines = 1,
    this.maxLines = 1,
    required this.fontSize,
    required this.fieldPadding,
    required this.focused,
    required this.onFocus,
    required this.onUnfocus,
  });

  @override
  Widget build(BuildContext context) {
    final focusNode = FocusNode();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        onFocus();
      } else {
        onUnfocus();
      }
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: fontSize,
            color: Colors.grey[800],
          ),
        ),
        TextField(
          minLines: minLines,
          maxLines: maxLines,
          focusNode: focusNode,
          style: TextStyle(fontSize: fontSize),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(fontSize: fontSize),
            filled: true,
            fillColor:  Colors.white38,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: focused ? Colors.black : Colors.grey.shade300,
                width: 1.2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300, width: 1.2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.black, width: 1.2),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: fieldPadding,
              vertical: fieldPadding,
            ),
          ),
        ),
      ],
    );
  }
}
