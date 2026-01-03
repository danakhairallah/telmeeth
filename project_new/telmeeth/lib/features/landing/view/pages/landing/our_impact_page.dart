import 'package:flutter/material.dart';

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
        title: const Text(
          "Our Impact",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 21,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: isMobile ? 20 : 50,
          horizontal: isMobile ? 10 : 38,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // العنوان الرئيسي
            const Text(
              "JOIN OUR GROWING COMMUNITY",
              style: TextStyle(
                color: Color(0xFF778088),
                fontWeight: FontWeight.w700,
                fontSize: 15,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 18),
            Text(
              "Empowering educators,\nstudents, and families across the region",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.bold,
                fontSize: isMobile ? 28 : 46,
                height: 1.13,
              ),
            ),
            const SizedBox(height: 40),
            // الكروت الرئيسية
            Flex(
              direction: isMobile ? Axis.vertical : Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(people.length, (i) {
                return Expanded(
                  flex: isMobile ? 0 : 1,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: isMobile ? 0 : 18,
                      vertical: isMobile ? 14 : 0,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: isMobile ? 28 : 36,
                      horizontal: isMobile ? 18 : 32,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFCF9),
                      borderRadius: BorderRadius.circular(40),
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
                              radius: isMobile ? 38 : 46,
                              backgroundColor: Colors.grey[200],
                            ),
                            const SizedBox(width: 18),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    people[i]['name']!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: isMobile ? 18 : 24,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    people[i]['role']!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Color(0xFF0A9E9E),
                                    ),
                                  ),
                                  const SizedBox(height: 2),
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
                                      fontSize: isMobile ? 12.7 : 15,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        // الاقتباس (italic)
                        Text(
                          '"${people[i]['quote']!}"',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: isMobile ? 15 : 18,
                            color: Colors.grey[800],
                            height: 1.45,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // شريط الإنجاز
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 22, vertical: 12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFEAD7),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            people[i]['impact']!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xFFFF8C00),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              letterSpacing: 0.2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 36),
          ],
        ),
      ),
    );
  }
}
