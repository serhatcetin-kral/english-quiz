import 'package:flutter/material.dart';

import 'level_screen.dart';
import 'vocabulary_levels_screen.dart';
import 'phrasal_verbs_levels_screen.dart';
import 'reading_levels_screen.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final categories = [

      {
        'title': 'Reading',
        'icon': Icons.chrome_reader_mode,
        'category': 'reading',
        'color1': const Color(0xFF6A11CB),
        'color2': const Color(0xFF2575FC),
      },

      {
        'title': 'Vocabulary',
        'icon': Icons.menu_book,
        'category': 'vocabulary',
        'color1': const Color(0xFF11998E),
        'color2': const Color(0xFF38EF7D),
      },

      {
        'title': 'Grammar',
        'icon': Icons.spellcheck,
        'category': 'grammar',
        'color1': const Color(0xFFFF9966),
        'color2': const Color(0xFFFF5E62),
      },

      {
        'title': 'Phrasal Verbs',
        'icon': Icons.translate,
        'category': 'phrasal_verbs',
        'color1': const Color(0xFF8E2DE2),
        'color2': const Color(0xFF4A00E0),
      },

      {
        'title': 'Kids',
        'icon': Icons.child_care,
        'category': 'kids',
        'color1': const Color(0xFFFFC371),
        'color2': const Color(0xFFFF5F6D),
      },

      {
        'title': 'Spelling',
        'icon': Icons.edit,
        'category': 'spelling',
        'color1': const Color(0xFF36D1DC),
        'color2': const Color(0xFF5B86E5),
      },
    ];

    return Scaffold(

      backgroundColor: const Color(0xFFF4F7FB),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,

        title: const Column(
          children: [

            Text(
              'English Quiz',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 4),

            Text(
              'Improve your English skills',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(18),

        child: GridView.builder(

          itemCount: categories.length,

          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(

            crossAxisCount: 2,
            crossAxisSpacing: 18,
            mainAxisSpacing: 18,
            childAspectRatio: 0.88,
          ),

          itemBuilder: (context, index) {

            final item = categories[index];

            return InkWell(

              borderRadius: BorderRadius.circular(30),

              onTap: () {

                // VOCABULARY
                if (item['category'] == 'vocabulary') {

                  Navigator.push(
                    context,

                    MaterialPageRoute(
                      builder: (_) =>
                      const VocabularyLevelsScreen(),
                    ),
                  );
                }

                // PHRASAL VERBS
                else if (item['category'] == 'phrasal_verbs') {

                  Navigator.push(
                    context,

                    MaterialPageRoute(
                      builder: (_) =>
                      const PhrasalVerbsLevelsScreen(),
                    ),
                  );
                }
                else if (item['category'] == 'reading') {

                  Navigator.push(
                    context,

                    MaterialPageRoute(
                      builder: (_) =>
                      const ReadingLevelsScreen(),
                    ),
                  );
                }

                // OTHER CATEGORIES
                else {

                  Navigator.push(
                    context,

                    MaterialPageRoute(
                      builder: (_) => LevelScreen(

                        category:
                        item['category'].toString(),

                        level: 'beginner',

                      ),
                    ),
                  );
                }
              },

              child: Container(

                decoration: BoxDecoration(

                  gradient: LinearGradient(

                    colors: [

                      item['color1'] as Color,
                      item['color2'] as Color,

                    ],

                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),

                  borderRadius: BorderRadius.circular(30),

                  boxShadow: [

                    BoxShadow(
                      color: (item['color1'] as Color)
                          .withOpacity(0.35),

                      blurRadius: 14,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),

                child: Padding(
                  padding: const EdgeInsets.all(18),

                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [

                      Container(

                        padding: const EdgeInsets.all(14),

                        decoration: BoxDecoration(
                          color:
                          Colors.white.withOpacity(0.18),

                          shape: BoxShape.circle,
                        ),

                        child: Icon(
                          item['icon'] as IconData,
                          size: 34,
                          color: Colors.white,
                        ),
                      ),

                      const Spacer(),

                      Text(

                        item['title'].toString(),

                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(

                        "Start learning now",

                        style: TextStyle(
                          color:
                          Colors.white.withOpacity(0.9),

                          fontSize: 13,
                        ),
                      ),

                      const SizedBox(height: 14),

                      Row(
                        children: [

                          const Icon(
                            Icons.play_circle_fill,
                            color: Colors.white,
                            size: 22,
                          ),

                          const SizedBox(width: 6),

                          Text(
                            "Start",

                            style: TextStyle(
                              color: Colors.white
                                  .withOpacity(0.95),

                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}