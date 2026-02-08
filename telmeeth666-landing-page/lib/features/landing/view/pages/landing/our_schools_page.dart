import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive.dart';

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
        title: Text(
          "Our Schools",
          style: TextStyle(
            color: Color(0xFF0A6F6D),
            fontWeight: FontWeight.bold,
            fontSize: context.w(5.5),
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
            SizedBox(height: context.h(2.6)),
            // Stats Card
            _StatsCard(isMobile: isMobile),
            SizedBox(height: context.h(2.6)),
            // Schools Cards (with gradient like original UI)
            _SchoolsListWithGradient(isMobile: isMobile),
            SizedBox(height: context.h(3.9)),
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
        horizontal: isMobile ? context.w(3.4) : 0,
        vertical: isMobile ? context.h(2.4) : context.h(3.7),
      ),
      child: Column(
        children: [
          Text(
            "OUR REGIONAL PRESENCE",
            style: TextStyle(
              fontSize: isMobile ? context.w(3.1) : context.h(3.8),
              fontWeight: FontWeight.bold,
              letterSpacing: context.w(0.4),
              color: Colors.grey[600],
              fontFamily: "Montserrat",
            ),
          ),
          SizedBox(height: context.h(1.9)),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                fontSize: isMobile ? context.w(6.8) : context.w(10.4),
                fontWeight: FontWeight.bold,
                color: Color(0xFF24262B),
                height: context.h(0.12),
                fontFamily: 'Montserrat',
              ),
              children: [
                TextSpan(text: "Serving schools across " , style: TextStyle(fontSize: context.w(6.6))),
                TextSpan(
                  text: "Jordan",
                  style: TextStyle(color: Color(0xFFFF7818) , fontSize: context.w(6.6)),
                ),
                TextSpan(text: "\nand the " ,style: TextStyle(fontSize: context.w(6.6)) ),
                TextSpan(
                  text: "UAE",
                  style: TextStyle(color: Color(0xFF0A6F6D) , fontSize: context.w(6.6)),
                ),
              ],
            ),
          ),
          SizedBox(height: context.h(1.6)),
          Text(
            "With offices in major cities, we're committed to transforming education across the region.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? context.w(3.6) : context.w(4.6),
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
        margin: EdgeInsets.symmetric(horizontal: context.w(2.9)),
        padding: EdgeInsets.symmetric(
          vertical: isMobile ? context.h(1.8) : context.h(3),
          horizontal: isMobile ? context.w(3.8) : context.w(10.7),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(context.h(2.8)),
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
      width: isMobile ? context.w(17.5) : context.w(25.5),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? context.w(5.3) : context.w(7.2),
              fontFamily: 'Montserrat',
            ),
          ),
          SizedBox(height: context.h(0.2)),
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: isMobile ? context.w(3.4) : context.w(3.8),
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
      padding: EdgeInsets.symmetric(horizontal: isMobile ? context.w(1.9) : context.w(4.6)),
      child: Container(
        width: context.w(0.3),
        height: isMobile ? context.h(3.5) : context.h(4.3),
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
      padding: EdgeInsets.symmetric(horizontal: isMobile ? context.w(1.9) : context.w(7.2)),
      child: isMobile
          ? Column(
              children: schoolsData
                  .map(
                    (item) => Padding(
                      padding: EdgeInsets.only(bottom: context.h(2.6)),
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
                    padding: EdgeInsets.symmetric(horizontal: context.w(2.6)),
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
      margin: EdgeInsets.only(bottom: context.h(1.7)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.h(3.5)),
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
                height: isMobile ? context.h(10.3) : context.h(15.3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(context.h(3.5)),
                    topRight: Radius.circular(context.h(3.5)),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF0A6F6D), Color(0xFFFF7818)],
                  ),
                ),
              ),
              Positioned(
                right: context.w(3.8),
                top: context.h(1.7),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.w(3.1),
                    vertical: context.h(0.6),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(context.h(3.2)),
                    border: Border.all(color: Color(0xFFEEEEEE)),
                  ),
                  child: Text(
                    item["country"],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: isMobile ? context.w(3.2) : context.w(3.6),
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Content
          Padding(
            padding: EdgeInsets.all(isMobile ? context.w(3.4) : context.w(5.3)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item["city"],
                  style: TextStyle(
                    fontSize: isMobile ? context.w(5.3) : context.w(6.3),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                ),
                SizedBox(height: context.h(0.5)),
                Row(
                  children: [
                    Icon(Icons.location_on, size: context.w(4.3), color: Colors.grey),
                    SizedBox(width: context.w(0.7)),
                    Expanded(
                      child: Text(
                        item["address"],
                        style: TextStyle(
                          fontSize: isMobile ? context.w(3.4) : context.w(3.7),
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.h(0.8)),
                Text(
                  item["desc"],
                  style: TextStyle(
                    fontSize: isMobile ? context.w(3.4) : context.w(3.7),
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: context.h(1.5)),
                Row(
                  children: [
                    Expanded(
                      child: _InfoBox(
                        value: item["schools"],
                        label: "Schools",
                        isMobile: isMobile,
                      ),
                    ),
                    SizedBox(width: context.w(2.1)),
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
                SizedBox(height: context.h(0.8)),
                Row(
                  children: [
                    Icon(Icons.phone, color: Colors.grey, size: context.w(4.3)),
                    SizedBox(width: context.w(0.9)),
                    Text(
                      item["phone"],
                      style: TextStyle(
                        fontSize: isMobile ? context.w(3.2) : context.w(3.6),
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
      height: isMobile ? context.h(5.2) : context.h(6.7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(context.h(1.8)),
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
              fontSize: isMobile ? context.w(3.8) : context.w(5.1),
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: isMobile ? context.w(3.1) : context.w(3.4),
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
