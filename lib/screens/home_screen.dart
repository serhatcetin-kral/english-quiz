import 'package:flutter/material.dart';


import 'level_screen.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('English Quiz'),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: GridView.count(

          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,

          children: [

            _buildCategory(
              context,
              'Vocabulary',
              Icons.menu_book,
              Colors.blue,
            ),

            _buildCategory(
              context,
              'Grammar',
              Icons.edit,
              Colors.green,
            ),

            _buildCategory(
              context,
              'Spelling',
              Icons.spellcheck,
              Colors.orange,
            ),

            _buildCategory(
              context,
              'Kids',
              Icons.child_care,
              Colors.purple,
            ),
            _buildCategory(
              context,
              'Reading',
              Icons.menu_book,
              Colors.deepPurple,
            ),
            _buildCategory(
              context,
              'Phrasal Verbs',
              Icons.record_voice_over,
              Colors.teal,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategory(
      BuildContext context,
      String title,
      IconData icon,
      Color color,
      ) {

    return GestureDetector(

      onTap: () {

        Navigator.push(
          context,

          MaterialPageRoute(
            builder: (_) => LevelScreen(
              category: title.toLowerCase(),
            ),
          ),
        );
      },

      child: Container(

        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Icon(
              icon,
              color: Colors.white,
              size: 50,
            ),

            const SizedBox(height: 10),

            Text(
              title,

              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}