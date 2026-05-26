import 'package:english_quiz/screens/spelling_levels_screen.dart';
import 'package:flutter/material.dart';
import 'idioms_screen.dart';
import 'toefl_levels_screen.dart';
import 'kids_levels_screen.dart';
import 'level_screen.dart';
import 'vocabulary_levels_screen.dart';
import 'phrasal_verbs_levels_screen.dart';
import 'reading_levels_screen.dart';
import 'grammar_levels_screen.dart';
import 'dictionary_screen.dart';
import 'ielts_screen.dart';
import 'sat_screen.dart';
import '../widgets/banner_ad_widget.dart';
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
      {
        'title': 'Dictionary',
        'icon': Icons.book,
        'category': 'dictionary',

        'color1': const Color(0xFF4776E6),
        'color2': const Color(0xFF8E54E9),
      },

      {
        'title': 'Idioms',
        'icon': Icons.chat,
        'category': 'idioms',

        'color1': const Color(0xFF56AB2F),
        'color2': const Color(0xFFA8E063),
      },
      // {
      //   'title': 'TOEFL',
      //   'icon': Icons.school,
      //   'category': 'toefl',
      //
      //   'color1': const Color(0xFF6A11CB),
      //   'color2': const Color(0xFF2575FC),
      // },
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

      body: Column(

          children: [

      Expanded(

      child:  Padding(
        padding: const EdgeInsets.all(18),

        child: Column(

          children: [

            InkWell(

              borderRadius:
              BorderRadius.circular(28),

              onTap: () {

                Navigator.push(
                  context,

                  MaterialPageRoute(
                    builder: (_) =>
                    const ToeflLevelsScreen(),
                  ),
                );
              },

              child: Container(

                width: double.infinity,

                padding: const EdgeInsets.all(24),

                decoration: BoxDecoration(

                  gradient: const LinearGradient(

                    colors: [

                      Color(0xFF6A11CB),
                      Color(0xFF2575FC),
                    ],

                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),

                  borderRadius:
                  BorderRadius.circular(28),

                  boxShadow: [

                    BoxShadow(
                      color:
                      Colors.blue.withOpacity(0.25),

                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),

                child: Row(

                  children: [

                    Container(

                      padding: const EdgeInsets.all(18),

                      decoration: BoxDecoration(

                        color:
                        Colors.white.withOpacity(0.18),

                        shape: BoxShape.circle,
                      ),

                      child: const Icon(

                        Icons.school,

                        color: Colors.white,
                        size: 38,
                      ),
                    ),

                    const SizedBox(width: 18),

                    const Expanded(

                      child: Column(

                        crossAxisAlignment:
                        CrossAxisAlignment.start,

                        children: [

                          Text(

                            'TOEFL Practice',

                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 8),

                          Text(

                            'Academic English Preparation',

                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(

                      padding: const EdgeInsets.all(12),

                      decoration: BoxDecoration(

                        color:
                        Colors.white.withOpacity(0.18),

                        shape: BoxShape.circle,
                      ),

                      child: const Icon(

                        Icons.arrow_forward_ios,

                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 22),
            InkWell(

              borderRadius: BorderRadius.circular(28),

              onTap: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const IELTScreen(),
                  ),
                );
              },

              child: Container(

                width: double.infinity,

                padding: const EdgeInsets.all(24),

                decoration: BoxDecoration(

                  gradient: const LinearGradient(

                    colors: [

                      Color(0xFFFF6A00),
                      Color(0xFFEE0979),
                    ],

                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),

                  borderRadius: BorderRadius.circular(28),

                  boxShadow: [

                    BoxShadow(
                      color: Colors.orange.withOpacity(0.25),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),

                child: Row(

                  children: [

                    Container(

                      padding: const EdgeInsets.all(18),

                      decoration: BoxDecoration(

                        color: Colors.white.withOpacity(0.18),
                        shape: BoxShape.circle,
                      ),

                      child: const Icon(

                        Icons.language,

                        color: Colors.white,
                        size: 38,
                      ),
                    ),

                    const SizedBox(width: 18),

                    const Expanded(

                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [

                          Text(

                            'IELTS Practice',

                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 8),

                          Text(

                            'International English Preparation',

                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(

                      padding: const EdgeInsets.all(12),

                      decoration: BoxDecoration(

                        color: Colors.white.withOpacity(0.18),
                        shape: BoxShape.circle,
                      ),

                      child: const Icon(

                        Icons.arrow_forward_ios,

                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 22),

            InkWell(

              borderRadius: BorderRadius.circular(28),

              onTap: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SatScreen(),
                  ),
                );
              },

              child: Container(

                width: double.infinity,

                padding: const EdgeInsets.all(24),

                decoration: BoxDecoration(

                  gradient: const LinearGradient(

                    colors: [

                      Color(0xFF8E2DE2),
                      Color(0xFF4A00E0),
                    ],

                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),

                  borderRadius: BorderRadius.circular(28),

                  boxShadow: [

                    BoxShadow(
                      color: Colors.purple.withOpacity(0.25),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),

                child: Row(

                  children: [

                    Container(

                      padding: const EdgeInsets.all(18),

                      decoration: BoxDecoration(

                        color: Colors.white.withOpacity(0.18),
                        shape: BoxShape.circle,
                      ),

                      child: const Icon(

                        Icons.workspace_premium,

                        color: Colors.white,
                        size: 38,
                      ),
                    ),

                    const SizedBox(width: 18),

                    const Expanded(

                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [

                          Text(

                            'SAT Practice',

                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 8),

                          Text(

                            'SAT Vocabulary & Grammar',

                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(

                      padding: const EdgeInsets.all(12),

                      decoration: BoxDecoration(

                        color: Colors.white.withOpacity(0.18),
                        shape: BoxShape.circle,
                      ),

                      child: const Icon(

                        Icons.arrow_forward_ios,

                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 22),

            Expanded(

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

                    borderRadius:
                    BorderRadius.circular(30),

                    onTap: () {

                      if (item['category'] ==
                          'vocabulary') {

                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (_) =>
                            const VocabularyLevelsScreen(),
                          ),
                        );
                      }

                      else if (item['category'] ==
                          'phrasal_verbs') {

                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (_) =>
                            const PhrasalVerbsLevelsScreen(),
                          ),
                        );
                      }

                      else if (item['category'] ==
                          'reading') {

                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (_) =>
                            const ReadingLevelsScreen(),
                          ),
                        );
                      }

                      else if (item['category'] ==
                          'grammar') {

                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (_) =>
                            const GrammarLevelsScreen(),
                          ),
                        );
                      }

                      else if (item['category'] ==
                          'kids') {

                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (_) =>
                            const KidsLevelsScreen(),
                          ),
                        );
                      }

                      else if (item['category'] ==
                          'spelling') {

                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (_) =>
                            const SpellingLevelsScreen(),
                          ),
                        );
                      }

                      else if (item['category'] ==
                          'dictionary') {

                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (_) =>
                            const DictionaryScreen(),
                          ),
                        );
                      }

                      else if (item['category'] ==
                          'toefl') {

                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (_) =>
                            const ToeflLevelsScreen(),
                          ),
                        );
                      }
                      else if (item['category'] == 'ielts') {

                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (_) => const IELTScreen(),
                          ),
                        );
                      }
                      else if (item['category'] == 'idioms') {

                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (_) => const IdiomsLevelsScreen(),
                          ),
                        );
                      }
                      else if (item['category'] == 'sat') {

                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (_) => const SatScreen(),
                          ),
                        );
                      }


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

                        borderRadius:
                        BorderRadius.circular(30),

                        boxShadow: [

                          BoxShadow(
                            color:
                            (item['color1'] as Color)
                                .withOpacity(0.35),

                            blurRadius: 14,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),

                      child: Padding(
                        padding:
                        const EdgeInsets.all(18),

                        child: Column(

                          crossAxisAlignment:
                          CrossAxisAlignment.start,

                          children: [

                            Container(

                              padding:
                              const EdgeInsets.all(14),

                              decoration: BoxDecoration(

                                color:
                                Colors.white
                                    .withOpacity(0.18),

                                shape: BoxShape.circle,
                              ),

                              child: Icon(
                                item['icon']
                                as IconData,

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
                                fontWeight:
                                FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 8),

                            Text(

                              "Start learning now",

                              style: TextStyle(
                                color:
                                Colors.white
                                    .withOpacity(0.9),

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

                                    fontWeight:
                                    FontWeight.w600,
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
          ],
        ),
      ),
      ),

    const BannerAdWidget(),

    const SizedBox(height: 8),
    ],
    ),
    );
  }
}