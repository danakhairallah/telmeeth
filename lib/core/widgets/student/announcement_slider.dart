import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/student/controllers/announcement_controller.dart';

class AnnouncementSlider extends StatefulWidget {
  const AnnouncementSlider({super.key});

  @override
  State<AnnouncementSlider> createState() => _AnnouncementSliderState();
}

class _AnnouncementSliderState extends State<AnnouncementSlider> {
  final PageController _controller = PageController();
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<AnnouncementController>(
      builder: (context, ctrl, _) {
        if (ctrl.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final items = ctrl.allAnnouncements;
        if (items.isEmpty) {
          return _empty();
        }

        return Column(
          children: [
            SizedBox(
              height: 160,
              child: PageView.builder(
                controller: _controller,
                itemCount: items.length,
                onPageChanged: (i) => setState(() => _index = i),
                itemBuilder: (_, i) {
                  final a = items[i];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _card(
                      a.type ?? 'Announcement',
                      a.text ?? '',
                    ),

                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                items.length,
                    (i) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: _index == i ? 20 : 8,
                  decoration: BoxDecoration(
                    color: _index == i ? Colors.orange : Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _card(String title, String body) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [Colors.orange.shade400, Colors.orange.shade800],
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
          const SizedBox(height: 8),
          Text(
            body,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _empty() {
    return Container(
      height: 140,
      alignment: Alignment.center,
      child: const Text(
        'No announcements yet',
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}
