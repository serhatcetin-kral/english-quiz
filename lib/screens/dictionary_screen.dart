import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DictionaryScreen extends StatefulWidget {
  const DictionaryScreen({super.key});

  @override
  State<DictionaryScreen> createState() =>
      _DictionaryScreenState();
}

class _DictionaryScreenState
    extends State<DictionaryScreen> {

  final TextEditingController controller =
  TextEditingController();

  bool loading = false;

  String word = '';
  String meaning = '';
  String example = '';

  Future<void> searchWord() async {

    if (controller.text.trim().isEmpty) {
      return;
    }

    setState(() {
      loading = true;
    });

    try {

      final url = Uri.parse(
        'https://api.dictionaryapi.dev/api/v2/entries/en/${controller.text.trim()}',
      );

      final response =
      await http.get(url);

      if (response.statusCode == 200) {

        final data =
        jsonDecode(response.body);

        final first = data[0];

        final meanings =
            first['meanings'] ?? [];

        if (meanings.isNotEmpty) {

          final definitions =
              meanings[0]['definitions'] ?? [];

          if (definitions.isNotEmpty) {

            setState(() {

              word =
                  first['word'] ?? '';

              meaning =
                  definitions[0]['definition']
                      ?? 'No meaning found';

              example =
                  definitions[0]['example']
                      ?? 'No example found';
            });
          }
        }
      }
      else {

        setState(() {

          word = 'Not Found';
          meaning = 'No meaning found';
          example = '';
        });
      }
    }
    catch (e) {

      setState(() {

        word = 'Error';
        meaning = 'Something went wrong';
        example = '';
      });
    }

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('Dictionary'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(

          children: [

            TextField(

              controller: controller,

              decoration: InputDecoration(

                hintText: 'Search word',

                prefixIcon:
                const Icon(Icons.search),

                border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(18),
                ),
              ),
            ),

            const SizedBox(height: 16),

            SizedBox(

              width: double.infinity,

              child: ElevatedButton(

                onPressed: searchWord,

                child: const Text('Search'),
              ),
            ),

            const SizedBox(height: 24),

            if (loading)
              const CircularProgressIndicator(),

            if (word.isNotEmpty)

              Expanded(

                child: SingleChildScrollView(

                  child: Container(

                    width: double.infinity,

                    padding:
                    const EdgeInsets.all(20),

                    decoration: BoxDecoration(

                      color: Colors.white,

                      borderRadius:
                      BorderRadius.circular(20),

                      boxShadow: [

                        BoxShadow(
                          color:
                          Colors.black.withOpacity(0.05),

                          blurRadius: 10,
                        ),
                      ],
                    ),

                    child: Column(

                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [

                        Text(
                          word,

                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 20),

                        const Text(
                          'Meaning',

                          style: TextStyle(
                            fontSize: 18,
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          meaning,
                          style:
                          const TextStyle(
                            fontSize: 16,
                            height: 1.5,
                          ),
                        ),

                        const SizedBox(height: 20),

                        const Text(
                          'Example',

                          style: TextStyle(
                            fontSize: 18,
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          example,
                          style:
                          const TextStyle(
                            fontSize: 16,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}