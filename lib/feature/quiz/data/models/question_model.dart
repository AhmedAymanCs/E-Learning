class QuestionModel {
  int responseCode;
  List<ResultModel> result;
  QuestionModel({required this.responseCode, required this.result});

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      responseCode: json['response_code'],
      result: (json['results'] as List)
          .map((e) => ResultModel.fromJson(e))
          .toList(),
    );
  }
}

class ResultModel {
  String question;
  String correctAnswer;
  List<String> incorrectAnswers;
  List<String> allAnswers;
  ResultModel({
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
    required this.allAnswers,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    String correct = json['correct_answer'];
    List<String> incorrect = List<String>.from(json['incorrect_answers']);

    List<String> combined = [correct, ...incorrect]; // all answers combined
    combined.shuffle(); // shuffle the list to randomize the answers
    return ResultModel(
      question: json['question'],
      correctAnswer: correct,
      incorrectAnswers: incorrect,
      allAnswers: combined,
    );
  }
}
