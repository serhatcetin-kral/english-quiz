class QuizQuestion {

  final String? story;

  final String question;

  final List<String> options;

  final String answer;

  QuizQuestion({
    this.story,
    required this.question,
    required this.options,
    required this.answer,
  });

  factory QuizQuestion.fromJson(
      Map<String, dynamic> json,
      ) {

    return QuizQuestion(

      story: json['story'],

      question: json['question'],

      options:
      List<String>.from(
        json['options'],
      ),

      answer: json['answer'],
    );
  }
}