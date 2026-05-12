import 'quiz_question.dart';

class QuizResult {
  final QuizQuestion question;
  final String selectedAnswer;
  final bool isCorrect;

  QuizResult({
    required this.question,
    required this.selectedAnswer,
    required this.isCorrect,
  });
}