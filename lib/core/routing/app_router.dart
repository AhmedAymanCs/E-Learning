import 'package:e_learning/core/routing/routes.dart';
import 'package:e_learning/feature/home/presentation/home_screen.dart';
import 'package:e_learning/feature/quiz/presentation/questions_screen.dart';
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
        return MaterialPageRoute(builder: (_) => const ResultPage());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
