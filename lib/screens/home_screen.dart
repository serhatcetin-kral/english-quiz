import 'package:flutter/material.dart';

import 'level_screen.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      const Color(0xFFF5F7FB),

      appBar: AppBar(

        elevation: 0,

        backgroundColor:
        Colors.transparent,

        centerTitle: true,

        title: const Text(

          'English Quiz',

          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(

        padding:
        const EdgeInsets.all(16),

        child: GridView.count(

          crossAxisCount: 2,

          crossAxisSpacing: 16,

          mainAxisSpacing: 16,

          childAspectRatio: 0.9,

          children: [

            _buildCategory(
              context,
              'Vocabulary',
              'Learn new words',
              Icons.menu_book,
              [
                Colors.blue,
                Colors.blueAccent,
              ],
            ),

            _buildCategory(
              context,
              'Grammar',
              'Improve sentences',
              Icons.edit,
              [
                Colors.green,
                Colors.greenAccent,
              ],
            ),

            _buildCategory(
              context,
              'Spelling',
              'Practice spelling',
              Icons.spellcheck,
              [
                Colors.orange,
                Colors.deepOrange,
              ],
            ),

            _buildCategory(
              context,
              'Kids',
              'Fun learning',
              Icons.child_care,
              [
                Colors.purple,
                Colors.deepPurpleAccent,
              ],
            ),

            _buildCategory(
              context,
              'Reading',
              'Read stories',
              Icons.auto_stories,
              [
                Colors.indigo,
                Colors.indigoAccent,
              ],
            ),

            _buildCategory(
              context,
              'Phrasal Verbs',
              'Speak naturally',
              Icons.record_voice_over,
              [
                Colors.teal,
                Colors.cyan,
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategory(

      BuildContext context,

      String title,

      String subtitle,

      IconData icon,

      List<Color> colors,

      ) {

    return InkWell(

      borderRadius:
      BorderRadius.circular(28),

      onTap: () {

        Navigator.push(

          context,

          MaterialPageRoute(

            builder: (_) => LevelScreen(

              category:
              title.toLowerCase()
                  .replaceAll(' ', '_'),
            ),
          ),
        );
      },

      child: Container(

        decoration: BoxDecoration(

          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),

          borderRadius:
          BorderRadius.circular(28),

          boxShadow: [

            BoxShadow(

              color:
              colors.first.withOpacity(0.35),

              blurRadius: 12,

              offset:
              const Offset(0, 6),
            ),
          ],
        ),

        child: Padding(

          padding:
          const EdgeInsets.all(20),

          child: Column(

            crossAxisAlignment:
            CrossAxisAlignment.start,

            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,

            children: [

              Container(

                padding:
                const EdgeInsets.all(12),

                decoration: BoxDecoration(

                  color:
                  Colors.white.withOpacity(0.2),

                  borderRadius:
                  BorderRadius.circular(18),
                ),

                child: Icon(

                  icon,

                  color: Colors.white,

                  size: 34,
                ),
              ),

              Column(

                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  Text(

                    title,

                    style: const TextStyle(

                      color: Colors.white,

                      fontSize: 22,

                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(

                    subtitle,

                    style: TextStyle(

                      color:
                      Colors.white.withOpacity(0.9),

                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}