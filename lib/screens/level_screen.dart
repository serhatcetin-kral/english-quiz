import 'package:flutter/material.dart';

import 'quiz_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/banner_ad_widget.dart';
class LevelScreen extends StatefulWidget {
  final String category;
  final String level;

  const LevelScreen({
    super.key,
    required this.category,
    required this.level,
  });

  @override
  State<LevelScreen> createState() => _LevelScreenState();
}
class _LevelScreenState extends State<LevelScreen> {

  Set<String> completedQuizzes = {};

  @override
  void initState() {
    super.initState();
    loadCompletedQuizzes();
  }

  Future<void> loadCompletedQuizzes() async {

    final prefs =
    await SharedPreferences.getInstance();

    final saved =
        prefs.getStringList(
          '${widget.category}_${widget.level}_completed',
        ) ?? [];

    setState(() {
      completedQuizzes = saved.toSet();
    });
  }
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
    if (category == 'kids' && level == 'intermediate') {
      return [
        'quiz1',
        'quiz2',
        'quiz3',
        'quiz4',
      ];
    }
    if (category == 'kids' && level == 'advanced') {
      return [
        'quiz1',
        'quiz2',
        'quiz3',
        'quiz4',
        'quiz5',
      ];
    }

    // SPELLING
    if (category == 'spelling' && level == 'beginner') {
      return [
        'quiz1',
        'quiz2',
        'quiz3',
        'quiz4',
      ];
    }
    if (category == 'spelling' && level == 'intermediate') {
      return [
        'quiz1',
        'quiz2',
        'quiz3',
        'quiz4',
      ];
    }
    if (category == 'spelling' && level == 'advanced') {
      return [
        'quiz1',
        'quiz2',
        'quiz3',
        'quiz4',
      ];
    }
    // TOEFL
    if (category == 'toefl') {

      return [
        'quiz1',
        'quiz2',
        'quiz3',
        'quiz4',
        'quiz5',
      ];
    }
    if (category == 'ielts') {

      return [
        'quiz1',
        'quiz2',
        'quiz3',
        'quiz4',
        'quiz5',
      ];
    }
    if (category == 'idioms' && level == 'beginner') {
      return [
        'quiz1',
        'quiz2',
        'quiz3',
        'quiz4',
        'quiz5',
      ];
    }
    if (category == 'idioms' && level == 'intermediate') {
      return [
        'quiz1',
        'quiz2',
        'quiz3',
        'quiz4',
        'quiz5',
      ];
    }
    if (category == 'idioms' && level == 'advanced') {
      return [
        'quiz1',
        'quiz2',
        'quiz3',
        'quiz4',
        'quiz5',
      ];
    }
    // SAT WORDS QUIZ
    if (category == 'sat_words_quiz' && level == 'beginner') {
      return [
        'quiz1',
        'quiz2',
        'quiz3',
        'quiz4',
        'quiz5',
      ];
    }

    if (category == 'sat_words_quiz' && level == 'intermediate') {
      return [
        'quiz1',
        'quiz2',
        'quiz3',
        'quiz4',
        'quiz5',
      ];
    }

    if (category == 'sat_words_quiz' && level == 'advanced') {
      return [
        'quiz1',
        'quiz2',
        'quiz3',
        'quiz4',
        'quiz5',
      ];
    }
    // SAT GRAMMAR
    if (category == 'sat_grammar' && level == 'beginner') {
      return [
        'quiz1',
        'quiz2',
        'quiz3',
        'quiz4',
        'quiz5',
      ];
    }

    if (category == 'sat_grammar' && level == 'intermediate') {
      return [
        'quiz1',
        'quiz2',
        'quiz3',
        'quiz4',
        'quiz5',
      ];
    }

    if (category == 'sat_grammar' && level == 'advanced') {
      return [
        'quiz1',
        'quiz2',
        'quiz3',
        'quiz4',
        'quiz5',
      ];
    }

    // SAT SPELLING
    if (category == 'sat_spelling' && level == 'beginner') {
      return [
        'quiz1',
        'quiz2',
        'quiz3',
        'quiz4',
        'quiz5',
      ];
    }

    if (category == 'sat_spelling' && level == 'intermediate') {
      return [
        'quiz1',
        'quiz2',
        'quiz3',
        'quiz4',
        'quiz5',
      ];
    }

    if (category == 'sat_spelling' && level == 'advanced') {
      return [
        'quiz1',
        'quiz2',
        'quiz3',
        'quiz4',
        'quiz5',
      ];
    }
    // SAT READING
    if (category == 'sat_reading' && level == 'beginner') {
      return [
        'quiz1',
        'quiz2',
        'quiz3',
        'quiz4',
        'quiz5',
      ];
    }

    if (category == 'sat_reading' && level == 'intermediate') {
      return [
        'quiz1',
        'quiz2',
        'quiz3',
        'quiz4',
        'quiz5',
      ];
    }

    if (category == 'sat_reading' && level == 'advanced') {
      return [
        'quiz1',
        'quiz2',
        'quiz3',
        'quiz4',
        'quiz5',
      ];
    }
    // DEFAULT
    return ['quiz1'];
  }

  @override
  Widget build(BuildContext context) {

    final quizzes =
    getQuizList(widget.category, widget.level);

    return Scaffold(

      appBar: AppBar(
        title: Text(
          '${widget.category.toUpperCase()} - ${widget.level.toUpperCase()}',
        ),
      ),

      body: SafeArea(

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Expanded(

              child: Padding(

                padding: const EdgeInsets.all(16),

                child: Column(

                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    const SizedBox(height: 10),

                    Text(

                      'Select Quiz',

                      style:
                      Theme.of(context)
                          .textTheme
                          .headlineSmall,
                    ),

                    const SizedBox(height: 20),

                    Expanded(

                      child: ListView.builder(

                        itemCount: quizzes.length,

                        itemBuilder: (context, index) {

                          final quizNumber =
                          quizzes[index];

                          final isCompleted =
                          completedQuizzes.contains(
                            quizNumber,
                          );

                          return Card(

                            color:
                            isCompleted
                                ? Colors.green.shade100
                                : Colors.white,

                            elevation: 3,

                            margin:
                            const EdgeInsets.only(
                              bottom: 12,
                            ),

                            child: ListTile(

                              leading: CircleAvatar(

                                backgroundColor:
                                isCompleted
                                    ? Colors.green
                                    : Colors.blue,

                                child: Text(

                                  '${index + 1}',

                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),

                              title: Text(
                                'Quiz ${index + 1}',
                              ),

                              subtitle:
                              isCompleted

                                  ? const Text(

                                'Completed',

                                style: TextStyle(

                                  color: Colors.green,

                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              )

                                  : null,

                              trailing:
                              isCompleted

                                  ? const Icon(

                                Icons.check_circle,

                                color: Colors.green,
                              )

                                  : const Icon(
                                Icons.arrow_forward_ios,
                              ),

                              onTap: () {

                                Navigator.push(

                                  context,

                                  MaterialPageRoute(

                                    builder: (_) =>
                                        QuizScreen(

                                          category:
                                          widget.category,

                                          level:
                                          widget.level,

                                          quizNumber:
                                          quizNumber,
                                        ),
                                  ),
                                ).then((_) {

                                  loadCompletedQuizzes();

                                });
                              },
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
      ),
    );
  }
}