import 'package:flutter/material.dart';

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
        title: const Text(
          "Telmeeth Blog",
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 14 : 70,
            vertical: isMobile ? 22 : 36,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "TELMEETH INSIGHTS",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w700,
                  fontSize: isMobile ? 13 : 15,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "Telmeeth Blog",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? 30 : 52,
                  height: 1.09,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                "Explore AI-driven education stories, tips, and industry news from Telmeeth.",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: isMobile ? 15 : 20,
                ),
              ),
              const SizedBox(height: 7),
              Text(
                "Discover how to boost your learning, connect with culture, and stay inspired on your journey to fluency.",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: isMobile ? 15 : 20,
                ),
              ),
              const SizedBox(height: 38),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: blogs.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isMobile ? 1 : 2,
                  crossAxisSpacing: isMobile ? 0 : 38,
                  mainAxisSpacing: 40,
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
              const SizedBox(height: 24),
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
        borderRadius: BorderRadius.circular(35),
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
            borderRadius: const BorderRadius.vertical(top: Radius.circular(35)),
            child: Image.asset(
              image,
              width: double.infinity,
              height: isMobile ? 200 : 270,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18, 17, 18, 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category.toUpperCase(),
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w600,
                    fontSize: isMobile ? 12.5 : 14,
                    letterSpacing: 1.3,
                  ),
                ),
                const SizedBox(height: 9),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: isMobile ? 19 : 30,
                    height: 1.14,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  date,
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: isMobile ? 13 : 15.5,
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
