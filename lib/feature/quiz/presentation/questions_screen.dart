import 'package:e_learning/core/di/service_locator.dart';
import 'package:e_learning/feature/quiz/data/repository/questions_repo.dart';
import 'package:e_learning/feature/quiz/logic/cubit.dart';
import 'package:e_learning/feature/quiz/logic/states.dart';
import 'package:e_learning/feature/quiz/presentation/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionsPage extends StatelessWidget {
  const QuestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    int currentSelectedAnswer = 10;
    return BlocProvider(
      create: (context) =>
          QuizCubit(getIt<QuestionsRepository>())..loadQuestions(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<QuizCubit, QuizStates>(
            builder: (context, state) {
              if (state is LoadedQuestionsState) {
                return Column(
                  children: [
                    ProgressBar(currentQuestion: 1, totalQuestions: 15),
                    SizedBox(height: 50.h),
                    Expanded(
                      child: PageView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 15,
                        itemBuilder: (context, index) => QuizCard(
                          question: state.questionModel.result[index].question,
                          answers: state.questionModel.result[index].allAnswers,
                          currentSelectedAnswer: currentSelectedAnswer,
                          onAnswerSelected: (index) {},
                        ),
                      ),
                    ),
                    NextButton(onPressed: () {}, enable: true),
                  ],
                );
              }
              if (state is ErrorQuestionsState) {
                return Center(child: Text('Error : ${state.errorMessage}'));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
