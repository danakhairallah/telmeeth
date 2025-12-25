import 'package:flutter/material.dart';
import 'package:telmeeth/features/landing/view/pages/stories_page.dart';

import '../../features/landing/view/pages/overview_page.dart';

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
                leading: const Icon(
                  Icons.menu_book_outlined,
                  color: Colors.deepPurple,
                ),
                title: const Text(
                  'More About Us',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                children: [
                  ListTile(
                    leading: const Icon(Icons.info_outline),
                    title: const Text('Overview'),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const OverviewPage()),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.smart_toy_outlined),
                    title: const Text('AI Tools'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.groups_2),
                    title: const Text('Stories'),
                    onTap: () { Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const StoriesPage()),
                    );},
                  ),
                  ListTile(
                    leading: const Icon(Icons.public),
                    title: const Text('Our Impact'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.psychology_alt_outlined),
                    title: const Text('Guidance'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.school_outlined),
                    title: const Text('Our Schools'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.feed),
                    title: const Text('Blog'),
                    onTap: () {},
                  ),
                ],
              ),
              const Divider(),

              ExpansionTile(
                leading: const Icon(
                  Icons.settings_outlined,
                  color: Colors.blueGrey,
                ),
                title: const Text(
                  'Settings',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                children: [
                  ListTile(
                    leading: Icon(
                      isDark ? Icons.dark_mode : Icons.light_mode,
                      color: Colors.orange[800],
                    ),
                    title: Text(isDark ? 'Light Mode' : 'Dark Mode'),
                    onTap: onToggleTheme,
                  ),
                  ListTile(
                    leading: const Icon(Icons.language, color: Colors.teal),
                    title: const Text('Language'),
                    onTap: onChangeLanguage ?? () {},
                    trailing: const Text(
                      'EN',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const Divider(),

              // ---- Contact Us ----
              ExpansionTile(
                leading: const Icon(Icons.mail_outline, color: Colors.deepOrange),
                title: const Text(
                  'Contact Us',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.email_outlined,
                      color: Colors.deepOrange,
                    ),
                    title: const Text('info@telmeeth.com'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.phone, color: Colors.green),
                    title: const Text('+962 7 9131 1369'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.location_on_outlined,
                      color: Colors.blue,
                    ),
                    title: const Text('Zahran St 192, Amman, Jordan'),
                    onTap: () {},
                  ),
                ],
              ),
              const Divider(),

              // ---- Follow Us (Row, not expandable) ----
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
                child: Text(
                  'Follow Us',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.facebook, color: Color(0xFF4267B2)),
                    onPressed: () {}, // Facebook link
                    tooltip: 'Facebook',
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.linked_camera,
                      color: Color(0xFF0077B5),
                    ),
                    onPressed: () {}, // LinkedIn
                    tooltip: 'LinkedIn',
                  ),
                  IconButton(
                    icon: const Icon(Icons.camera_alt, color: Color(0xFFC13584)),
                    onPressed: () {}, // Instagram
                    tooltip: 'Instagram',
                  ),
                  IconButton(
                    icon: const Icon(Icons.ondemand_video, color: Colors.red),
                    onPressed: () {}, // YouTube
                    tooltip: 'YouTube',
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
