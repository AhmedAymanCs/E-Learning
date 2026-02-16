import 'package:e_learning/feature/questions/data/models/question_model.dart';

abstract class QuestionsStates {}

class InitialQuestionsState extends QuestionsStates {}

class LoadingQuestionsState extends QuestionsStates {}

class LoadedQuestionsState extends QuestionsStates {
  final QuestionModel _questionModel;
  LoadedQuestionsState(this._questionModel);
}

class ErrorQuestionsState extends QuestionsStates {
  final String _errorMessage;
  ErrorQuestionsState(this._errorMessage);
}
