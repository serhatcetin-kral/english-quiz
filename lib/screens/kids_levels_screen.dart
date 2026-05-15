import 'package:flutter/material.dart';

import 'level_screen.dart';

class KidsLevelsScreen extends StatelessWidget {
  const KidsLevelsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('Kids English'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(

          children: [

            levelCard(
              context,
              title: 'Easy',
              quizzes: '3 Fun Quizzes',
              color: Colors.pink,
              level: 'beginner',
            ),

            levelCard(
              context,
              title: 'Medium',
              quizzes: '4 Fun Quizzes',
              color: Colors.orange,
              level: 'intermediate',
            ),

            levelCard(
              context,
              title: 'Hard',
              quizzes: '5 Fun Quizzes',
              color: Colors.purple,
              level: 'advanced',
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

                category: 'kids',
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
                backgroundColor: color.withOpacity(0.15),

                child: Icon(
                  Icons.child_care,
                  color: color,
                  size: 30,
                ),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      quizzes,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),

              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}