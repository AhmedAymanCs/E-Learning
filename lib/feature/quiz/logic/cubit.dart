import 'package:e_learning/feature/quiz/data/models/question_model.dart';
import 'package:e_learning/feature/quiz/data/repository/questions_repo.dart';
import 'package:e_learning/feature/quiz/logic/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizCubit extends Cubit<QuizStates> {
  QuizCubit(this._questionsRepository) : super(InitialQuizState());

  final QuestionsRepository _questionsRepository;

  QuizCubit get(context) => BlocProvider.of<QuizCubit>(context);
  int currentQuestion = 1;
  int currentAnswer =
      10; //initial num for non selected answer, will be changed when user selects answer
  QuestionModel? questionModel;
  Future<void> loadQuestions() async {
    emit(LoadingQuestionsState());
    final result = await _questionsRepository.getQuestions();
    result.fold((l) => emit(ErrorQuestionsState(l)), (data) {
      questionModel = data;
      emit(LoadedQuestionsState());
    });
  }

  void nextPage() {
    currentQuestion++;
    currentAnswer = 10;
    emit(PageChangedState());
  }

  void changeAnswer(int answer) {
    currentAnswer = answer;
    emit(AnswerChangedState());
  }
}
