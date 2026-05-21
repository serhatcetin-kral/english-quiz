import 'package:flutter/material.dart';

import 'sat_words_quiz_levels_screen.dart';

class SatScreen extends StatelessWidget {
  const SatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SAT Preparation'),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const Text(
              'Build your SAT skills',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Practice vocabulary, grammar, spelling and reading.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 25),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,

                children: [

                  _buildCard(
                    context,
                    title: 'SAT Words',
                    icon: Icons.menu_book_rounded,
                    color: Colors.blue,
                  ),

                  _buildCard(
                    context,
                    title: 'SAT Words Quiz',
                    icon: Icons.quiz_rounded,
                    color: Colors.purple,
                  ),

                  _buildCard(
                    context,
                    title: 'SAT Grammar',
                    icon: Icons.edit_note_rounded,
                    color: Colors.orange,
                  ),

                  _buildCard(
                    context,
                    title: 'SAT Spelling',
                    icon: Icons.spellcheck_rounded,
                    color: Colors.green,
                  ),

                  _buildCard(
                    context,
                    title: 'SAT Reading',
                    icon: Icons.auto_stories_rounded,
                    color: Colors.red,
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildCard(
      BuildContext context, {
        required String title,
        required IconData icon,
        required Color color,
      }) {

    return GestureDetector(

      onTap: () {

        // SAT WORDS QUIZ
        if (title == 'SAT Words Quiz') {

          Navigator.push(
            context,

            MaterialPageRoute(
              builder: (_) =>
              const SATWordsQuizLevelsScreen(),
            ),
          );
        }

        // SAT WORDS
        else if (title == 'SAT Words') {

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('SAT Words Coming Soon'),
            ),
          );
        }

        // OTHER SECTIONS
        else {

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('$title Coming Soon'),
            ),
          );
        }
      },

      child: Container(

        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(25),

          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.4),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Icon(
              icon,
              size: 55,
              color: Colors.white,
            ),

            const SizedBox(height: 15),

            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 10),

              child: Text(
                title,
                textAlign: TextAlign.center,

                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}