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

      backgroundColor: const Color(0xFFF4F7FB),

      appBar: AppBar(

        elevation: 0,

        backgroundColor: Colors.transparent,

        centerTitle: true,

        title: const Text(

          'Dictionary',

          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(18),

        child: Column(

          children: [

            Container(

              decoration: BoxDecoration(

                color: Colors.white,

                borderRadius:
                BorderRadius.circular(22),

                boxShadow: [

                  BoxShadow(
                    color:
                    Colors.black.withOpacity(0.05),

                    blurRadius: 12,
                  ),
                ],
              ),

              child: TextField(

                controller: controller,

                decoration: InputDecoration(

                  hintText: 'Search English word',

                  prefixIcon:
                  const Icon(Icons.search),

                  border: InputBorder.none,

                  contentPadding:
                  const EdgeInsets.symmetric(
                    vertical: 18,
                  ),
                ),

                onSubmitted: (_) {
                  searchWord();
                },
              ),
            ),

            const SizedBox(height: 18),

            SizedBox(

              width: double.infinity,
              height: 55,

              child: ElevatedButton(

                onPressed: searchWord,

                style:
                ElevatedButton.styleFrom(

                  backgroundColor:
                  Colors.blue,

                  shape:
                  RoundedRectangleBorder(

                    borderRadius:
                    BorderRadius.circular(18),
                  ),
                ),

                child: const Text(

                  'Search',

                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            if (loading)

              const Padding(
                padding: EdgeInsets.only(top: 40),
                child:
                CircularProgressIndicator(),
              ),

            if (!loading && word.isNotEmpty)

              Expanded(

                child: SingleChildScrollView(

                  child: Container(

                    width: double.infinity,

                    padding:
                    const EdgeInsets.all(24),

                    decoration: BoxDecoration(

                      gradient: const LinearGradient(

                        colors: [

                          Color(0xFF4776E6),
                          Color(0xFF8E54E9),
                        ],

                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),

                      borderRadius:
                      BorderRadius.circular(30),

                      boxShadow: [

                        BoxShadow(
                          color:
                          Colors.blue.withOpacity(0.25),

                          blurRadius: 16,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),

                    child: Column(

                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [

                        Row(

                          children: [

                            const Icon(
                              Icons.menu_book_rounded,
                              color: Colors.white,
                              size: 32,
                            ),

                            const SizedBox(width: 10),

                            Expanded(

                              child: Text(

                                word,

                                style: const TextStyle(
                                  fontSize: 34,
                                  color: Colors.white,
                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 28),

                        sectionTitle('Meaning'),

                        const SizedBox(height: 10),

                        Text(

                          meaning,

                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            height: 1.6,
                          ),
                        ),

                        const SizedBox(height: 28),

                        sectionTitle('Example'),

                        const SizedBox(height: 10),

                        Text(

                          example,

                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            height: 1.6,
                            fontStyle: FontStyle.italic,
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

  Widget sectionTitle(String text) {

    return Container(

      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 8,
      ),

      decoration: BoxDecoration(

        color: Colors.white.withOpacity(0.18),

        borderRadius:
        BorderRadius.circular(14),
      ),

      child: Text(

        text,

        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
    );
  }
}