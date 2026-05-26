import 'package:flutter/material.dart';

import 'level_screen.dart';
import '../widgets/banner_ad_widget.dart';

class SATWordsQuizLevelsScreen extends StatelessWidget {

  const SATWordsQuizLevelsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xFFF4F7FB),

      appBar: AppBar(

        title: const Text(
          'SAT Words Quiz',
        ),

        centerTitle: true,
      ),

      body: SafeArea(

        child: Column(

          children: [

            Expanded(

              child: Padding(

                padding: const EdgeInsets.all(18),

                child: Column(

                  children: [

                    _levelCard(

                      context,

                      title: 'Beginner',

                      subtitle:
                      'Start with basic SAT vocabulary',

                      icon:
                      Icons.star_border_rounded,

                      color1:
                      const Color(0xFF11998E),

                      color2:
                      const Color(0xFF38EF7D),

                      level: 'beginner',
                    ),

                    const SizedBox(height: 18),

                    _levelCard(

                      context,

                      title: 'Intermediate',

                      subtitle:
                      'Practice stronger SAT words',

                      icon:
                      Icons.local_fire_department_rounded,

                      color1:
                      const Color(0xFFFF9966),

                      color2:
                      const Color(0xFFFF5E62),

                      level: 'intermediate',
                    ),

                    const SizedBox(height: 18),

                    _levelCard(

                      context,

                      title: 'Advanced',

                      subtitle:
                      'Challenge yourself with harder words',

                      icon:
                      Icons.workspace_premium_rounded,

                      color1:
                      const Color(0xFF8E2DE2),

                      color2:
                      const Color(0xFF4A00E0),

                      level: 'advanced',
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

  Widget _levelCard(

      BuildContext context, {

        required String title,

        required String subtitle,

        required IconData icon,

        required Color color1,

        required Color color2,

        required String level,
      }) {

    return InkWell(

      borderRadius:
      BorderRadius.circular(28),

      onTap: () {

        Navigator.push(

          context,

          MaterialPageRoute(

            builder: (_) => LevelScreen(

              category: 'sat_words_quiz',

              level: level,
            ),
          ),
        );
      },

      child: Container(

        width: double.infinity,

        padding: const EdgeInsets.all(22),

        decoration: BoxDecoration(

          gradient: LinearGradient(

            colors: [color1, color2],

            begin: Alignment.topLeft,

            end: Alignment.bottomRight,
          ),

          borderRadius:
          BorderRadius.circular(28),

          boxShadow: [

            BoxShadow(

              color:
              color1.withOpacity(0.25),

              blurRadius: 16,

              offset: const Offset(0, 8),
            ),
          ],
        ),

        child: Row(

          children: [

            Container(

              padding:
              const EdgeInsets.all(16),

              decoration: BoxDecoration(

                color:
                Colors.white.withOpacity(0.18),

                shape: BoxShape.circle,
              ),

              child: Icon(

                icon,

                color: Colors.white,

                size: 34,
              ),
            ),

            const SizedBox(width: 18),

            Expanded(

              child: Column(

                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  Text(

                    title,

                    style: const TextStyle(

                      color: Colors.white,

                      fontSize: 25,

                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(

                    subtitle,

                    style: const TextStyle(

                      color: Colors.white70,

                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            const Icon(

              Icons.arrow_forward_ios_rounded,

              color: Colors.white,

              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}