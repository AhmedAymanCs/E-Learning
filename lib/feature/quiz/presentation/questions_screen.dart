import 'package:e_learning/core/di/service_locator.dart';
import 'package:e_learning/core/routing/routes.dart';
import 'package:e_learning/feature/quiz/data/repository/questions_repo.dart';
import 'package:e_learning/feature/quiz/logic/cubit.dart';
import 'package:e_learning/feature/quiz/logic/states.dart';
import 'package:e_learning/feature/quiz/presentation/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key});

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  late PageController pageController;
  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                          onAnswerSelected: (index) =>
                              cubit.changeAnswer(index),
                        ),
                      ),
                    ),
                    NextButton(
                      last: cubit.isLastQuestion,
                      onPressed: () {
                        cubit.submitAnswer(context, pageController);
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
