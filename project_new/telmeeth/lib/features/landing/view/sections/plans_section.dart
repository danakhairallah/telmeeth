import 'package:flutter/material.dart';

class PlansSection extends StatelessWidget {
  const PlansSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Container(
      color: const Color(0xFFFEF8F2),
      padding: EdgeInsets.symmetric(vertical: isMobile ? 20 : 72, horizontal: 16),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'PLANS FOR EVERY SCHOOL',
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.w600,
              letterSpacing: 2.2,
              fontSize: isMobile ? 13 : 15,
            ),
          ),
          const SizedBox(height: 13),
          Text(
            'Choose the perfect\noption for your goals',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? 28 : 48,
              height: 1.09,
              letterSpacing: 0.1,
            ),
          ),
          const SizedBox(height: 54),
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
                  SizedBox(width: isMobile ? 0 : 22, height: isMobile ? 22 : 0),
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
                  SizedBox(width: isMobile ? 0 : 22, height: isMobile ? 22 : 0),
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
      margin: EdgeInsets.symmetric(horizontal: isMobile ? 0 : 6, vertical: isMobile ? 6 : 0),
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 12 : 10, vertical: isMobile ? 16 : 22),
      decoration: BoxDecoration(
        color: highlight ? const Color(0xFF8179C9) : Colors.white,
        borderRadius: BorderRadius.circular(28),
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
              fontSize: isMobile ? 15 : 16,
              fontWeight: FontWeight.bold,
              color: highlight ? Colors.white : Colors.grey[700],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$',
                style: TextStyle(
                  fontSize: isMobile ? 17 : 17,
                  color: highlight ? Colors.white70 : Colors.grey[400],
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 2),
              Text(
                price,
                style: TextStyle(
                  fontSize: isMobile ? 26 : 28,
                  color: highlight ? Colors.white : Colors.black87,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.3,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            '/ per year',
            style: TextStyle(
              color: highlight ? Colors.white70 : Colors.grey[400],
              fontSize: isMobile ? 10 : 12,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: highlight ? Colors.white : Colors.black54,
              fontSize: isMobile ? 10.5 : 12,
            ),
          ),
          const SizedBox(height: 18),
          Divider(
            height: 20,
            color: highlight ? Colors.white24 : Colors.grey.shade300,
            thickness: 1,
            indent: 5,
            endIndent: 5,
          ),
          const SizedBox(height: 12),
          // زر الاشتراك/التواصل
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                foregroundColor: buttonTextColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                padding: EdgeInsets.symmetric(vertical: isMobile ? 10 : 11),
                elevation: 0,
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? 12 : 13,
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
