import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive.dart';

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
        title: Text(
          "Stories",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: context.w(5.1),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: isMobile ? context.h(1.9) : context.h(4.3),
          horizontal: isMobile ? context.w(1.9) : context.w(10.7),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // العنوان
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  fontSize: isMobile ? context.w(5.3) : context.w(7.7),
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  height: context.h(0.12),
                  fontFamily: "Montserrat",
                ),
                children: [
                  TextSpan(text: "Real " , style: TextStyle(fontSize: context.w(5.3))),
                  WidgetSpan(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFD7FBE7),
                        borderRadius: BorderRadius.circular(context.h(0.8)),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: context.w(1.4),
                        vertical: context.h(0.1),
                      ),
                      child: Text(
                        "stories",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: context.w(5)
                        ),
                      ),
                    ),
                  ),
                  TextSpan(text: " from our " , style: TextStyle(fontSize: context.w(5.3))),
                  WidgetSpan(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF4AC),
                        borderRadius: BorderRadius.circular(context.h(0.8)),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: context.w(1.4),
                        vertical: context.h(0.1),
                      ),
                      child: Text(
                        "community",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: context.w(5)
                        ),
                      ),
                    ),
                  ),
                  TextSpan(text: " impacting education " , style: TextStyle(fontSize: context.w(5.3))),
                  WidgetSpan(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFE9C7),
                        borderRadius: BorderRadius.circular(context.h(0.8)),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: context.w(1.4),
                        vertical: context.h(0.1),
                      ),
                      child: Text(
                        "everywhere",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: context.w(5)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: context.h(1.7)),
            Icon(
              Icons.menu_book,
              color: Color(0xFF857AF6),
              size: isMobile ? context.w(8) : context.w(9.7),
            ),
            SizedBox(height: context.h(2.4)),
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
            SizedBox(height: context.h(2.4)),
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
    final avatarSize = widget.isMobile ? context.w(8.2) : context.w(10.2);

    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: context.h(1)),
      padding: EdgeInsets.symmetric(horizontal: context.w(5), vertical: context.h(1.9)),
      constraints: BoxConstraints(
        minHeight: widget.isMobile ? context.h(18.5) : context.h(21.8),
        maxHeight: expanded ? double.infinity : (widget.isMobile ? context.h(18.5) : context.h(21.8)),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(context.h(2.6)),
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
              SizedBox(width: context.w(3.1)),
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
                        fontSize: widget.isMobile ? context.w(2.9) : context.w(3.4),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: context.h(1.4)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  widget.text,
                  maxLines: expanded ? null : 2,
                  overflow: expanded ? TextOverflow.visible : TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: widget.isMobile ? context.w(3.1) : context.w(3.7),
                    color: Colors.grey[800],
                    height: context.h(0.14),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => setState(() => expanded = !expanded),
                child: Padding(
                  padding: EdgeInsets.only(left: context.w(0.4), top: context.h(0.1)),
                  child: Icon(
                    expanded ? Icons.expand_less : Icons.expand_more,
                    size: context.w(5),
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
