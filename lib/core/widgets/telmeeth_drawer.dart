import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:telmeeth/features/landing/view/pages/landing/ai_tools_page.dart';
import 'package:telmeeth/features/landing/view/pages/landing/blog_page.dart';
import 'package:telmeeth/features/landing/view/pages/landing/our_impact_page.dart';
import 'package:telmeeth/features/landing/view/pages/landing/stories_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../features/landing/view/pages/landing/guidance_page.dart';
import '../../features/landing/view/pages/landing/our_schools_page.dart';
import '../../features/landing/view/pages/landing/overview_page.dart';

class TelmeethDrawer extends StatelessWidget {
  final VoidCallback onToggleTheme;
  final bool isDark;
  final VoidCallback? onChangeLanguage;

  const TelmeethDrawer({
    super.key,
    required this.onToggleTheme,
    required this.isDark,
    this.onChangeLanguage,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFFEF8F2),
      child: SafeArea(
        child: Container(
          color: const Color(0xFFFEF8F2),
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
            children: [
              // Logo and title
              Row(
                children: [
                  Image.asset('assets/logo.jpg', height: 32),
                  const SizedBox(width: 10),
                  const Text(
                    'Telmeeth',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(height: 18),

              // ---- More About Us ----
              ExpansionTile(
                leading: Icon(
                  LucideIcons.bookOpen,
                  // أيقونة كتاب مفتوح (بدل menu_book_outlined)
                  color: Colors.deepPurple,
                ),
                title: const Text(
                  'More About Us',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                children: [
                  ListTile(
                    leading: Icon(LucideIcons.info, color: Colors.blueGrey),
                    // Overview
                    title: const Text('Overview'),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const OverviewPage()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(LucideIcons.brainCircuit, color: Colors.teal),
                    // AI Tools
                    title: const Text('AI Tools'),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const AiToolsPage()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(LucideIcons.users, color: Colors.orange),
                    // Stories
                    title: const Text('Stories'),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const StoriesPage()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(LucideIcons.globe, color: Colors.blue),
                    // Our Impact
                    title: const Text('Our Impact'),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const OurImpactPage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      LucideIcons.compass,
                      color: Colors.deepPurple,
                    ),
                    // Guidance
                    title: const Text('Guidance'),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const GuidancePage()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      LucideIcons.graduationCap,
                      color: Colors.green,
                    ),
                    // Our Schools
                    title: const Text('Our Schools'),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const OurSchoolsPage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      LucideIcons.newspaper,
                      color: Colors.pink,
                    ), // Blog
                    title: const Text('Blog'),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const BlogPage()),
                      );
                    },
                  ),
                ],
              ),
              ExpansionTile(
                leading: const Icon(
                  LucideIcons.settings,
                  color: Colors.blueGrey,
                ),
                title: const Text(
                  'Settings',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                children: [
                  ListTile(
                    leading: Icon(
                      isDark ? LucideIcons.moon : LucideIcons.sun,
                      color: Colors.orange[800],
                    ),
                    title: Text(isDark ? 'Light Mode' : 'Dark Mode'),
                    onTap: onToggleTheme,
                  ),
                  ListTile(
                    leading: const Icon(
                      LucideIcons.languages,
                      color: Colors.teal,
                    ),
                    title: const Text('Language'),
                    onTap: onChangeLanguage ?? () {},
                    trailing: const Text(
                      'EN',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),

              // ---- Contact Us ----
              ExpansionTile(
                leading: const Icon(
                  LucideIcons.mails, // أيقونة الإيميل
                  color: Colors.deepOrange,
                ),
                title: const Text(
                  'Contact Us',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                children: [
                  ListTile(
                    leading: Icon(
                      LucideIcons.mail,
                      color: Colors.deepOrange,
                    ),
                    title: const Text('info@telmeeth.com'),
                    onTap: () {
                      _forceOpenUrl('mailto:info@telmeeth.com');
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      LucideIcons.phone,
                      color: Colors.green,
                    ),
                    title: const Text('+962 7 9131 1369'),
                    onTap: () {
                      _forceOpenUrl('tel:+962791311369');
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      LucideIcons.mapPin,
                      color: Colors.blue,
                    ),
                    title: const Text('Zahran St 192, Amman, Jordan'),
                    onTap: () {
                      // إحداثيات الموقع (يفضل تبحث عنها بدقة)
                      _forceOpenUrl('https://www.google.com/maps/search/?api=1&query=Zahran+St+192,+Amman,+Jordan');
                    },
                  ),
                ],              ),

              const Padding(
                padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
                child: Text(
                  'Follow Us',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(LucideIcons.facebook, color: Color(0xFF1877F3)),
                    onPressed: () => _forceOpenUrl(
                      'https://web.facebook.com/telmeethacademy#',
                    ),
                    tooltip: 'Facebook',
                  ),
                  IconButton(
                    icon: Icon(LucideIcons.linkedin, color: Color(0xFF0077B5)),
                    onPressed: () => _forceOpenUrl(
                      'https://www.linkedin.com/company/telmeethsolutions/',
                    ),
                    tooltip: 'LinkedIn',
                  ),
                  IconButton(
                    icon: Icon(LucideIcons.instagram, color: Color(0xFFC13584)),
                    onPressed: () => _forceOpenUrl(
                      'https://www.instagram.com/telmeeth_academy/',
                    ),
                    tooltip: 'Instagram',
                  ),
                  IconButton(
                    icon: Icon(LucideIcons.youtube, color: Colors.red),
                    onPressed: () =>
                        _forceOpenUrl('https://www.youtube.com/@Telmeeth_Edu'),
                    tooltip: 'YouTube',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _forceOpenUrl(String urlString) async {
    final url = Uri.parse(urlString);

    // حاول فتحه بالمتصفح الخارجي أولاً
    try {
      bool launched = await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
      if (!launched) {
        // إذا فشل جرب داخلي في WebView
        await launchUrl(
          url,
          mode: LaunchMode.inAppWebView,
          webViewConfiguration: const WebViewConfiguration(
            enableJavaScript: true,
          ),
        );
      }
    } catch (_) {
      // لو صار أي خطأ، جرب داخلي كـ fallback
      await launchUrl(
        url,
        mode: LaunchMode.inAppWebView,
        webViewConfiguration: const WebViewConfiguration(
          enableJavaScript: true,
        ),
      );
    }
  }
}
