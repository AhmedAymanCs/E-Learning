import 'package:e_learning/core/di/service_locator.dart';
import 'package:e_learning/feature/questions/data/repository/questions_repo.dart';
import 'package:e_learning/feature/questions/logic/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionsPage extends StatelessWidget {
  const QuestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          QuestionsCubit(getIt<QuestionsRepository>())..loadQuestions(),
      child: Scaffold(),
    );
  }
}
