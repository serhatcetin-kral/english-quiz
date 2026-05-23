import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SATWordsListScreen extends StatefulWidget {

  final String level;

  const SATWordsListScreen({
    super.key,
    required this.level,
  });

  @override
  State<SATWordsListScreen> createState() =>
      _SATWordsListScreenState();
}

class _SATWordsListScreenState
    extends State<SATWordsListScreen> {

  List<Map<String, dynamic>> words = [];

  bool loading = true;
  final ScrollController _scrollController =
  ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(savePosition);
    loadWords();
  }

  Future<void> loadWords() async {

    try {

      List<Map<String, dynamic>> loadedWords = [];

      int count = 5;

      if (widget.level == 'intermediate') {
        count = 7;
      }

      if (widget.level == 'advanced') {
        count = 9;
      }

      for (int i = 1; i <= count; i++) {

        final path =
            'assets/data/sat/sat_words/${widget.level}$i.json';

        print('LOADING: $path');

        final String data =
        await rootBundle.loadString(path);

        final List decoded =
        json.decode(data);

        for (var item in decoded) {

          loadedWords.add(
            Map<String, dynamic>.from(item),
          );
        }
      }

      setState(() {

        words = loadedWords;

        loading = false;
      });

      restorePosition();

    } catch (e) {

      print('SAT WORD ERROR: $e');

      setState(() {

        loading = false;
      });
    }
  }
  Future<void> savePosition() async {

    final prefs =
    await SharedPreferences.getInstance();

    prefs.setDouble(
      'sat_words_${widget.level}',
      _scrollController.offset,
    );
  }

  Future<void> restorePosition() async {

    final prefs =
    await SharedPreferences.getInstance();

    final savedOffset =
        prefs.getDouble(
          'sat_words_${widget.level}',
        ) ?? 0;

    Future.delayed(
      const Duration(milliseconds: 300),
          () {

        if (_scrollController.hasClients) {

          _scrollController.jumpTo(
            savedOffset,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    if (loading) {

      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (words.isEmpty) {

      return const Scaffold(
        body: Center(
          child: Text(
            'No SAT words found',
          ),
        ),
      );
    }

    return Scaffold(

      appBar: AppBar(
        title: Text(
          'SAT ${widget.level.toUpperCase()} Words',
        ),
        centerTitle: true,
      ),

      body: ListView.builder(
        controller: _scrollController,

        padding: const EdgeInsets.all(16),

        itemCount: words.length,

        itemBuilder: (context, index) {

          final word = words[index];

          return Card(

            elevation: 5,

            margin:
            const EdgeInsets.only(bottom: 18),

            shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(22),
            ),

            child: Padding(

              padding: const EdgeInsets.all(20),

              child: Column(

                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  Text(

                    word['word'] ?? '',

                    style: const TextStyle(

                      fontSize: 28,

                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 14),

                  Text(

                    word['meaning'] ?? '',

                    style: const TextStyle(
                      fontSize: 18,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Container(

                    width: double.infinity,

                    padding:
                    const EdgeInsets.all(14),

                    decoration: BoxDecoration(

                      color:
                      Colors.blue.shade50,

                      borderRadius:
                      BorderRadius.circular(14),
                    ),

                    child: Text(

                      word['example'] ?? '',

                      style: const TextStyle(

                        fontSize: 16,

                        fontStyle:
                        FontStyle.italic,

                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}