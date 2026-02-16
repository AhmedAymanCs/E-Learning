import 'package:e_learning/feature/quiz/data/repository/questions_repo.dart';
import 'package:e_learning/feature/quiz/logic/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizCubit extends Cubit<QuizStates> {
  QuizCubit(this._questionsRepository) : super(InitialQuizState());

  final QuestionsRepository _questionsRepository;

  QuizCubit get(context) => BlocProvider.of<QuizCubit>(context);

  Future<void> loadQuestions() async {
    emit(LoadingQuestionsState());
    final result = await _questionsRepository.getQuestions();
    result.fold(
      (l) => emit(ErrorQuestionsState(l)),
      (r) => emit(LoadedQuestionsState(r)),
    );
  }
}
