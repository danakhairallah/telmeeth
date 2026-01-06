import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive.dart';

class OurImpactPage extends StatelessWidget {
  const OurImpactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    final people = [
      {
        "avatar": "assets/teacher1.png",
        "name": "Layla Hassan",
        "role": "Mathematics Teacher",
        "school": "Al-Noor International School",
        "city": "Dubai, UAE",
        "quote": "Telmeeth has transformed how I connect with my students. The AI tools help me personalize lessons and track progress effortlessly.",
        "impact": "Improved class average by 23%",
      },
      {
        "avatar": "assets/principal1.png",
        "name": "Omar Khalil",
        "role": "School Principal",
        "school": "Jordan Modern Academy",
        "city": "Amman, Jordan",
        "quote": "Our entire school community is now connected through one platform. Parents, teachers, and students collaborate seamlessly.",
        "impact": "500+ active users",
      },
      {
        "avatar": "assets/parent1.png",
        "name": "Fatima Al-Rashid",
        "role": "Parent & Education Advocate",
        "school": "Sharjah Excellence School",
        "city": "Sharjah, UAE",
        "quote": "As a parent, I love being able to monitor my children's progress in real-time and communicate directly with their teachers.",
        "impact": "3 children on platform",
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFEF8F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFEF8F2),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.of(context).pop(),
          tooltip: 'Back',
        ),
        title: Text(
          "Our Impact",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: context.w(5),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: isMobile ? context.h(2.1) : context.h(5.4),
          horizontal: isMobile ? context.w(2.4) : context.w(9.2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // العنوان الرئيسي
            Text(
              "JOIN OUR GROWING COMMUNITY",
              style: TextStyle(
                color: Color(0xFF778088),
                fontWeight: FontWeight.w700,
                fontSize: context.w(3.6),
                letterSpacing: context.w(0.2),
              ),
            ),
            SizedBox(height: context.h(1.9)),
            Text(
              "Empowering educators,\nstudents, and families across the region",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.bold,
                fontSize: isMobile ? context.w(6.8) : context.w(11.1),
                height: context.h(0.12),
              ),
            ),
            SizedBox(height: context.h(4.3)),
            // الكروت الرئيسية
            Flex(
              direction: isMobile ? Axis.vertical : Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(people.length, (i) {
                return Expanded(
                  flex: isMobile ? 0 : 1,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: isMobile ? context.w(0.7) : context.w(4.3),
                      vertical: isMobile ? context.h(1.5) : 0,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: isMobile ? context.h(3) : context.h(3.9),
                      horizontal: isMobile ? context.w(4.3) : context.w(7.7),
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFCF9),
                      borderRadius: BorderRadius.circular(context.h(4.3)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.07),
                          blurRadius: 12,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // الصورة والاسم والدور والمدرسة
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(people[i]['avatar']!),
                              radius: isMobile ? context.h(4.1) : context.h(11.1),
                              backgroundColor: Colors.grey[200],
                            ),
                            SizedBox(width: context.w(4.3)),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    people[i]['name']!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: isMobile ? context.w(4.3) : context.w(5.8),
                                    ),
                                  ),
                                  SizedBox(height: context.h(0.2)),
                                  Text(
                                    people[i]['role']!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: context.w(3.6),
                                      color: Color(0xFF0A9E9E),
                                    ),
                                  ),
                                  SizedBox(height: context.h(0.2)),
                                  Text(
                                    people[i]['school']!,
                                    style: TextStyle(
                                      fontSize: isMobile ? 12.7 : 15,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  Text(
                                    people[i]['city']!,
                                    style: TextStyle(
                                      fontSize: isMobile ? context.w(3) : context.w(3.6),
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: context.h(2)),
                        // الاقتباس (italic)
                        Text(
                          '"${people[i]['quote']!}"',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: isMobile ? context.w(3.6) : context.w(4.3),
                            color: Colors.grey[800],
                            height: context.h(0.15),
                          ),
                        ),
                        SizedBox(height: context.h(2)),
                        // شريط الإنجاز
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: context.w(5.3), vertical: context.h(1.3)),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFEAD7),
                            borderRadius: BorderRadius.circular(context.h(1.6)),
                          ),
                          child: Text(
                            people[i]['impact']!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFFF8C00),
                              fontWeight: FontWeight.bold,
                              fontSize: context.w(3.8),
                              letterSpacing: context.w(0.04),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: context.h(3.9)),
          ],
        ),
      ),
    );
  }
}
