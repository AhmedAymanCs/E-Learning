import 'package:e_learning/core/di/service_locator.dart';
import 'package:e_learning/core/routing/routes.dart';
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
    final PageController pageController = PageController();
    return BlocProvider(
      create: (context) =>
          QuizCubit(getIt<QuestionsRepository>())..loadQuestions(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<QuizCubit, QuizStates>(
            builder: (context, state) {
              QuizCubit cubit = BlocProvider.of<QuizCubit>(context);
              if (cubit.questionModel != null) {
                return Column(
                  children: [
                    ProgressBar(
                      currentQuestion: cubit.currentQuestion,
                      totalQuestions: cubit.questionModel!.result.length,
                    ),
                    SizedBox(height: 50.h),
                    Expanded(
                      child: PageView.builder(
                        controller: pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 15,
                        itemBuilder: (context, index) => QuizCard(
                          question: cubit.questionModel!.result[index].question,
                          answers:
                              cubit.questionModel!.result[index].allAnswers,
                          currentSelectedAnswer: cubit.currentAnswer,
                          onAnswerSelected: (index) {
                            cubit.changeAnswer(index);
                          },
                        ),
                      ),
                    ),
                    NextButton(
                      last:
                          cubit.currentQuestion ==
                          cubit.questionModel!.result.length,
                      onPressed: () {
                        if (cubit.currentQuestion <
                            cubit.questionModel!.result.length) {
                          cubit.nextPage();
                          pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          cubit.saveFullAnswerData();
                          Navigator.pushNamed(
                            context,
                            Routes.resultRoute,
                            arguments: {
                              'quizResults': cubit.quizSummary,
                              'score': cubit.score,
                            },
                          );
                        }
                      },
                      enable: cubit.currentAnswer < 4,
                    ),
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
