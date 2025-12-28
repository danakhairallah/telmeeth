import 'package:flutter/material.dart';

class StoriesPage extends StatelessWidget {
  const StoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    final stories = [
      {
        "avatar": "assets/testimonial1.jpg",
        "name": "Sofia Ghafalah",
        "location": "Dubai, UAE",
        "text":
        "Telmeeth’s AI-powered platform gave me a personalized learning path, real-time progress dashboards and interactive exams that kept me engaged and improved my scores.",
      },
      {
        "avatar": "assets/testimonial3.jpg",
        "name": "Ahmad Albeyari",
        "location": "Jeddah, KSA",
        "text":
        "Our school uses Telmeeth’s analytics and classroom management tools, which have streamlined reporting and boosted teaching quality.",
      },
      {
        "avatar": "assets/testimonial6.jpg",
        "name": "Sami Huwaytat",
        "location": "Amman, Jordan",
        "text":
        "The AI assessments adapt to each student, making learning more personal and helping them reach their milestones, from primary to Tawjihi.",
      },
      {
        "avatar": "assets/testimonial5.jpg",
        "name": "Noura Al-Shehri",
        "location": "Riyadh, KSA",
        "text":
        "Telmeeth connects teachers, parents and students in one ecosystem, fostering a human‑centered education journey.",
      },
      {
        "avatar": "assets/testimonial4.jpg",
        "name": "Sanaa Smadi",
        "location": "Amman, Jordan",
        "text":
        "With Telmeeth’s digital tools, I feel empowered as a learner and confident about my future in the region’s evolving EdTech landscape.",
      },
      {
        "avatar": "assets/testimonial2.jpg",
        "name": "Anas Na'im",
        "location": "Sharjah, UAE",
        "text":
        "As a parent, I love the transparent dashboards and instant reporting – I always know how my child is doing and can support them effectively.",
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
          "Stories",
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
          vertical: isMobile ? 18 : 40,
          horizontal: isMobile ? 8 : 44,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // العنوان
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  fontSize: isMobile ? 22 : 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  height: 1.13,
                  fontFamily: "Montserrat",
                ),
                children: [
                  const TextSpan(text: "Real "),
                  WidgetSpan(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFD7FBE7),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 1,
                      ),
                      child: const Text(
                        "stories",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const TextSpan(text: " from our "),
                  WidgetSpan(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF4AC),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 1,
                      ),
                      child: const Text(
                        "community",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const TextSpan(text: " impacting education "),
                  WidgetSpan(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFE9C7),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 1,
                      ),
                      child: const Text(
                        "everywhere",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Icon(
              Icons.menu_book,
              color: Color(0xFF857AF6),
              size: isMobile ? 32 : 40,
            ),
            const SizedBox(height: 22),
            // الكروت تحت بعض
            ...List.generate(
              stories.length,
                  (i) => _StoryCard(
                avatar: stories[i]['avatar']!,
                name: stories[i]['name']!,
                location: stories[i]['location']!,
                text: stories[i]['text']!,
                isMobile: isMobile,
              ),
            ),
            const SizedBox(height: 22),
          ],
        ),
      ),
    );
  }
}

class _StoryCard extends StatefulWidget {
  final String avatar;
  final String name;
  final String location;
  final String text;
  final bool isMobile;

  const _StoryCard({
    required this.avatar,
    required this.name,
    required this.location,
    required this.text,
    required this.isMobile,
  });

  @override
  State<_StoryCard> createState() => _StoryCardState();
}

class _StoryCardState extends State<_StoryCard> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    final avatarSize = widget.isMobile ? 34.0 : 42.0;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      constraints: BoxConstraints(
        minHeight: widget.isMobile ? 170 : 200,
        maxHeight: expanded ? double.infinity : (widget.isMobile ? 170 : 200),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.09),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // الصورة والاسم والمكان
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(widget.avatar),
                radius: avatarSize,
              ),
              const SizedBox(width: 13),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.location,
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: widget.isMobile ? 12.3 : 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 13),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  widget.text,
                  maxLines: expanded ? null : 2,
                  overflow: expanded ? TextOverflow.visible : TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: widget.isMobile ? 13 : 15.3,
                    color: Colors.grey[800],
                    height: 1.35,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => setState(() => expanded = !expanded),
                child: Padding(
                  padding: const EdgeInsets.only(left: 2, top: 1),
                  child: Icon(
                    expanded ? Icons.expand_less : Icons.expand_more,
                    size: 20,
                    color: Colors.orange[900],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
