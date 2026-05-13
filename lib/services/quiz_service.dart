import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/quiz_question.dart';

class QuizService {

  static Future<List<QuizQuestion>>
  loadQuestions(

      String category,
      String level,

      ) async {

    final String data =
    await rootBundle.loadString(
        'assets/data/${category.replaceAll(' ', '_')}/$level.json'
      // 'assets/data/$category/$level.json',
     // 'assets/data/vocabulary/beginner.json',
    );

    final List jsonResult =
    json.decode(data);

    return jsonResult
        .map(
          (e) =>
          QuizQuestion.fromJson(e),
    )
        .toList();
  }
}