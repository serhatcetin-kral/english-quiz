import 'package:flutter/material.dart';

import '../models/quiz_result.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int total;
  final List<QuizResult> results;

  const ResultScreen({
    super.key,
    required this.score,
    required this.total,
    required this.results,
  });

  @override
  Widget build(BuildContext context) {
    final percent = score / total;

    String message;
    if (percent >= 0.8) {
      message = 'Excellent!';
    } else if (percent >= 0.5) {
      message = 'Good Job!';
    } else {
      message = 'Keep Practicing!';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Result'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
              child: Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  children: [
                    Text(
                      message,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      '$score / $total',
                      style: const TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, index) {
                  final item = results[index];

                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: Icon(
                        item.isCorrect ? Icons.check_circle : Icons.cancel,
                        color: item.isCorrect ? Colors.green : Colors.red,
                      ),
                      title: Text(
                        item.question.question,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        item.isCorrect
                            ? 'Correct: ${item.question.answer}'
                            : 'Your answer: ${item.selectedAnswer}\nCorrect answer: ${item.question.answer}',
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: const Padding(
                  padding: EdgeInsets.all(14),
                  child: Text(
                    'Back to Home',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}