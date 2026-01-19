import 'package:flutter/material.dart';
import 'package:telmeeth/core/constants/responsive.dart';

import '../../../../../core/widgets/parent/features_app_bar.dart';

class AiAssistantParent extends StatelessWidget {
  const AiAssistantParent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FeaturesAppBar(),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(context.h(0.8)),
        ),
      ),
    );
  }
}
