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

    String path;

    if (category.startsWith('sat_')) {

      path =
      'assets/data/sat/$category/$level/$quizNumber.json';

    } else {

      path =
      'assets/data/$category/$level/$quizNumber.json';
    }

    final String data =
    await rootBundle.loadString(path);

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