import 'package:flutter/material.dart';

import '../models/quiz_question.dart';
import '../services/quiz_service.dart';

class QuizScreen extends StatefulWidget {

  final String category;

  const QuizScreen({
    super.key,
    required this.category,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  List<QuizQuestion> questions = [];

  int currentIndex = 0;
  int score = 0;

  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadQuiz();
  }

  Future<void> loadQuiz() async {

    questions =
    await QuizService.loadQuestions(
      widget.category,
    );

    setState(() {
      loading = false;
    });
  }

  void checkAnswer(String selected) {

    if (selected ==
        questions[currentIndex].answer) {

      score++;
    }

    if (currentIndex <
        questions.length - 1) {

      setState(() {
        currentIndex++;
      });

    } else {

      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Quiz Finished'),

          content: Text(
            'Your Score: $score/${questions.length}',
          ),

          actions: [

            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },

              child: const Text('OK'),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    if (loading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final question =
    questions[currentIndex];

    return Scaffold(

      appBar: AppBar(
        title: Text(widget.category),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(

          crossAxisAlignment:
          CrossAxisAlignment.stretch,

          children: [

            Text(
              'Question ${currentIndex + 1}/${questions.length}',

              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            Text(
              question.question,

              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            ...question.options.map((option) {

              return Padding(
                padding:
                const EdgeInsets.only(
                  bottom: 12,
                ),

                child: ElevatedButton(

                  onPressed: () {
                    checkAnswer(option);
                  },

                  child: Padding(
                    padding:
                    const EdgeInsets.all(16),

                    child: Text(
                      option,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}