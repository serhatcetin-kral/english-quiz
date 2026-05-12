import 'package:flutter/material.dart';

import 'quiz_screen.dart';

class LevelScreen extends StatelessWidget {

  final String category;

  const LevelScreen({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(category),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(

          children: [

            _buildLevelButton(
              context,
              'Beginner',
              Colors.green,
            ),

            const SizedBox(height: 20),

            _buildLevelButton(
              context,
              'Intermediate',
              Colors.orange,
            ),

            const SizedBox(height: 20),

            _buildLevelButton(
              context,
              'Advanced',
              Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLevelButton(
      BuildContext context,
      String level,
      Color color,
      ) {

    return SizedBox(

      width: double.infinity,
      height: 80,

      child: ElevatedButton(

        onPressed: () {

          Navigator.push(
            context,

            MaterialPageRoute(

              builder: (_) => QuizScreen(
                category: category,
                level: level.toLowerCase(),
              ),
            ),
          );
        },

        style: ElevatedButton.styleFrom(
          backgroundColor: color,

          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(20),
          ),
        ),

        child: Text(

          level,

          style: const TextStyle(
            fontSize: 24,
            fontWeight:
            FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}