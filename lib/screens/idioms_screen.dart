import 'package:flutter/material.dart';

import 'level_screen.dart';
import '../widgets/banner_ad_widget.dart';

class IdiomsLevelsScreen extends StatelessWidget {

  const IdiomsLevelsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final levels = [

      {
        'title': 'Beginner',
        'color1': const Color(0xFF56AB2F),
        'color2': const Color(0xFFA8E063),
      },

      {
        'title': 'Intermediate',
        'color1': const Color(0xFFFFB75E),
        'color2': const Color(0xFFED8F03),
      },

      {
        'title': 'Advanced',
        'color1': const Color(0xFF614385),
        'color2': const Color(0xFF516395),
      },
    ];

    return Scaffold(

      backgroundColor: const Color(0xFFF4F7FB),

      appBar: AppBar(

        title: const Text(

          'Idioms',

          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        centerTitle: true,

        elevation: 0,
      ),

      body: SafeArea(

        child: Column(

          children: [

            Expanded(

              child: Padding(

                padding: const EdgeInsets.all(18),

                child: GridView.builder(

                  itemCount: levels.length,

                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(

                    crossAxisCount: 2,

                    crossAxisSpacing: 18,

                    mainAxisSpacing: 18,

                    childAspectRatio: 1,
                  ),

                  itemBuilder: (context, index) {

                    final level = levels[index];

                    return InkWell(

                      borderRadius:
                      BorderRadius.circular(30),

                      onTap: () {

                        Navigator.push(

                          context,

                          MaterialPageRoute(

                            builder: (_) => LevelScreen(

                              category: 'idioms',

                              level:
                              level['title']
                                  .toString()
                                  .toLowerCase(),
                            ),
                          ),
                        );
                      },

                      child: Container(

                        decoration: BoxDecoration(

                          gradient: LinearGradient(

                            colors: [

                              level['color1'] as Color,
                              level['color2'] as Color,
                            ],

                            begin: Alignment.topLeft,

                            end: Alignment.bottomRight,
                          ),

                          borderRadius:
                          BorderRadius.circular(30),

                          boxShadow: [

                            BoxShadow(

                              color:
                              (level['color1'] as Color)
                                  .withOpacity(0.35),

                              blurRadius: 12,

                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),

                        child: Center(

                          child: Column(

                            mainAxisAlignment:
                            MainAxisAlignment.center,

                            children: [

                              const Icon(

                                Icons.record_voice_over,

                                color: Colors.white,

                                size: 44,
                              ),

                              const SizedBox(height: 14),

                              Text(

                                level['title'].toString(),

                                style: const TextStyle(

                                  color: Colors.white,

                                  fontSize: 22,

                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
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
}