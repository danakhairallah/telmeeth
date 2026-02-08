import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive.dart';

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
    final double imageHeight = isMobile ? context.h(37.1) : context.h(45.9);
    final double imageWidth = isMobile ? MediaQuery.sizeOf(context).width : context.w(126.5);

    return Container(
      color: const Color(0xFFFEF8F2),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: context.h(3.5)),
          Text(
            "FREQUENTLY ASKED QUESTIONS",
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.w700,
              letterSpacing: context.w(0.4),
              fontSize: isMobile ? context.w(2.6) : context.w(3.1),
            ),
          ),
          SizedBox(height: context.h(0.8)),
          Text(
            "Have inquiries?\nReach out to us!",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? context.w(6) : context.w(7.2),
              height: 1.08,
            ),
          ),
          SizedBox(height: context.h(1.7)),

          Center(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(context.h(4.3)),
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
                      icon: Icon(
                        Icons.mail_outline,
                        size: context.w(4.1),
                        color: Colors.black87,
                      ),
                      label: Text(
                        "Contact Us",
                        style: TextStyle(
                          fontSize: context.w(2.6),
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(context.h(2.1)),
                          side: BorderSide(color: Colors.black),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: context.w(3.4), vertical: context.h(0.7)),
                        minimumSize: Size( context.w(22.3), 0),
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
                        borderRadius: BorderRadius.circular(context.h(4.3)),
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
                            padding: EdgeInsets.fromLTRB(context.w(5.4), context.h(4), context.w(5.4), context.h(4)),
                            child: SingleChildScrollView(
                              child: _ContactForm(isMobile: isMobile),
                            ),
                          ),
                          // زر الإغلاق
                          Positioned(
                            right: context.w(0.7),
                            top: context.h(-0.7),
                            child: IconButton(
                              icon: Icon(Icons.close_rounded, color: Colors.black87, size: context.w(5.3)),
                              onPressed: _closeForm,
                              splashRadius: context.h(1.9),
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
          SizedBox(height: context.h(12)),
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
    final double fontSize = isMobile ? context.w(2.7) : context.w(3);
    final double fieldPadding = isMobile ? context.w(1.7) : context.w(2.1);

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
            SizedBox(width: isMobile ? context.w(10.4) : context.w(4.3)),
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
        SizedBox(height: context.h(0.8)),
        _ContactTextField(
          label: 'Phone',
          hint: 'Enter your number',
          fontSize: fontSize,
          fieldPadding: fieldPadding,
          focused: focused == 2,
          onFocus: () => _onFocus(2),
          onUnfocus: _onUnfocus,
        ),
        SizedBox(height: context.h(0.8)),
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
        SizedBox(height: context.h(0.5)),
        Row(
          children: [
            Checkbox(
              value: false,
              onChanged: (_) {},
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(context.h(0.5))),
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
        SizedBox(height: context.h(0.4)),
        SizedBox(
          width: isMobile ? MediaQuery.sizeOf(context).width : context.w(22.3),
          height: context.h(3.5),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF8C00),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(context.h(1.4)),
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
              borderRadius: BorderRadius.circular(context.h(1.3)),
              borderSide: BorderSide(
                color: focused ? Colors.black : Colors.grey.shade300,
                width: context.w(0.29),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(context.h(1.3)),
              borderSide: BorderSide(color: Colors.grey.shade300, width: context.w(0.2)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(context.h(1.3)),
              borderSide: BorderSide(color: Colors.black, width: context.w(0.2)),
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
