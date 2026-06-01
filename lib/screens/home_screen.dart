// import 'package:english_quiz/screens/spelling_levels_screen.dart';
// import 'package:flutter/material.dart';
// import 'idioms_screen.dart';
// import 'toefl_levels_screen.dart';
// import 'kids_levels_screen.dart';
// import 'level_screen.dart';
// import 'vocabulary_levels_screen.dart';
// import 'phrasal_verbs_levels_screen.dart';
// import 'reading_levels_screen.dart';
// import 'grammar_levels_screen.dart';
// import 'dictionary_screen.dart';
// import 'ielts_screen.dart';
// import 'sat_screen.dart';
// import '../widgets/banner_ad_widget.dart';
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     final categories = [
//
//
//       {
//         'title': 'Reading',
//         'icon': Icons.chrome_reader_mode,
//         'category': 'reading',
//         'color1': const Color(0xFF6A11CB),
//         'color2': const Color(0xFF2575FC),
//       },
//
//       {
//         'title': 'Vocabulary',
//         'icon': Icons.menu_book,
//         'category': 'vocabulary',
//         'color1': const Color(0xFF11998E),
//         'color2': const Color(0xFF38EF7D),
//       },
//
//       {
//         'title': 'Grammar',
//         'icon': Icons.spellcheck,
//         'category': 'grammar',
//         'color1': const Color(0xFFFF9966),
//         'color2': const Color(0xFFFF5E62),
//       },
//
//       {
//         'title': 'Phrasal Verbs',
//         'icon': Icons.translate,
//         'category': 'phrasal_verbs',
//         'color1': const Color(0xFF8E2DE2),
//         'color2': const Color(0xFF4A00E0),
//       },
//
//       {
//         'title': 'Kids',
//         'icon': Icons.child_care,
//         'category': 'kids',
//         'color1': const Color(0xFFFFC371),
//         'color2': const Color(0xFFFF5F6D),
//       },
//
//       {
//         'title': 'Spelling',
//         'icon': Icons.edit,
//         'category': 'spelling',
//         'color1': const Color(0xFF36D1DC),
//         'color2': const Color(0xFF5B86E5),
//       },
//       {
//         'title': 'Dictionary',
//         'icon': Icons.book,
//         'category': 'dictionary',
//
//         'color1': const Color(0xFF4776E6),
//         'color2': const Color(0xFF8E54E9),
//       },
//
//       {
//         'title': 'Idioms',
//         'icon': Icons.chat,
//         'category': 'idioms',
//
//         'color1': const Color(0xFF56AB2F),
//         'color2': const Color(0xFFA8E063),
//       },
//       // {
//       //   'title': 'TOEFL',
//       //   'icon': Icons.school,
//       //   'category': 'toefl',
//       //
//       //   'color1': const Color(0xFF6A11CB),
//       //   'color2': const Color(0xFF2575FC),
//       // },
//     ];
//
//     return Scaffold(
//
//       backgroundColor: const Color(0xFFF4F7FB),
//
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         centerTitle: true,
//
//         title: const Column(
//           children: [
//
//             Text(
//               'English Quiz',
//               style: TextStyle(
//                 color: Colors.black87,
//                 fontSize: 26,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//
//             SizedBox(height: 4),
//
//             Text(
//               'Improve your English skills',
//               style: TextStyle(
//                 color: Colors.grey,
//                 fontSize: 13,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ],
//         ),
//       ),
//
//         body: SafeArea(
//             child: SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.all(18),
//                   child: Column(
//
//           children: [
//             Expanded(
//                   child: SingleChildScrollView(
//                   child: Padding(
//         padding: const EdgeInsets.all(18),
//
//         child: Column(
//
//           children: [
//
//             InkWell(
//
//               borderRadius:
//               BorderRadius.circular(28),
//
//               onTap: () {
//
//                 Navigator.push(
//                   context,
//
//                   MaterialPageRoute(
//                     builder: (_) =>
//                     const ToeflLevelsScreen(),
//                   ),
//                 );
//               },
//
//               child: Container(
//
//                 width: double.infinity,
//
//                 padding: const EdgeInsets.all(24),
//
//                 decoration: BoxDecoration(
//
//                   gradient: const LinearGradient(
//
//                     colors: [
//
//                       Color(0xFF6A11CB),
//                       Color(0xFF2575FC),
//                     ],
//
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//
//                   borderRadius:
//                   BorderRadius.circular(28),
//
//                   boxShadow: [
//
//                     BoxShadow(
//                       color:
//                       Colors.blue.withOpacity(0.25),
//
//                       blurRadius: 16,
//                       offset: const Offset(0, 8),
//                     ),
//                   ],
//                 ),
//
//                 child: Row(
//
//                   children: [
//
//                     Container(
//
//                       padding: const EdgeInsets.all(18),
//
//                       decoration: BoxDecoration(
//
//                         color:
//                         Colors.white.withOpacity(0.18),
//
//                         shape: BoxShape.circle,
//                       ),
//
//                       child: const Icon(
//
//                         Icons.school,
//
//                         color: Colors.white,
//                         size: 38,
//                       ),
//                     ),
//
//                     const SizedBox(width: 18),
//
//                     const Expanded(
//
//                       child: Column(
//
//                         crossAxisAlignment:
//                         CrossAxisAlignment.start,
//
//                         children: [
//
//                           Text(
//
//                             'TOEFL Practice',
//
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 26,
//                               fontWeight:
//                               FontWeight.bold,
//                             ),
//                           ),
//
//                           SizedBox(height: 8),
//
//                           Text(
//
//                             'Academic English Preparation',
//
//                             style: TextStyle(
//                               color: Colors.white70,
//                               fontSize: 15,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//
//                     Container(
//
//                       padding: const EdgeInsets.all(12),
//
//                       decoration: BoxDecoration(
//
//                         color:
//                         Colors.white.withOpacity(0.18),
//
//                         shape: BoxShape.circle,
//                       ),
//
//                       child: const Icon(
//
//                         Icons.arrow_forward_ios,
//
//                         color: Colors.white,
//                         size: 18,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//
//             const SizedBox(height: 22),
//             InkWell(
//
//               borderRadius: BorderRadius.circular(28),
//
//               onTap: () {
//
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (_) => const IELTScreen(),
//                   ),
//                 );
//               },
//
//               child: Container(
//
//                 width: double.infinity,
//
//                 padding: const EdgeInsets.all(24),
//
//                 decoration: BoxDecoration(
//
//                   gradient: const LinearGradient(
//
//                     colors: [
//
//                       Color(0xFFFF6A00),
//                       Color(0xFFEE0979),
//                     ],
//
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//
//                   borderRadius: BorderRadius.circular(28),
//
//                   boxShadow: [
//
//                     BoxShadow(
//                       color: Colors.orange.withOpacity(0.25),
//                       blurRadius: 16,
//                       offset: const Offset(0, 8),
//                     ),
//                   ],
//                 ),
//
//                 child: Row(
//
//                   children: [
//
//                     Container(
//
//                       padding: const EdgeInsets.all(18),
//
//                       decoration: BoxDecoration(
//
//                         color: Colors.white.withOpacity(0.18),
//                         shape: BoxShape.circle,
//                       ),
//
//                       child: const Icon(
//
//                         Icons.language,
//
//                         color: Colors.white,
//                         size: 38,
//                       ),
//                     ),
//
//                     const SizedBox(width: 18),
//
//                     const Expanded(
//
//                       child: Column(
//
//                         crossAxisAlignment: CrossAxisAlignment.start,
//
//                         children: [
//
//                           Text(
//
//                             'IELTS Practice',
//
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 26,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//
//                           SizedBox(height: 8),
//
//                           Text(
//
//                             'International English Preparation',
//
//                             style: TextStyle(
//                               color: Colors.white70,
//                               fontSize: 15,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//
//                     Container(
//
//                       padding: const EdgeInsets.all(12),
//
//                       decoration: BoxDecoration(
//
//                         color: Colors.white.withOpacity(0.18),
//                         shape: BoxShape.circle,
//                       ),
//
//                       child: const Icon(
//
//                         Icons.arrow_forward_ios,
//
//                         color: Colors.white,
//                         size: 18,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 22),
//
//             InkWell(
//
//               borderRadius: BorderRadius.circular(28),
//
//               onTap: () {
//
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (_) => const SatScreen(),
//                   ),
//                 );
//               },
//
//               child: Container(
//
//                 width: double.infinity,
//
//                 padding: const EdgeInsets.all(24),
//
//                 decoration: BoxDecoration(
//
//                   gradient: const LinearGradient(
//
//                     colors: [
//
//                       Color(0xFF8E2DE2),
//                       Color(0xFF4A00E0),
//                     ],
//
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//
//                   borderRadius: BorderRadius.circular(28),
//
//                   boxShadow: [
//
//                     BoxShadow(
//                       color: Colors.purple.withOpacity(0.25),
//                       blurRadius: 16,
//                       offset: const Offset(0, 8),
//                     ),
//                   ],
//                 ),
//
//                 child: Row(
//
//                   children: [
//
//                     Container(
//
//                       padding: const EdgeInsets.all(18),
//
//                       decoration: BoxDecoration(
//
//                         color: Colors.white.withOpacity(0.18),
//                         shape: BoxShape.circle,
//                       ),
//
//                       child: const Icon(
//
//                         Icons.workspace_premium,
//
//                         color: Colors.white,
//                         size: 38,
//                       ),
//                     ),
//
//                     const SizedBox(width: 18),
//
//                     const Expanded(
//
//                       child: Column(
//
//                         crossAxisAlignment: CrossAxisAlignment.start,
//
//                         children: [
//
//                           Text(
//
//                             'SAT Practice',
//
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 26,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//
//                           SizedBox(height: 8),
//
//                           Text(
//
//                             'SAT Vocabulary & Grammar',
//
//                             style: TextStyle(
//                               color: Colors.white70,
//                               fontSize: 15,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//
//                     Container(
//
//                       padding: const EdgeInsets.all(12),
//
//                       decoration: BoxDecoration(
//
//                         color: Colors.white.withOpacity(0.18),
//                         shape: BoxShape.circle,
//                       ),
//
//                       child: const Icon(
//
//                         Icons.arrow_forward_ios,
//
//                         color: Colors.white,
//                         size: 18,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//
//             const SizedBox(height: 22),
//
//             Expanded(
//
//               child: GridView.builder(
//
//                 itemCount: categories.length,
//
//                 gridDelegate:
//                 const SliverGridDelegateWithFixedCrossAxisCount(
//
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 18,
//                   mainAxisSpacing: 18,
//                   childAspectRatio: 0.88,
//                 ),
//
//                 itemBuilder: (context, index) {
//
//                   final item = categories[index];
//
//                   return InkWell(
//
//                     borderRadius:
//                     BorderRadius.circular(30),
//
//                     onTap: () {
//
//                       if (item['category'] ==
//                           'vocabulary') {
//
//                         Navigator.push(
//                           context,
//
//                           MaterialPageRoute(
//                             builder: (_) =>
//                             const VocabularyLevelsScreen(),
//                           ),
//                         );
//                       }
//
//                       else if (item['category'] ==
//                           'phrasal_verbs') {
//
//                         Navigator.push(
//                           context,
//
//                           MaterialPageRoute(
//                             builder: (_) =>
//                             const PhrasalVerbsLevelsScreen(),
//                           ),
//                         );
//                       }
//
//                       else if (item['category'] ==
//                           'reading') {
//
//                         Navigator.push(
//                           context,
//
//                           MaterialPageRoute(
//                             builder: (_) =>
//                             const ReadingLevelsScreen(),
//                           ),
//                         );
//                       }
//
//                       else if (item['category'] ==
//                           'grammar') {
//
//                         Navigator.push(
//                           context,
//
//                           MaterialPageRoute(
//                             builder: (_) =>
//                             const GrammarLevelsScreen(),
//                           ),
//                         );
//                       }
//
//                       else if (item['category'] ==
//                           'kids') {
//
//                         Navigator.push(
//                           context,
//
//                           MaterialPageRoute(
//                             builder: (_) =>
//                             const KidsLevelsScreen(),
//                           ),
//                         );
//                       }
//
//                       else if (item['category'] ==
//                           'spelling') {
//
//                         Navigator.push(
//                           context,
//
//                           MaterialPageRoute(
//                             builder: (_) =>
//                             const SpellingLevelsScreen(),
//                           ),
//                         );
//                       }
//
//                       else if (item['category'] ==
//                           'dictionary') {
//
//                         Navigator.push(
//                           context,
//
//                           MaterialPageRoute(
//                             builder: (_) =>
//                             const DictionaryScreen(),
//                           ),
//                         );
//                       }
//
//                       else if (item['category'] ==
//                           'toefl') {
//
//                         Navigator.push(
//                           context,
//
//                           MaterialPageRoute(
//                             builder: (_) =>
//                             const ToeflLevelsScreen(),
//                           ),
//                         );
//                       }
//                       else if (item['category'] == 'ielts') {
//
//                         Navigator.push(
//                           context,
//
//                           MaterialPageRoute(
//                             builder: (_) => const IELTScreen(),
//                           ),
//                         );
//                       }
//                       else if (item['category'] == 'idioms') {
//
//                         Navigator.push(
//                           context,
//
//                           MaterialPageRoute(
//                             builder: (_) => const IdiomsLevelsScreen(),
//                           ),
//                         );
//                       }
//                       else if (item['category'] == 'sat') {
//
//                         Navigator.push(
//                           context,
//
//                           MaterialPageRoute(
//                             builder: (_) => const SatScreen(),
//                           ),
//                         );
//                       }
//
//
//                       else {
//
//                         Navigator.push(
//                           context,
//
//                           MaterialPageRoute(
//                             builder: (_) => LevelScreen(
//
//                               category:
//                               item['category'].toString(),
//
//                               level: 'beginner',
//                             ),
//                           ),
//                         );
//                       }
//                     },
//
//                     child: Container(
//
//                       decoration: BoxDecoration(
//
//                         gradient: LinearGradient(
//
//                           colors: [
//
//                             item['color1'] as Color,
//                             item['color2'] as Color,
//                           ],
//
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                         ),
//
//                         borderRadius:
//                         BorderRadius.circular(30),
//
//                         boxShadow: [
//
//                           BoxShadow(
//                             color:
//                             (item['color1'] as Color)
//                                 .withOpacity(0.35),
//
//                             blurRadius: 14,
//                             offset: const Offset(0, 8),
//                           ),
//                         ],
//                       ),
//
//                       child: Padding(
//                         padding:
//                         const EdgeInsets.all(18),
//
//                         child: Column(
//
//                           crossAxisAlignment:
//                           CrossAxisAlignment.start,
//
//                           children: [
//
//                             Container(
//
//                               padding:
//                               const EdgeInsets.all(14),
//
//                               decoration: BoxDecoration(
//
//                                 color:
//                                 Colors.white
//                                     .withOpacity(0.18),
//
//                                 shape: BoxShape.circle,
//                               ),
//
//                               child: Icon(
//                                 item['icon']
//                                 as IconData,
//
//                                 size: 34,
//                                 color: Colors.white,
//                               ),
//                             ),
//
//                             const Spacer(),
//
//                             Text(
//
//                               item['title'].toString(),
//
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 22,
//                                 fontWeight:
//                                 FontWeight.bold,
//                               ),
//                             ),
//
//                             const SizedBox(height: 8),
//
//                             Text(
//
//                               "Start learning now",
//
//                               style: TextStyle(
//                                 color:
//                                 Colors.white
//                                     .withOpacity(0.9),
//
//                                 fontSize: 13,
//                               ),
//                             ),
//
//                             const SizedBox(height: 14),
//
//                             Row(
//                               children: [
//
//                                 const Icon(
//                                   Icons.play_circle_fill,
//                                   color: Colors.white,
//                                   size: 22,
//                                 ),
//
//                                 const SizedBox(width: 6),
//
//                                 Text(
//
//                                   "Start",
//
//                                   style: TextStyle(
//                                     color: Colors.white
//                                         .withOpacity(0.95),
//
//                                     fontWeight:
//                                     FontWeight.w600,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       ),
//
//     const BannerAdWidget(),
//
//     const SizedBox(height: 8),
//     ],
//     ),
//     );
//   }
// }

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
      body: SafeArea(
        child: Column(
          children: [
            // Scrollable Main Content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    children: [
                      // 1. TOEFL Card
                      _buildFeaturedCard(
                        context: context,
                        title: 'TOEFL Practice',
                        subtitle: 'Academic English Preparation',
                        icon: Icons.school,
                        colors: [const Color(0xFF6A11CB), const Color(0xFF2575FC)],
                        shadowColor: Colors.blue,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const ToeflLevelsScreen()),
                        ),
                      ),
                      const SizedBox(height: 22),

                      // 2. IELTS Card
                      _buildFeaturedCard(
                        context: context,
                        title: 'IELTS Practice',
                        subtitle: 'International English Preparation',
                        icon: Icons.language,
                        colors: [const Color(0xFFFF6A00), const Color(0xFFEE0979)],
                        shadowColor: Colors.orange,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const IELTScreen()),
                        ),
                      ),
                      const SizedBox(height: 22),

                      // 3. SAT Card
                      _buildFeaturedCard(
                        context: context,
                        title: 'SAT Practice',
                        subtitle: 'SAT Vocabulary & Grammar',
                        icon: Icons.workspace_premium,
                        colors: [const Color(0xFF8E2DE2), const Color(0xFF4A00E0)],
                        shadowColor: Colors.purple,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const SatScreen()),
                        ),
                      ),
                      const SizedBox(height: 22),

                      // 4. Categories Grid
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: categories.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 18,
                          mainAxisSpacing: 18,
                          childAspectRatio: 0.65,
                        ),
                        itemBuilder: (context, index) {
                          final item = categories[index];
                          return InkWell(
                            borderRadius: BorderRadius.circular(30),
                            onTap: () => _handleCategoryTap(context, item['category'].toString()),
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [item['color1'] as Color, item['color2'] as Color],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: (item['color1'] as Color).withOpacity(0.35),
                                    blurRadius: 14,
                                    offset: const Offset(0, 8),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(18),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(14),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.18),
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
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "Start learning now",
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.9),
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
                                            color: Colors.white.withOpacity(0.95),
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
                    ],
                  ),
                ),
              ),
            ),

            // Fixed Banner Ad at Bottom
            const BannerAdWidget(),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  // Helper method to keep featured cards neat and readable
  Widget _buildFeaturedCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required List<Color> colors,
    required MaterialColor shadowColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(28),
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.25),
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
              child: Icon(icon, color: Colors.white, size: 38),
            ),
            const SizedBox(width: 18),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.white70, fontSize: 15),
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
              child: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18),
            ),
          ],
        ),
      ),
    );
  }

  // Organized navigation router for the grid
  void _handleCategoryTap(BuildContext context, String category) {
    Widget targetScreen;

    switch (category) {
      case 'vocabulary':
        targetScreen = const VocabularyLevelsScreen();
        break;
      case 'phrasal_verbs':
        targetScreen = const PhrasalVerbsLevelsScreen();
        break;
      case 'reading':
        targetScreen = const ReadingLevelsScreen();
        break;
      case 'grammar':
        targetScreen = const GrammarLevelsScreen();
        break;
      case 'kids':
        targetScreen = const KidsLevelsScreen();
        break;
      case 'spelling':
        targetScreen = const SpellingLevelsScreen();
        break;
      case 'dictionary':
        targetScreen = const DictionaryScreen();
        break;
      case 'toefl':
        targetScreen = const ToeflLevelsScreen();
        break;
      case 'ielts':
        targetScreen = const IELTScreen();
        break;
      case 'idioms':
      // Note: Check if your idioms screen class name is IdiomsScreen or IdiomsLevelsScreen
        targetScreen = const IdiomsLevelsScreen();
        break;
      case 'sat':
        targetScreen = const SatScreen();
        break;
      default:
        targetScreen = LevelScreen(category: category, level: 'beginner');
    }

    Navigator.push(context, MaterialPageRoute(builder: (_) => targetScreen));
  }
}