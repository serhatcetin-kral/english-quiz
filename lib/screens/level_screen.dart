import 'package:flutter/material.dart';

import 'quiz_screen.dart';

class LevelScreen extends StatelessWidget {
  final String category;
  final String level;

  const LevelScreen({
    super.key,
    required this.category,
    required this.level,
  });

  List<String> getQuizList(String category, String level) {

    // VOCABULARY
    if (category == 'vocabulary' && level == 'beginner') {
      return [
        'quiz1',
        'quiz2',
        'quiz3',
        'quiz4',
        'quiz5',
      ];
    }

    if (category == 'vocabulary' && level == 'intermediate') {
      return [
        'quiz1',
        'quiz2',
        'quiz3',
        'quiz4',
        'quiz5',
      ];
    }

    if (category == 'vocabulary' && level == 'advanced') {
      return [
        'quiz1',
        'quiz2',
        'quiz3',
        'quiz4',
      ];
    }

    // PHRASAL VERBS
    if (category == 'phrasal_verbs' && level == 'beginner') {
      return [
        'quiz1',
        'quiz2',
        'quiz3',
      ];
    }

    if (category == 'phrasal_verbs' && level == 'intermediate') {
      return [
        'quiz1',
        'quiz2',
        'quiz3',
        'quiz4',
      ];
    }

    if (category == 'phrasal_verbs' && level == 'advanced') {
      return [
        'quiz1',
        'quiz2',
        'quiz3',
        'quiz4',

      ];
    }

    // GRAMMAR
    if (category == 'grammar' && level == 'beginner') {
      return [
        'quiz1',
        'quiz2',
        'quiz3',
        'quiz4',
      ];
    }
    if (category == 'grammar' && level == 'intermediate') {
      return [
        'quiz1',
        'quiz2',
        'quiz3',
        'quiz4',
      ];
    }
    if (category == 'grammar' && level == 'advanced') {
      return [
        'quiz1',
        'quiz2',
        'quiz3',
        'quiz4',
      ];
    }

    // READING
    if (category == 'reading' && level == 'beginner') {
      return [
        'quiz1',
        'quiz2',
        'quiz3'
      ];
    }
    if (category == 'reading' && level == 'advanced') {
      return [
        'quiz1',
        'quiz2',
        'quiz3'
      ];
    }
    if (category == 'reading' && level == 'intermediate') {
      return [
        'quiz1',
        'quiz2',
        'quiz3'
      ];
    }

    // KIDS
    if (category == 'kids' && level == 'beginner') {
      return [
        'quiz1',
        'quiz2',
        'quiz3',
      ];
    }

    // SPELLING
    if (category == 'spelling' && level == 'beginner') {
      return [
        'quiz1',
        'quiz2',
        'quiz3',
      ];
    }

    // DEFAULT
    return ['quiz1'];
  }

  @override
  Widget build(BuildContext context) {

    final quizzes = getQuizList(category, level);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${category.toUpperCase()} - ${level.toUpperCase()}',
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const SizedBox(height: 10),

            Text(
              'Select Quiz',
              style: Theme.of(context).textTheme.headlineSmall,
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: quizzes.length,

                itemBuilder: (context, index) {

                  final quizNumber = quizzes[index];

                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.only(bottom: 12),

                    child: ListTile(

                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                      ),

                      title: Text(
                        'Quiz ${index + 1}',
                      ),

                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                      ),

                      onTap: () {

                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (_) => QuizScreen(
                              category: category,
                              level: level,
                              quizNumber: quizNumber,
                            ),
                          ),
                        );
                      },
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