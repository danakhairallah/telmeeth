import 'package:flutter/material.dart';

class OurSchoolsPage extends StatelessWidget {
  const OurSchoolsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF0A6F6D)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Our Schools",
          style: TextStyle(
            color: Color(0xFF0A6F6D),
            fontWeight: FontWeight.bold,
            fontSize: 23,
            fontFamily: 'Montserrat',
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            _HeaderSection(isMobile: isMobile),
            const SizedBox(height: 24),
            // Stats Card
            _StatsCard(isMobile: isMobile),
            const SizedBox(height: 24),
            // Schools Cards (with gradient like original UI)
            _SchoolsListWithGradient(isMobile: isMobile),
            const SizedBox(height: 36),
          ],
        ),
      ),
    );
  }
}

// Header Section as before
class _HeaderSection extends StatelessWidget {
  final bool isMobile;

  const _HeaderSection({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 14 : 0,
        vertical: isMobile ? 22 : 34,
      ),
      child: Column(
        children: [
          Text(
            "OUR REGIONAL PRESENCE",
            style: TextStyle(
              fontSize: isMobile ? 13 : 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              color: Colors.grey[600],
              fontFamily: "Montserrat",
            ),
          ),
          const SizedBox(height: 18),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                fontSize: isMobile ? 28 : 43,
                fontWeight: FontWeight.bold,
                color: Color(0xFF24262B),
                height: 1.13,
                fontFamily: 'Montserrat',
              ),
              children: [
                const TextSpan(text: "Serving schools across "),
                TextSpan(
                  text: "Jordan",
                  style: TextStyle(color: Color(0xFFFF7818)),
                ),
                const TextSpan(text: "\nand the "),
                TextSpan(
                  text: "UAE",
                  style: TextStyle(color: Color(0xFF0A6F6D)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Text(
            "With offices in major cities, we're committed to transforming education across the region.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 15 : 19,
              color: Color(0xFF495C6E),
              fontFamily: 'Montserrat',
            ),
          ),
        ],
      ),
    );
  }
}

// Stats Card
class _StatsCard extends StatelessWidget {
  final bool isMobile;

  const _StatsCard({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        padding: EdgeInsets.symmetric(
          vertical: isMobile ? 17 : 28,
          horizontal: isMobile ? 16 : 44,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(26),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.07),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _SingleStat(
              value: "6",
              label: "Cities",
              color: const Color(0xFFFF7818),
              isMobile: isMobile,
            ),
            _StatDivider(isMobile: isMobile),
            _SingleStat(
              value: "186",
              label: "Schools",
              color: const Color(0xFF0A6F6D),
              isMobile: isMobile,
            ),
            _StatDivider(isMobile: isMobile),
            _SingleStat(
              value: "47K+",
              label: "Students",
              color: const Color(0xFF1872DE),
              isMobile: isMobile,
            ),
          ],
        ),
      ),
    );
  }
}

class _SingleStat extends StatelessWidget {
  final String value, label;
  final Color color;
  final bool isMobile;

  const _SingleStat({
    required this.value,
    required this.label,
    required this.color,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isMobile ? 72 : 105,
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? 22 : 30,
              fontFamily: 'Montserrat',
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: isMobile ? 14 : 16,
              fontFamily: 'Montserrat',
            ),
          ),
        ],
      ),
    );
  }
}

class _StatDivider extends StatelessWidget {
  final bool isMobile;

  const _StatDivider({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 8 : 19),
      child: Container(
        width: 1.4,
        height: isMobile ? 32 : 40,
        color: Colors.grey[300],
      ),
    );
  }
}

// الكروت بدون صور، مع تدرج ألوان وتنسيق العنوان والشارة بشكل دقيق

class _SchoolsListWithGradient extends StatelessWidget {
  final bool isMobile;

