import 'package:flutter/material.dart';

import 'sat_words_list_screen.dart';
import '../widgets/banner_ad_widget.dart';

class SATWordsLevelsScreen extends StatelessWidget {

  const SATWordsLevelsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text(
          'SAT Words',
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

                    _buildLevelCard(

                      context,

                      title: 'Beginner',

                      color1: const Color(0xFF11998E),

                      color2: const Color(0xFF38EF7D),

                      level: 'beginner',
                    ),

                    const SizedBox(height: 18),

                    _buildLevelCard(

                      context,

                      title: 'Intermediate',

                      color1: const Color(0xFFFF9966),

                      color2: const Color(0xFFFF5E62),

                      level: 'intermediate',
                    ),

                    const SizedBox(height: 18),

                    _buildLevelCard(

                      context,

                      title: 'Advanced',

                      color1: const Color(0xFF8E2DE2),

                      color2: const Color(0xFF4A00E0),

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

  Widget _buildLevelCard(

      BuildContext context, {

        required String title,

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

            builder: (_) =>
                SATWordsListScreen(
                  level: level,
                ),
          ),
        );
      },

      child: Container(

        width: double.infinity,

        padding:
        const EdgeInsets.all(24),

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
              const EdgeInsets.all(18),

              decoration: BoxDecoration(

                color:
                Colors.white.withOpacity(0.18),

                shape: BoxShape.circle,
              ),

              child: const Icon(

                Icons.menu_book_rounded,

                color: Colors.white,

                size: 34,
              ),
            ),

            const SizedBox(width: 18),

            Expanded(

              child: Text(

                title,

                style: const TextStyle(

                  color: Colors.white,

                  fontSize: 28,

                  fontWeight:
                  FontWeight.bold,
                ),
              ),
            ),

            const Icon(

              Icons.arrow_forward_ios,

              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}