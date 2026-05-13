import 'package:flutter/material.dart';

import '../models/quiz_question.dart';
import '../models/quiz_result.dart';
import '../services/quiz_service.dart';
import 'result_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
class QuizScreen extends StatefulWidget {
  final String category;
  final String level;

  const QuizScreen({
    super.key,
    required this.category,
    required this.level,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  List<QuizQuestion> questions = [];

  List<String?> selectedAnswers = [];

  bool loading = true;

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    loadQuiz();
  }

  Future<void> loadQuiz() async {

    questions =
    await QuizService.loadQuestions(
      widget.category,
      widget.level,
    );

    questions.shuffle();

    selectedAnswers =
        List.filled(
          questions.length,
          null,
        );

    await loadSavedProgress();

    setState(() {
      loading = false;
    });
  }
  Future<void> saveProgress() async {

    final prefs =
    await SharedPreferences.getInstance();

    await prefs.setString(
      'current_level',
      widget.level,
    );

    await prefs.setInt(
      'current_index',
      currentIndex,
    );

    await prefs.setString(
      'selected_answers',
      jsonEncode(selectedAnswers),
    );
  }
  Future<void> loadSavedProgress() async {

    final prefs =
    await SharedPreferences.getInstance();

    final savedCategory =
    prefs.getString(
      'current_category',
    );
    final savedLevel =
    prefs.getString(
      'current_level',
    );

    if (
    savedCategory != widget.category ||
        savedLevel != widget.level
    ) {
      return;
    }

    currentIndex =
        prefs.getInt(
          'current_index',
        ) ?? 0;

    final savedAnswers =
    prefs.getString(
      'selected_answers',
    );

    if (savedAnswers != null) {

      final decoded =
      List<String?>.from(
        jsonDecode(savedAnswers),
      );

      selectedAnswers = decoded;
    }
  }
  void selectAnswer(String answer) {
    setState(() {
      selectedAnswers[currentIndex] =
          answer;
    });

    saveProgress();
  }

  void nextQuestion() {

    if (currentIndex <
        questions.length - 1) {

      setState(() {
        currentIndex++;
      });
      saveProgress();
    }
  }

  void previousQuestion() {

    if (currentIndex > 0) {

      setState(() {
        currentIndex--;
      });
      saveProgress();
    }
  }

  Future<void> finishQuiz() async {

    final prefs =
        await SharedPreferences.getInstance();

    await prefs.remove('current_category');
    await prefs.remove('current_level');
    await prefs.remove('current_index');
    await prefs.remove('selected_answers');

    int score = 0;

    List<QuizResult> results = [];

    for (int i = 0;
    i < questions.length;
    i++) {

      final question = questions[i];

      final selected =
          selectedAnswers[i] ?? '';

      final isCorrect =
          selected ==
              question.answer;

      if (isCorrect) {
        score++;
      }

      results.add(

        QuizResult(
          question: question,
          selectedAnswer: selected,
          isCorrect: isCorrect,
        ),
      );
    }

    Navigator.pushReplacement(
      context,

      MaterialPageRoute(
        builder: (_) => ResultScreen(
          score: score,
          total: questions.length,
          results: results,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    if (loading) {

      return const Scaffold(
        body: Center(
          child:
          CircularProgressIndicator(),
        ),
      );
    }

    final question =
    questions[currentIndex];

    return Scaffold(

      appBar: AppBar(
        title: Text(
          widget.category.toUpperCase(),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding:
        const EdgeInsets.all(16),

        child: Column(

          crossAxisAlignment:
          CrossAxisAlignment.stretch,

          children: [

            LinearProgressIndicator(
              value:
              (currentIndex + 1) /
                  questions.length,
            ),

            const SizedBox(height: 20),

            Text(
              'Question ${currentIndex + 1}/${questions.length}',

              style: const TextStyle(
                fontSize: 18,
                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 24),

            Card(

              elevation: 5,

              shape:
              RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(20),
              ),

              child: Padding(
                padding:
                const EdgeInsets.all(20),

                child: Column(

                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    if (question.story != null)

                      Container(

                        width: double.infinity,

                        padding:
                        const EdgeInsets.all(16),

                        margin:
                        const EdgeInsets.only(
                          bottom: 20,
                        ),

                        decoration: BoxDecoration(

                          color:
                          Colors.deepPurple.shade50,

                          borderRadius:
                          BorderRadius.circular(16),
                        ),

                        child: Text(

                          question.story!,

                          style:
                          const TextStyle(
                            fontSize: 18,
                            height: 1.5,
                            fontWeight:
                            FontWeight.w500,
                          ),
                        ),
                      ),

                    Text(
                      question.question,

                      style:
                      const TextStyle(
                        fontSize: 24,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            ...question.options.map((option) {

              final selected =
                  selectedAnswers[currentIndex]
                      == option;

              return Padding(

                padding:
                const EdgeInsets.only(
                  bottom: 12,
                ),

                child: ElevatedButton(

                  onPressed: () {
                    selectAnswer(option);
                  },

                  style:
                  ElevatedButton.styleFrom(

                    backgroundColor:
                    selected
                        ? Colors.blue
                        : null,

                    foregroundColor:
                    selected
                        ? Colors.white
                        : null,

                    padding:
                    const EdgeInsets.all(16),

                    shape:
                    RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(16),
                    ),
                  ),

                  child: Text(
                    option,

                    style:
                    const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              );
            }),

            const Spacer(),

            Row(

              children: [

                Expanded(

                  child: ElevatedButton(

                    onPressed:
                    currentIndex == 0
                        ? null
                        : previousQuestion,

                    child:
                    const Text('Previous'),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(

                  child:
                  currentIndex ==
                      questions.length - 1

                      ? ElevatedButton(

                    onPressed:
                    finishQuiz,

                    child:
                    const Text(
                      'Finish',
                    ),
                  )

                      : ElevatedButton(

                    onPressed:
                    nextQuestion,

                    child:
                    const Text(
                      'Next',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}