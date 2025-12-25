import 'package:flutter/material.dart';

class StoriesPage extends StatelessWidget {
  const StoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    // بيانات القصص (يمكنك وضع الصور عندك بـ assets/avatars/...)
    final stories = [
      {
        "avatar": "assets/sofia.png", // مثال على الصورة
        "name": "Sofia Ghafalah",
        "location": "Dubai, UAE",
        "text":
        "Telmeeth’s AI-powered platform gave me a personalized learning path, real-time progress dashboards and interactive exams that kept me engaged and improved my scores.",
      },
      {
        "avatar": "assets/ahmad.png",
        "name": "Ahmad Albeyari",
        "location": "Jeddah, KSA",
        "text":
        "Our school uses Telmeeth’s analytics and classroom management tools, which have streamlined reporting and boosted teaching quality.",
      },
      {
        "avatar": "assets/sami.png",
        "name": "Sami Huwaytat",
        "location": "Amman, Jordan",
        "text":
        "The AI assessments adapt to each student, making learning more personal and helping them reach their milestones, from primary to Tawjihi.",
      },
    ];

    return Container(
      color: const Color(0xFFFEF8F2),
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: isMobile ? 24 : 52, horizontal: isMobile ? 10 : 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // العنوان مع الكلمات الملونة
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                fontSize: isMobile ? 26 : 38,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                height: 1.13,
                fontFamily: "Montserrat", // أو أي خط يناسبك
              ),
              children: [
                const TextSpan(text: "Real "),
                WidgetSpan(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFD7FBE7),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                    child: const Text(
                      "stories",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const TextSpan(text: " from our "),
                WidgetSpan(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF4AC),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                    child: const Text(
                      "community",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const TextSpan(text: " impacting education "),
                WidgetSpan(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE9C7),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                    child: const Text(
                      "everywhere",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Icon(Icons.menu_book, color: Color(0xFF857AF6), size: isMobile ? 36 : 48),
          const SizedBox(height: 16),
          // الكروت (صف)
          LayoutBuilder(
            builder: (context, constraints) {
              return Flex(
                direction: isMobile ? Axis.vertical : Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: List.generate(
                  stories.length,
                      (i) => Expanded(
                    flex: isMobile ? 0 : 1,
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: isMobile ? 0 : 16,
                        vertical: isMobile ? 10 : 0,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 34, horizontal: 32),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(36),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.07),
                            blurRadius: 18,
                            offset: const Offset(0, 7),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // صورة البروفايل
                          CircleAvatar(
                            backgroundImage: AssetImage(stories[i]['avatar']!),
                            radius: isMobile ? 26 : 34,
                          ),
                          const SizedBox(height: 16),
                          // الاسم والمكان
                          Text(
                            stories[i]['name']!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: isMobile ? 16 : 20,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            stories[i]['location']!,
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: isMobile ? 12.5 : 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 18),
                          // نص القصة
                          Text(
                            stories[i]['text']!,
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: isMobile ? 13.2 : 15.8,
                              height: 1.44,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
