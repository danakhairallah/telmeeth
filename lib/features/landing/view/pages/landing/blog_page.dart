import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    final blogs = [
      {
        "image": "assets/shorouq.jpg",
        "category": "Parent Guides",
        "title": "The importance of inclusive classrooms for young learners",
        "date": "Oct 7, 2025",
      },
      {
        "image": "assets/classroom.jpg",
        "category": "Parent Guides",
        "title": "The role of play in kindergarten learning and development",
        "date": "Sep 24, 2025",
      },
      // ... أضف المزيد حسب حاجتك
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFEF8F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFEF8F2),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Telmeeth Blog",
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold , fontSize: context.w(5)),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? context.w(3.4) : context.w(17),
            vertical: isMobile ? context.h(2.4) : context.h(3.9),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "TELMEETH INSIGHTS",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w700,
                  fontSize: isMobile ? context.w(3.1) : context.w(3.6),
                  letterSpacing: context.w(0.4),
                ),
              ),
              SizedBox(height: context.h(1.2)),
              Text(
                "Telmeeth Blog",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? context.w(7.2) : context.w(12.6),
                  height: context.h(0.11),
                ),
              ),
              SizedBox(height: context.h(1.4)),
              Text(
                "Explore AI-driven education stories, tips, and industry news from Telmeeth.",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: isMobile ? context.w(3.6) : context.w(5),
                ),
              ),
              SizedBox(height: context.h(0.7)),
              Text(
                "Discover how to boost your learning, connect with culture, and stay inspired on your journey to fluency.",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: isMobile ? context.w(3.6) : context.w(5),
                ),
              ),
              
              SizedBox(height: context.h(4.1)),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: blogs.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isMobile ? 1 : 2,
                  crossAxisSpacing: isMobile ? 0 : context.w(9.2),
                  mainAxisSpacing: context.h(4.3),
                  childAspectRatio: isMobile ? 0.95 : 1.22,
                ),
                itemBuilder: (context, i) {
                  return _BlogCard(
                    image: blogs[i]["image"]!,
                    category: blogs[i]["category"]!,
                    title: blogs[i]["title"]!,
                    date: blogs[i]["date"]!,
                    isMobile: isMobile,
                  );
                },
              ),
              SizedBox(height: context.h(2.6)),
            ],
          ),
        ),
      ),
    );
  }
}

class _BlogCard extends StatelessWidget {
  final String image;
  final String category;
  final String title;
  final String date;
  final bool isMobile;

  const _BlogCard({
    required this.image,
    required this.category,
    required this.title,
    required this.date,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(context.h(3.8)),
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
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(context.h(3.8))),
            child: Image.asset(
              image,
              width: double.infinity,
              height: isMobile ? context.h(21.8) : context.h(29.5),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB( context.w(4.3), context.h(1.8) , context.w(4.3), context.h(1.9)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category.toUpperCase(),
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w600,
                    fontSize: isMobile ? context.w(3) : context.w(3.4),
                    letterSpacing: context.w(0.3),
                  ),
                ),
                SizedBox(height: context.h(0.9)),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: isMobile ? context.w(4.9) : context.w(7.2),
                    height: context.h(0.12),
                  ),
                ),
                SizedBox(height: context.h(1.2)),
                Text(
                  date,
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: isMobile ? context.w(3.1) : context.w(3.7),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
