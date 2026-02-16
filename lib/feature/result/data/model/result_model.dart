class QuizResultModel {
  String question;
  String correctAnswer;
  String userAnswer;
  bool isCorrect;
  QuizResultModel({
    required this.question,
    required this.correctAnswer,
    required this.userAnswer,
    required this.isCorrect,
  });
  factory QuizResultModel.fromJson(Map<String, dynamic> json) {
    return QuizResultModel(
      question: json['question_text'],
      correctAnswer: json['correct_answer'],
      userAnswer: json['user_answer'],
      isCorrect: json['is_correct'],
    );
  }
}
