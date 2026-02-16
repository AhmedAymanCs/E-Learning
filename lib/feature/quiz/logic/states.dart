import 'package:e_learning/feature/quiz/data/models/question_model.dart';

abstract class QuizStates {}

class InitialQuizState extends QuizStates {}

class LoadingQuestionsState extends QuizStates {}

class LoadedQuestionsState extends QuizStates {}

class ErrorQuestionsState extends QuizStates {
  final String errorMessage;
  ErrorQuestionsState(this.errorMessage);
}

class PageChangedState extends QuizStates {}

class AnswerChangedState extends QuizStates {}
