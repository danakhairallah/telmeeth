import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/api/student/controllers/question_bank_controller.dart';
import '../../../../../core/api/student/model/response/question_bank_model.dart';
import 'package:telmeeth/core/constants/responsive.dart';
import 'package:telmeeth/core/widgets/student/student_features_app_bar.dart';

class QuestionBankPage extends StatefulWidget {
  final int lessonId;

  const QuestionBankPage({super.key, required this.lessonId});

  @override
  State<QuestionBankPage> createState() => _QuestionBankPageState();
}

class _QuestionBankPageState extends State<QuestionBankPage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<QuestionBankController>().getQuestionBankById(widget.lessonId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = context.screenWidth < 600; // Phone or Small Phone

    return Scaffold(
      appBar: StudentFeaturesAppBar(),
      body: Consumer<QuestionBankController>(
        builder: (context, controller, _) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.errorMessage != null) {
            return Center(child: Text(controller.errorMessage!));
          }

          final questions = controller.questionBank?.data ?? [];

          if (questions.isEmpty) {
            return const Center(child: Text("No questions available"));
          }

          return SingleChildScrollView(
            padding: EdgeInsets.all(context.scaleWidth(12)), // استخدم scaleWidth من Extension
            child: Column(
              children: List.generate(questions.length, (index) {
                final question = questions[index];
                return _questionCard(question, context, isMobile);
              }),
            ),
          );
        },
      ),
    );
  }

  // =========================
  // Question Card
  // =========================
  Widget _questionCard(Question question, BuildContext context, bool isMobile) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: context.h(1)),
      padding: EdgeInsets.all(context.scaleWidth(14)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(context.radius(12)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: context.shadowBlur(8),
            offset: Offset(0, context.shadowOffsetY(2)),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // السؤال
          Text(
            "Q${question.id}: ${question.question ?? ""}",
            style: TextStyle(
              fontSize: isMobile ? context.font(14) : context.font(16),
              fontWeight: FontWeight.bold,
              color: const Color(0xFF264566),
            ),
          ),
          SizedBox(height: context.h(1)),

          // الخيارات
          if (question.options != null) ...[
            _optionTile("A", question.options!.a, question.correctAnswer, context),
            _optionTile("B", question.options!.b, question.correctAnswer, context),
            _optionTile("C", question.options!.c, question.correctAnswer, context),
            _optionTile("D", question.options!.d, question.correctAnswer, context),
          ],
        ],
      ),
    );
  }

  // =========================
  // Option Tile
  // =========================
  Widget _optionTile(String optionKey, String? optionText, String? correctAnswer, BuildContext context) {
    final isCorrect = correctAnswer == optionKey;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: context.h(0.3)),
      padding: EdgeInsets.symmetric(
        vertical: context.h(1),
        horizontal: context.scaleWidth(12),
      ),
      decoration: BoxDecoration(
        color: isCorrect ? Colors.green.withOpacity(0.1) : Colors.grey.withOpacity(0.05),
        border: Border.all(
          color: isCorrect ? Colors.green : Colors.grey.withOpacity(0.3),
        ),
        borderRadius: BorderRadius.circular(context.radius(8)),
      ),
      child: Text(
        "$optionKey. ${optionText ?? ""}",
        style: TextStyle(
          fontSize: context.font(13),
          color: isCorrect ? Colors.green[800] : Colors.black87,
        ),
      ),
    );
  }
}
