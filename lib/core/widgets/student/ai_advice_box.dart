import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api/controllers/ai_advice_controller.dart';

class AiAdviceBox extends StatelessWidget {
  const AiAdviceBox();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AiAdviceController>();

    return Container(
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
          else if (controller.latestAdvice == null)
            Text(
              'No advice available at the moment.',
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            )
          else
            Text(
              controller.latestAdvice!.content,
              style: const TextStyle(
                fontSize: 13,
                height: 1.5,
              ),
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
        ],
      ),
    );
  }
}
