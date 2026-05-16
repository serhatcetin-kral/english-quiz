import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/quiz_question.dart';

class QuizService {

  static Future<List<QuizQuestion>>
  loadQuestions(

      String category,
      String level,
      {String quizNumber = 'quiz1'}

      ) async {

    final String data =
    await rootBundle.loadString(
      'assets/data/$category/$level/$quizNumber.json',
    );

    final decoded = json.decode(data);

    // IELTS + TOEFL Reading Passages
    if (

    (category == 'ielts' ||
        category == 'toefl') &&

        level == 'reading'

    ) {

      final String passage =
      decoded['passage'];

      final List questions =
      decoded['questions'];

      return questions.map((e) {

        e['story'] = passage;

        return QuizQuestion.fromJson(e);

      }).toList();
    }

    // Normal quizzes
    final List jsonResult = decoded;

    return jsonResult
        .map(
          (e) =>
          QuizQuestion.fromJson(e),
    )
        .toList();
  }
}