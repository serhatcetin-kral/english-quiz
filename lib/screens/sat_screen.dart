import 'package:flutter/material.dart';

import 'sat_words_quiz_levels_screen.dart';
import 'sat_words_levels_screen.dart';
import 'sat_grammar_levels_screen.dart';
import 'sat_spelling_levels_screen.dart';
import 'sat_reading_levels_screen.dart';
import '../widgets/banner_ad_widget.dart';

class SatScreen extends StatelessWidget {

  const SatScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text(
          'SAT Preparation',
        ),

        centerTitle: true,
      ),

      body: SafeArea(

        child: Column(

          children: [

            Expanded(

              child: Padding(

                padding: const EdgeInsets.all(16),

                child: Column(

                  crossAxisAlignment:
                  CrossAxisAlignment.start,

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
            ),

            const BannerAdWidget(),

            const SizedBox(height: 8),
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

        if (title == 'SAT Words Quiz') {

          Navigator.push(

            context,

            MaterialPageRoute(

              builder: (_) =>
              const SATWordsQuizLevelsScreen(),
            ),
          );
        }

        else if (title == 'SAT Words') {

          Navigator.push(

            context,

            MaterialPageRoute(

              builder: (_) =>
              const SATWordsLevelsScreen(),
            ),
          );
        }

        else if (title == 'SAT Grammar') {

          Navigator.push(

            context,

            MaterialPageRoute(

              builder: (_) =>
              const SATGrammarLevelsScreen(),
            ),
          );
        }

        else if (title == 'SAT Spelling') {

          Navigator.push(

            context,

            MaterialPageRoute(

              builder: (_) =>
              const SATSpellingLevelsScreen(),
            ),
          );
        }

        else if (title == 'SAT Reading') {

          Navigator.push(

            context,

            MaterialPageRoute(

              builder: (_) =>
              const SATReadingLevelsScreen(),
            ),
          );
        }

        else {

          ScaffoldMessenger.of(context).showSnackBar(

            SnackBar(

              content:
              Text('$title Coming Soon'),
            ),
          );
        }
      },

      child: Container(

        decoration: BoxDecoration(

          color: color,

          borderRadius:
          BorderRadius.circular(25),

          boxShadow: [

            BoxShadow(

              color:
              color.withOpacity(0.4),

              blurRadius: 10,

              offset: const Offset(0, 5),
            ),
          ],
        ),

        child: Column(

          mainAxisAlignment:
          MainAxisAlignment.center,

          children: [

            Icon(

              icon,

              size: 55,

              color: Colors.white,
            ),

            const SizedBox(height: 15),

            Padding(

              padding:
              const EdgeInsets.symmetric(
                horizontal: 10,
              ),

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