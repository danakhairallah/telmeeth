import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive.dart';

class PlansSection extends StatelessWidget {
  const PlansSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Container(
      color: const Color(0xFFFEF8F2),
      padding: EdgeInsets.symmetric(vertical: isMobile ? context.h(2.1) : context.h(7.8), horizontal: context.w(3.8)),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'PLANS FOR EVERY SCHOOL',
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.w600,
              letterSpacing: context.w(0.5),
              fontSize: isMobile ? context.w(3.1) : context.w(3.6),
            ),
          ),
          SizedBox(height: context.h(1.4)),
          Text(
            'Choose the perfect\noption for your goals',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? context.w(6.8) : context.w(11.6),
              height: context.h(0.11),
              letterSpacing: context.w(0.02),
            ),
          ),
          SizedBox(height: context.h(5.9)),
          // الباقات الثلاث
          LayoutBuilder(
            builder: (context, constraints) {
              return Flex(
                direction: isMobile ? Axis.vertical : Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // باقة Essential
                  Expanded(
                    flex: isMobile ? 0 : 1,
                    child: _PricingCard(
                      title: 'Essential',
                      price: '2500',
                      description: 'Group sessions with expert teachers',
                      highlight: false,
                      buttonText: 'Join Now',
                      buttonColor: Colors.grey.shade100,
                      buttonTextColor: Colors.black87,
                    ),
                  ),
                  SizedBox(width: isMobile ? 0 : context.w(5.3), height: isMobile ? context.h(2.4) : 0),
                  // Professional (المميزة)
                  Expanded(
                    flex: isMobile ? 0 : 1,
                    child: _PricingCard(
                      title: 'Professional',
                      price: '3800',
                      description: 'Business lessons and flexible timing',
                      highlight: true, // هايلايت بنفسجي
                      buttonText: 'Get Started',
                      buttonColor: const Color(0xFFFF8C00),
                      buttonTextColor: Colors.white,
                    ),
                  ),
                  SizedBox(width: isMobile ? 0 : context.w(5.3), height: isMobile ? context.h(2.4) : 0),
                  // Enterprise
                  Expanded(
                    flex: isMobile ? 0 : 1,
                    child: _PricingCard(
                      title: 'Enterprise',
                      price: '5000',
                      description: 'Tailored training for groups large or small',
                      highlight: false,
                      buttonText: 'Contact Us',
                      buttonColor: Colors.grey.shade100,
                      buttonTextColor: Colors.black87,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _PricingCard extends StatelessWidget {
  final String title;
  final String price;
  final String description;
  final bool highlight;
  final String buttonText;
  final Color buttonColor;
  final Color buttonTextColor;

  const _PricingCard({
    required this.title,
    required this.price,
    required this.description,
    required this.highlight,
    required this.buttonText,
    required this.buttonColor,
    required this.buttonTextColor,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: isMobile ? 0 : context.w(1.4), vertical: isMobile ? context.h(0.6) : 0),
      padding: EdgeInsets.symmetric(horizontal: isMobile ? context.w(2.9) : context.w(2.4), vertical: isMobile ? context.h(1.7) : context.h(2.4)),
      decoration: BoxDecoration(
        color: highlight ? const Color(0xFF8179C9) : Colors.white,
        borderRadius: BorderRadius.circular(context.h(3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: isMobile ? context.w(3.6) : context.w(3.8),
              fontWeight: FontWeight.bold,
              color: highlight ? Colors.white : Colors.grey[700],
            ),
          ),
          SizedBox(height: context.h(1.3)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$',
                style: TextStyle(
                  fontSize: isMobile ? context.w(4.1) : context.w(4.1),
                  color: highlight ? Colors.white70 : Colors.grey[400],
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: context.w(0.4)),
              Text(
                price,
                style: TextStyle(
                  fontSize: isMobile ? context.w(6.3) : context.w(6.8),
                  color: highlight ? Colors.white : Colors.black87,
                  fontWeight: FontWeight.bold,
                  letterSpacing: context.w(0.07),
                ),
              ),
            ],
          ),
          SizedBox(height: context.h(0.6)),
          Text(
            '/ per year',
            style: TextStyle(
              color: highlight ? Colors.white70 : Colors.grey[400],
              fontSize: isMobile ? context.w(2.4) : context.w(2.9),
            ),
          ),
          SizedBox(height: context.h(1.5)),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: highlight ? Colors.white : Colors.black54,
              fontSize: isMobile ? context.w(2.5) : context.w(2.9),
            ),
          ),
          SizedBox(height: context.h(1.9)),
          Divider(
            height: context.h(2.1),
            color: highlight ? Colors.white24 : Colors.grey.shade300,
            thickness: context.h(0.1),
            indent: 5,
            endIndent: 5,
          ),
          SizedBox(height: context.h(1.3)),
          // زر الاشتراك/التواصل
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                foregroundColor: buttonTextColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(context.h(1.5)),
                ),
                padding: EdgeInsets.symmetric(vertical: isMobile ? context.h(10) : context.h(1.2)),
                elevation: 0,
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? context.w(2.9) : context.w(3.1),
                ),
              ),
              onPressed: () {}, // هنا ضع الأكشن المناسب
              child: Text(buttonText),
            ),
          ),
        ],
      ),
    );
  }
}
