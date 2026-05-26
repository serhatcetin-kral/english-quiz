import 'package:flutter/material.dart';

import 'level_screen.dart';
import '../widgets/banner_ad_widget.dart';

class PhrasalVerbsLevelsScreen extends StatelessWidget {

  const PhrasalVerbsLevelsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('Phrasal Verbs'),
      ),

      body: SafeArea(

        child: Column(

          children: [

            Expanded(

              child: Padding(

                padding: const EdgeInsets.all(16),

                child: Column(

                  children: [

                    levelCard(

                      context,

                      title: 'Beginner',

                      quizzes: '5 Quizzes',

                      color: Colors.purple,

                      level: 'beginner',
                    ),

                    levelCard(

                      context,

                      title: 'Intermediate',

                      quizzes: '5 Quizzes',

                      color: Colors.orange,

                      level: 'intermediate',
                    ),

                    levelCard(

                      context,

                      title: 'Advanced',

                      quizzes: '5 Quizzes',

                      color: Colors.red,

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

  Widget levelCard(

      BuildContext context, {

        required String title,

        required String quizzes,

        required Color color,

        required String level,
      }) {

    return Padding(

      padding: const EdgeInsets.only(bottom: 16),

      child: InkWell(

        borderRadius: BorderRadius.circular(20),

        onTap: () {

          Navigator.push(

            context,

            MaterialPageRoute(

              builder: (_) => LevelScreen(

                category: 'phrasal_verbs',

                level: level,
              ),
            ),
          );
        },

        child: Container(

          padding: const EdgeInsets.all(20),

          decoration: BoxDecoration(

            color: Colors.white,

            borderRadius: BorderRadius.circular(20),

            boxShadow: [

              BoxShadow(

                color: Colors.black.withOpacity(0.05),

                blurRadius: 10,
              ),
            ],
          ),

          child: Row(

            children: [

              CircleAvatar(

                radius: 28,

                backgroundColor:
                color.withOpacity(0.15),

                child: Icon(

                  Icons.translate,

                  color: color,

                  size: 30,
                ),
              ),

              const SizedBox(width: 16),

              Expanded(

                child: Column(

                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    Text(

                      title,

                      style: const TextStyle(

                        fontSize: 22,

                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(

                      quizzes,

                      style: TextStyle(

                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),

              const Icon(
                Icons.arrow_forward_ios,
              ),
            ],
          ),
        ),
      ),
    );
  }
}