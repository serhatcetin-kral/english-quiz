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
  final String quizNumber;

  const QuizScreen({
    super.key,
    required this.category,
    required this.level,
    required this.quizNumber,
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
      quizNumber: widget.quizNumber,
    );

    questions.shuffle();
    for (var question in questions) {
      question.options.shuffle();
    }

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

    if (questions.isEmpty ||
        currentIndex >= questions.length) {

      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    if (currentIndex >= questions.length) {
      currentIndex = questions.length - 1;
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

        body: SafeArea(

            child: SingleChildScrollView(

              child: Padding(
                padding: const EdgeInsets.all(16),

                child: Column(

          crossAxisAlignment:
          CrossAxisAlignment.stretch,

          children: [

            Column(

              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Row(

                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

                  children: [

                    Text(

                      'Question ${currentIndex + 1}/${questions.length}',

                      style: const TextStyle(

                        fontSize: 18,

                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),

                    Text(

                      '${(((currentIndex + 1) / questions.length) * 100).toInt()}%',

                      style: const TextStyle(

                        fontSize: 16,

                        fontWeight:
                        FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                ClipRRect(

                  borderRadius:
                  BorderRadius.circular(20),

                  child: LinearProgressIndicator(

                    value:
                    (currentIndex + 1) /
                        questions.length,

                    minHeight: 10,

                    backgroundColor:
                    Colors.grey.shade300,

                    valueColor:
                    const AlwaysStoppedAnimation(
                      Colors.blue,
                    ),
                  ),
                ),
              ],
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

            Container(

              width: double.infinity,

              padding:
              const EdgeInsets.all(18),

              decoration: BoxDecoration(
                color:
                Theme.of(context)
                    .cardColor,

                borderRadius:
                BorderRadius.circular(28),

                boxShadow: [

                  BoxShadow(

                    color:
                    Colors.black.withOpacity(0.08),

                    blurRadius: 18,

                    offset:
                    const Offset(0, 8),
                  ),
                ],
              ),

              child: Column(

                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  if (question.story != null)

                    Container(

                      width: double.infinity,

                      margin:
                      const EdgeInsets.only(
                        bottom: 24,
                      ),

                      padding:
                      const EdgeInsets.all(18),

                      decoration: BoxDecoration(

                        color:
                        Colors.deepPurple.shade50,

                        borderRadius:
                        BorderRadius.circular(20),
                      ),

                      child: Text(

                        question.story!,

                        style: const TextStyle(

                          fontSize: 18,

                          height: 1.6,

                          fontWeight:
                          FontWeight.w500,
                        ),
                      ),
                    ),

                  Container(

                    padding:
                    const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),

                    decoration: BoxDecoration(

                      color:
                      Colors.blue.shade50,

                      borderRadius:
                      BorderRadius.circular(14),
                    ),

                    child: const Text(

                      'QUESTION',

                      style: TextStyle(

                        color: Colors.blue,

                        fontWeight:
                        FontWeight.bold,

                        letterSpacing: 1,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(

                    question.question,

                    style: TextStyle(

                      fontSize: 24,

                      fontWeight:
                      FontWeight.bold,

                      height: 1.3,

                      color:
                      Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.color,
                    ),
                  ),
                ],
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

            const SizedBox(height: 20),

            Padding(

              padding:
              const EdgeInsets.only(
                bottom: 20,
                top: 10,
              ),

              child: Row(

                mainAxisAlignment:
                MainAxisAlignment.center,

                children: [

                  ElevatedButton.icon(

                    onPressed:
                    currentIndex > 0
                        ? previousQuestion
                        : null,

                    icon:
                    const Icon(Icons.arrow_back),

                    label:
                    const Text('Previous'),

                    style:
                    ElevatedButton.styleFrom(

                      elevation: 0,

                      padding:
                      const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 12,
                      ),

                      backgroundColor:
                      Colors.grey.shade200,

                      foregroundColor:
                      Colors.black87,

                      shape:
                      RoundedRectangleBorder(

                        borderRadius:
                        BorderRadius.circular(16),
                      ),
                    ),
                  ),

                  const SizedBox(width: 20),

                  ElevatedButton.icon(

                    onPressed:

                    currentIndex ==
                        questions.length - 1

                        ? finishQuiz

                        : nextQuestion,

                    icon:

                    Icon(

                      currentIndex ==
                          questions.length - 1

                          ? Icons.check

                          : Icons.arrow_forward,
                    ),

                    label:

                    Text(

                      currentIndex ==
                          questions.length - 1

                          ? 'Finish'

                          : 'Next',
                    ),

                    style:
                    ElevatedButton.styleFrom(

                      elevation: 0,

                      padding:
                      const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),

                      backgroundColor:
                      Colors.blue,

                      foregroundColor:
                      Colors.white,

                      shape:
                      RoundedRectangleBorder(

                        borderRadius:
                        BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ), )
        )//burasi
    );
  }
}