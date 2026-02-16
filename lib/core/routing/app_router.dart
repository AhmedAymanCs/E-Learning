import 'package:e_learning/core/routing/routes.dart';
import 'package:e_learning/feature/home/presentation/home_screen.dart';
import 'package:e_learning/feature/quiz/presentation/questions_screen.dart';
import 'package:e_learning/feature/result/data/model/result_model.dart';
import 'package:e_learning/feature/result/presentation/result_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case Routes.questionsRoute:
        return MaterialPageRoute(builder: (_) => const QuestionsPage());
      case Routes.resultRoute:
        final args = settings.arguments as Map<String, dynamic>;
        final rawList = args['quizResults'] as List<Map<String, dynamic>>;
        final results = rawList
            .map((e) => QuizResultModel.fromJson(e))
            .toList();
        final score = args['score'] as int;
        return MaterialPageRoute(
          builder: (_) => ResultPage(results: results, score: score),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