  const _SchoolsListWithGradient({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> schoolsData = [
      {
        "city": "Amman",
        "country": "Jordan",
        "address": "King Abdullah II Street, Abdali District",
        "desc":
            "Our headquarters and largest education hub in Jordan, serving schools across the capital.",
        "schools": "45",
        "students": "12,000+",
        "phone": "+962 6 123 4567",
      },
      {
        "city": "Dubai",
        "country": "UAE",
        "address": "Sheikh Zayed Road, Dubai Knowledge Park",
        "desc":
            "Innovation center serving Dubai's diverse international school community.",
        "schools": "38",
        "students": "9,500+",
        "phone": "+971 4 123 4567",
      },
      {
        "city": "Abu Dhabi",
        "country": "UAE",
        "address": "Al Maryah Island, Education District",
        "desc":
            "Supporting Abu Dhabi's vision for world-class education excellence.",
        "schools": "32",
        "students": "8,200+",
        "phone": "+971 2 123 4567",
      },
      {
        "city": "Irbid",
        "country": "Jordan",
        "address": "University Street, Cultural Center",
        "desc":
            "Empowering northern Jordan's educational institutions with AI-powered tools.",
        "schools": "28",
        "students": "6,800+",
        "phone": "+962 2 123 4567",
      },
      {
        "city": "Sharjah",
        "country": "UAE",
        "address": "University City Road, Education Zone",
        "desc":
            "Partnering with Sharjah's commitment to accessible, quality education.",
        "schools": "25",
        "students": "6,000+",
        "phone": "+971 6 123 4567",
      },
      {
        "city": "Aqaba",
        "country": "Jordan",
        "address": "King Hussein Street, Coastal District",
        "desc":
            "Bringing digital education solutions to Jordan's southern gateway.",
        "schools": "18",
        "students": "4,500+",
        "phone": "+962 3 123 4567",
      },
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 8 : 30),
      child: isMobile
          ? Column(
              children: schoolsData
                  .map(
                    (item) => Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: _SchoolCard(item: item, isMobile: isMobile),
                    ),
                  )
                  .toList(),
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(schoolsData.length, (i) {
                final item = schoolsData[i];
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 11),
                    child: _SchoolCard(item: item, isMobile: isMobile),
                  ),
                );
              }),
            ),
    );
  }
}

class _SchoolCard extends StatelessWidget {
  final Map<String, dynamic> item;
  final bool isMobile;

  const _SchoolCard({required this.item, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 14,
            offset: const Offset(0, 7),
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        children: [
          // Gradient top (بدون صورة) مع شارة البلد
          Stack(
            children: [
              Container(
                height: isMobile ? 95 : 140,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF0A6F6D), Color(0xFFFF7818)],
                  ),
                ),
              ),
              Positioned(
                right: 16,
                top: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 13,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Color(0xFFEEEEEE)),
                  ),
                  child: Text(
                    item["country"],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: isMobile ? 13.5 : 15,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Content
          Padding(
            padding: EdgeInsets.all(isMobile ? 14 : 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item["city"],
                  style: TextStyle(
                    fontSize: isMobile ? 22 : 26,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 18, color: Colors.grey),
                    const SizedBox(width: 3),
                    Expanded(
                      child: Text(
                        item["address"],
                        style: TextStyle(
                          fontSize: isMobile ? 14 : 15.5,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  item["desc"],
                  style: TextStyle(
                    fontSize: isMobile ? 14 : 15.5,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(
                      child: _InfoBox(
                        value: item["schools"],
                        label: "Schools",
                        isMobile: isMobile,
                      ),
                    ),
                    const SizedBox(width: 9),
                    Expanded(
                      child: _InfoBox(
                        value: item["students"],
                        label: "Students",
                        isMobile: isMobile,
                        isOrange: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.phone, color: Colors.grey, size: 18),
                    const SizedBox(width: 4),
                    Text(
                      item["phone"],
                      style: TextStyle(
                        fontSize: isMobile ? 13.5 : 15,
                        color: Color(0xFF595C66),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoBox extends StatelessWidget {
  final String value, label;
  final bool isOrange, isMobile;

  const _InfoBox({
    required this.value,
    required this.label,
    required this.isMobile,
    this.isOrange = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isMobile ? 48 : 62,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: Colors.grey[100]!),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(
              color: isOrange ? Color(0xFFFF7818) : Color(0xFF0A6F6D),
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? 15.7 : 21,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: isMobile ? 12.8 : 14.3,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
