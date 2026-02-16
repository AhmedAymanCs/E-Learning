import 'package:e_learning/feature/questions/data/repository/questions_repo.dart';
import 'package:e_learning/feature/questions/logic/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionsCubit extends Cubit<QuestionsStates> {
  QuestionsCubit(this._questionsRepository) : super(InitialQuestionsState());

  final QuestionsRepository _questionsRepository;

  QuestionsCubit get(context) => BlocProvider.of<QuestionsCubit>(context);

  Future<void> loadQuestions() async {
    emit(LoadingQuestionsState());
    final result = await _questionsRepository.getQuestions();
    result.fold(
      (l) => emit(ErrorQuestionsState(l)),
      (r) => emit(LoadedQuestionsState(r)),
    );
  }
}
