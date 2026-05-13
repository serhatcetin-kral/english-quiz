import 'package:flutter/material.dart';

import '../models/quiz_result.dart';

import 'home_screen.dart';

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

    final percentage =
    ((score / total) * 100)
        .toInt();

    String message = '👏 Good Job!';

    if (percentage >= 90) {
      message = '🎉 Excellent!';
    } else if (percentage >= 70) {
      message = '🔥 Great Work!';
    } else if (percentage >= 50) {
      message = '🙂 Keep Practicing!';
    } else {
      message = '💪 Don\'t Give Up!';
    }

    return Scaffold(

      backgroundColor:
      const Color(0xFFF5F7FB),

      appBar: AppBar(

        title:
        const Text('Quiz Result'),

        centerTitle: true,

        backgroundColor:
        Colors.transparent,

        elevation: 0,
      ),

      body: Padding(

        padding:
        const EdgeInsets.all(16),

        child: Column(

          children: [

            Container(

              width: 180,
              height: 180,

              decoration: BoxDecoration(

                shape: BoxShape.circle,

                gradient: LinearGradient(

                  colors: percentage >= 70

                      ? [
                    Colors.green,
                    Colors.greenAccent,
                  ]

                      : [
                    Colors.orange,
                    Colors.deepOrange,
                  ],
                ),

                boxShadow: [

                  BoxShadow(

                    color:
                    Colors.black.withOpacity(0.15),

                    blurRadius: 20,

                    offset:
                    const Offset(0, 8),
                  ),
                ],
              ),

              child: Center(

                child: Column(

                  mainAxisAlignment:
                  MainAxisAlignment.center,

                  children: [

                    Text(

                      '$score/$total',

                      style:
                      const TextStyle(

                        color: Colors.white,

                        fontSize: 40,

                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(

                      '$percentage%',

                      style:
                      const TextStyle(

                        color: Colors.white,

                        fontSize: 24,

                        fontWeight:
                        FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            Text(

              message,

              style: const TextStyle(

                fontSize: 28,

                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            Expanded(

              child: ListView.builder(

                itemCount:
                results.length,

                itemBuilder:
                    (context, index) {

                  final result =
                  results[index];

                  return Container(

                    margin:
                    const EdgeInsets.only(
                      bottom: 16,
                    ),

                    padding:
                    const EdgeInsets.all(18),

                    decoration:
                    BoxDecoration(

                      color: Colors.white,

                      borderRadius:
                      BorderRadius.circular(24),

                      boxShadow: [

                        BoxShadow(

                          color:
                          Colors.black.withOpacity(0.05),

                          blurRadius: 12,

                          offset:
                          const Offset(0, 5),
                        ),
                      ],
                    ),

                    child: Column(

                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [

                        Row(

                          children: [

                            Icon(

                              result.isCorrect

                                  ? Icons.check_circle

                                  : Icons.cancel,

                              color:
                              result.isCorrect

                                  ? Colors.green

                                  : Colors.red,
                            ),

                            const SizedBox(width: 10),

                            Expanded(

                              child: Text(

                                result.question.question,

                                style:
                                const TextStyle(

                                  fontSize: 18,

                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 14),

                        Text(

                          'Your Answer: ${result.selectedAnswer}',

                          style: TextStyle(

                            fontSize: 16,

                            color:
                            result.isCorrect

                                ? Colors.green

                                : Colors.red,
                          ),
                        ),

                        if (!result.isCorrect)

                          Padding(

                            padding:
                            const EdgeInsets.only(
                              top: 8,
                            ),

                            child: Text(

                              'Correct Answer: ${result.question.answer}',

                              style:
                              const TextStyle(

                                fontSize: 16,

                                color:
                                Colors.green,

                                fontWeight:
                                FontWeight.w600,
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            Row(

              children: [

                Expanded(

                  child:
                  ElevatedButton.icon(

                    onPressed: () {

                      Navigator.pushAndRemoveUntil(

                        context,

                        MaterialPageRoute(

                          builder:
                              (_) =>
                          const HomeScreen(),
                        ),

                            (route) => false,
                      );
                    },

                    icon:
                    const Icon(Icons.home),

                    label:
                    const Text('Home'),

                    style:
                    ElevatedButton.styleFrom(

                      padding:
                      const EdgeInsets.symmetric(
                        vertical: 16,
                      ),

                      backgroundColor:
                      Colors.grey.shade300,

                      foregroundColor:
                      Colors.black,

                      shape:
                      RoundedRectangleBorder(

                        borderRadius:
                        BorderRadius.circular(18),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 14),

                Expanded(

                  child:
                  ElevatedButton.icon(

                    onPressed: () {

                      Navigator.pop(context);
                    },

                    icon:
                    const Icon(Icons.refresh),

                    label:
                    const Text('Retry'),

                    style:
                    ElevatedButton.styleFrom(

                      padding:
                      const EdgeInsets.symmetric(
                        vertical: 16,
                      ),

                      backgroundColor:
                      Colors.blue,

                      foregroundColor:
                      Colors.white,

                      shape:
                      RoundedRectangleBorder(

                        borderRadius:
                        BorderRadius.circular(18),
                      ),
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