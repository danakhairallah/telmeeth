import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telmeeth/core/api/student/controllers/behavior_controller.dart';
import 'package:telmeeth/core/api/student/model/response/behavior_model.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/student/student_features_app_bar.dart';

class Behaviors extends StatefulWidget {
  const Behaviors({super.key});

  @override
  State<Behaviors> createState() => _BehaviorsState();
}

class _BehaviorsState extends State<Behaviors> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BehaviorController>().loadBehaviors();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BehaviorController>(
      builder: (context, controller, _) {
        if (controller.isLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        return Scaffold(
          appBar: const StudentFeaturesAppBar(),
          backgroundColor: const Color(0xFFF8F3EE),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(context.w(4)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _header(
                  context,
                  controller.response?.studentNameEn ?? 'Student',
                  controller.response?.totalScore ?? 0,
                ),
                SizedBox(height: context.h(2)),
                _statsFromApi(context, controller),
                SizedBox(height: context.h(3)),
                if (controller.response?.behaviors?.isEmpty ?? true)
                  Center(
                      child: Text(
                        "No behaviors found.",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: context.w(4),
                          fontWeight: FontWeight.bold,
                        ),
                      ))
                else
                  ...controller.response!.behaviors!.map(
                        (b) => _behaviorCardFromApi(context, b),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _header(BuildContext context, String name, int score) {
  return Container(
    padding: EdgeInsets.all(context.h(1.5)),
    margin: EdgeInsets.only(bottom: context.h(1)),
    decoration: BoxDecoration(
      color: Colors.orange.withOpacity(0.07),
      borderRadius: BorderRadius.circular(14),
    ),
    child: Row(
      children: [
        CircleAvatar(
          radius: context.w(6.5),
          backgroundColor: Colors.orange.withOpacity(0.15),
          child: Icon(Icons.emoji_events, color: Colors.orange, size: context.w(6)),
        ),
        SizedBox(width: context.w(3)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: context.w(5),
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF39566C),
                ),
              ),
              SizedBox(height: context.h(0.6)),
              Text(
                'Track your positive and negative behavior points. Keep aiming for greatness!',
                style: TextStyle(
                  fontSize: context.w(3.1),
                  color: Colors.blueGrey,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: context.w(3), vertical: context.h(0.7)),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.green.withOpacity(0.11),
                blurRadius: 4,
                offset: const Offset(0, 2),
              )
            ],
          ),
          child: Text(
            "+$score",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _statsFromApi(BuildContext context, BehaviorController controller) {
  return GridView(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: MediaQuery.of(context).size.width < 450 ? 2 : 3,
      mainAxisSpacing: context.h(1.6),
      crossAxisSpacing: context.w(2),
      childAspectRatio: 2.6,
    ),
    children: [
      _StatCard(
        title: 'Total Records',
        value: controller.response?.behaviors?.length.toString() ?? '0',
        color: Colors.blueGrey,
        icon: Icons.list_alt_rounded,
      ),
      _StatCard(
        title: 'Positive',
        value: controller.positiveCount.toString(),
        color: Colors.green,
        icon: Icons.thumb_up_alt_rounded,
      ),
      _StatCard(
        title: 'Negative',
        value: controller.negativeCount.toString(),
        color: Colors.redAccent,
        icon: Icons.thumb_down_alt_rounded,
      ),
    ],
  );
}

Widget _behaviorCardFromApi(BuildContext context, Behavior b) {
  final isPositive = (b.score ?? 0) > 0;
  final color = isPositive ? Colors.green : Colors.redAccent;

  return Container(
    margin: EdgeInsets.only(bottom: context.h(1.2)),
    padding: EdgeInsets.all(context.h(1.3)),
    decoration: BoxDecoration(
      color: isPositive ? const Color(0xffF1FDF4) : Colors.red.shade50,
      borderRadius: BorderRadius.circular(15),
      border: Border.all(
        color: color.withOpacity(0.8),
        width: 1.1,
      ),
      boxShadow: [
        BoxShadow(
          color: color.withOpacity(0.07),
          blurRadius: 7,
          offset: const Offset(0, 3),
        )
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          isPositive ? Icons.check_circle : Icons.cancel,
          color: color,
          size: context.w(7),
        ),
        SizedBox(width: context.w(2.1)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                b.behaviorName ?? 'Behavior',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: context.w(4.2),
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: context.h(0.5)),
              Text(
                b.description ?? '',
                style: TextStyle(
                  fontSize: context.w(3.3),
                  color: Colors.blueGrey.shade400,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: context.w(1.8)),
          padding: EdgeInsets.symmetric(horizontal: context.w(4), vertical: context.h(0.9)),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            "${b.score ?? 0}",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: context.w(4.1),
              letterSpacing: 0.3,
            ),
          ),
        ),
      ],
    ),
  );
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final IconData icon;

  const _StatCard({
    required this.title,
    required this.value,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.w(2.2),
        vertical: context.h(1.2),
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.09),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(context.w(2.1)),
            decoration: BoxDecoration(
              color: color.withOpacity(0.18),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Icon(icon, color: color, size: context.w(5)),
          ),
          SizedBox(width: context.w(2)),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontSize: context.w(4.6),
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                SizedBox(height: context.h(0.3)),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: context.w(3.2),
                    color: Colors.blueGrey.shade700,
                    fontWeight: FontWeight.w500,
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
