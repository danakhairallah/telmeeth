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
          body: SingleChildScrollView(
            padding: EdgeInsets.all(context.w(4)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _header(
                  context,
                  controller.response?.studentNameAr ?? 'الطالب',
                  controller.response?.totalScore ?? 0,
                ),

                SizedBox(height: context.h(2)),
                _statsFromApi(context, controller),
                SizedBox(height: context.h(3)),
                if (controller.response?.behaviors?.isEmpty ?? true)
                  const Center(child: Text("لا يوجد سلوكيات"))
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
    padding: EdgeInsets.all(context.h(1.6)),
    decoration: BoxDecoration(
      color: const Color(0xffFDF6EC),
      borderRadius: BorderRadius.circular(14),
    ),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name, // استخدم اسم الطالب العربي أو الإنجليزي حسب السياق
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: context.h(0.5)),
              const Text(
                'Tracking your journey of excellence and personal development.',
                style: TextStyle(fontSize: 13),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            '+$score',
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
  return
    GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width < 700 ? 2 : 3,
        mainAxisSpacing: context.h(2),
        crossAxisSpacing: context.w(2),
        childAspectRatio: 3,
      ),
      children: [
        _StatCard(
          title: 'Total Records',
          value: controller.response?.behaviors?.length.toString() ?? '0',
        ),
        _StatCard(
          title: 'Positive',
          value: controller.positiveCount.toString(),
        ),
        _StatCard(
          title: 'Negative',
          value: controller.negativeCount.toString(),
        ),
      ],
    );
}

Widget _behaviorCardFromApi(BuildContext context, Behavior b) {
  final isPositive = (b.score ?? 0) > 0;

  return Container(
    margin: const EdgeInsets.only(bottom: 12),
    padding: EdgeInsets.all(context.h(1.6)),
    decoration: BoxDecoration(
      color: isPositive ? const Color(0xffF1FDF4) : Colors.red.shade50,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(
        color: isPositive ? Colors.green : Colors.red,
      ),
    ),
    child: Row(
      children: [
        Icon(
          isPositive ? Icons.check_circle : Icons.cancel,
          color: isPositive ? Colors.green : Colors.red,
        ),
        SizedBox(width: context.w(2)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                b.behaviorName ?? 'Behavior',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                b.description ?? '',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              // لو تريد تظهر نص الشهادة
              // Text(b.certificateTextAr ?? ''),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: isPositive ? Colors.green : Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            "${b.score ?? 0}",
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
  );
}
class _StatCard extends StatelessWidget {
  final String title;
  final String value;

  const _StatCard({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: FittedBox(
                child: Text(
                  value,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
