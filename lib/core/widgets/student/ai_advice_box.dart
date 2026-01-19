import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/student/controllers/ai_advice_controller.dart';
// استورد صفحة المساعد الذكي
import 'package:telmeeth/features/landing/view/pages/student/smart_assistant_page.dart';

class AiAdviceBox extends StatelessWidget {
  const AiAdviceBox({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AiAdviceController>();

    final latestAdvice = controller.latestAdvice;

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: latestAdvice == null
          ? null
          : () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => SmartAssistant(initialTab: 1),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(Icons.smart_toy_outlined, color: Colors.orange),
                SizedBox(width: 8),
                Text(
                  'AI Advice',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            if (controller.isLoading)
              const Center(child: CircularProgressIndicator(strokeWidth: 2))
            else if (latestAdvice == null)
              Text(
                'No advice available at the moment.',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              )
            else
              Text(
                latestAdvice.content,
                style: const TextStyle(
                  fontSize: 13,
                  height: 1.5,
                ),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
          ],
        ),
      ),
    );
  }
}
