import 'package:flutter/material.dart';
import 'level_screen.dart';

class ReadingLevelsScreen extends StatelessWidget {
  const ReadingLevelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reading'),
        centerTitle: true,
      ),
      // SafeArea ensures content doesn't overlap with notches or home bars
      body: SafeArea(
        child: ListView(
          // Use padding inside the ListView for better scroll behavior
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          children: [
            _buildLevelCard(
              context,
              title: 'Beginner',
              quizzes: '3 Reading Quizzes',
              color: Colors.blue,
              level: 'beginner',
            ),
            _buildLevelCard(
              context,
              title: 'Intermediate',
              quizzes: '4 Reading Quizzes',
              color: Colors.orange,
              level: 'intermediate',
            ),
            _buildLevelCard(
              context,
              title: 'Advanced',
              quizzes: '5 Reading Quizzes',
              color: Colors.red,
              level: 'advanced',
            ),
            // Extra space at the bottom for aesthetic padding when scrolled
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildLevelCard(
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
                category: 'reading',
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
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: color.withOpacity(0.15),
                child: Icon(
                  Icons.chrome_reader_mode,
                  color: color,
                  size: 30,
                ),
              ),
              const SizedBox(width: 16),
              // Expanded prevents horizontal overflow from long text
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                size: 16,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}