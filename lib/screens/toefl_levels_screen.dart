import 'package:flutter/material.dart';

import 'level_screen.dart';

class ToeflLevelsScreen extends StatelessWidget {
  const ToeflLevelsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('TOEFL Practice'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(

          children: [

            levelCard(
              context,
              title: 'Reading TOEFL',
              quizzes: 'Academic Reading',
              color: Colors.blue,
              level: 'reading',
              icon: Icons.chrome_reader_mode,
            ),

            levelCard(
              context,
              title: 'Vocabulary TOEFL',
              quizzes: 'Advanced Vocabulary',
              color: Colors.orange,
              level: 'vocabulary',
              icon: Icons.menu_book,
            ),

            levelCard(
              context,
              title: 'Grammar TOEFL',
              quizzes: 'Formal Grammar',
              color: Colors.green,
              level: 'grammar',
              icon: Icons.spellcheck,
            ),
          ],
        ),
      ),
    );
  }

  Widget levelCard(
      BuildContext context, {
        required String title,
        required String quizzes,
        required Color color,
        required String level,
        required IconData icon,
      }) {

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),

      child: InkWell(

        borderRadius: BorderRadius.circular(20),

        onTap: () {

          Navigator.push(
            context,

            MaterialPageRoute(
              builder: (_) => LevelScreen(

                category: 'toefl',
                level: level,
              ),
            ),
          );
        },

        child: Container(

          padding: const EdgeInsets.all(20),

          decoration: BoxDecoration(

            color: Colors.white,

            borderRadius: BorderRadius.circular(20),

            boxShadow: [

              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
              ),
            ],
          ),

          child: Row(

            children: [

              CircleAvatar(
                radius: 28,

                backgroundColor:
                color.withOpacity(0.15),

                child: Icon(
                  icon,
                  color: color,
                  size: 30,
                ),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Column(

                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    Text(
                      title,

                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      quizzes,

                      style: TextStyle(
                        color:
                        Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),

              const Icon(
                Icons.arrow_forward_ios,
              ),
            ],
          ),
        ),
      ),
    );
  }
}