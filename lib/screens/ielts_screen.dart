import 'package:flutter/material.dart';

import 'level_screen.dart';

class IELTScreen extends StatelessWidget {
  const IELTScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final items = [

      {
        'title': 'Reading',
        'icon': Icons.menu_book,
        'level': 'reading',
        'color1': const Color(0xFF11998E),
        'color2': const Color(0xFF38EF7D),
      },

      {
        'title': 'Vocabulary',
        'icon': Icons.translate,
        'level': 'vocabulary',
        'color1': const Color(0xFFFC466B),
        'color2': const Color(0xFF3F5EFB),
      },

      {
        'title': 'Grammar',
        'icon': Icons.spellcheck,
        'level': 'grammar',
        'color1': const Color(0xFFFFB75E),
        'color2': const Color(0xFFED8F03),
      },

    ];

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'IELTS Practice',
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(

          children: [

            // TOP BANNER

            Container(

              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(

                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF4A00E0),
                    Color(0xFF8E2DE2),
                  ],
                ),

                borderRadius: BorderRadius.circular(24),

              ),

              child: const Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Text(
                    'IELTS Academic Practice',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    'Improve your Reading, Vocabulary and Grammar skills with IELTS-style questions.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                    ),
                  ),

                ],
              ),
            ),

            const SizedBox(height: 24),

            Expanded(

              child: GridView.builder(

                itemCount: items.length,

                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(

                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.05,

                ),

                itemBuilder: (context, index) {

                  final item = items[index];

                  return GestureDetector(

                    onTap: () {

                      Navigator.push(

                        context,

                        MaterialPageRoute(

                          builder: (_) => LevelScreen(

                            category: 'ielts',
                            level: item['level'].toString(),

                          ),
                        ),
                      );
                    },

                    child: Container(

                      decoration: BoxDecoration(

                        gradient: LinearGradient(
                          colors: [
                            item['color1'] as Color,
                            item['color2'] as Color,
                          ],
                        ),

                        borderRadius: BorderRadius.circular(24),

                        boxShadow: [

                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),

                        ],
                      ),

                      child: Column(

                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [

                          Icon(
                            item['icon'] as IconData,
                            size: 50,
                            color: Colors.white,
                          ),

                          const SizedBox(height: 14),

                          Text(

                            item['title'].toString(),

                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}