import 'package:e_learning/core/contant/color_manager.dart';
import 'package:e_learning/core/contant/font_manager.dart';
import 'package:e_learning/core/contant/string_manager.dart';
import 'package:e_learning/core/widgets/cutom_card.dart';
import 'package:e_learning/feature/result/data/model/result_model.dart';
import 'package:e_learning/feature/result/presentation/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultPage extends StatelessWidget {
  final List<QuizResultModel> results;
  final int score;
  const ResultPage({super.key, required this.results, required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomCard(text: 'Your Score : $score / ${results.length}'),
            SizedBox(height: 20.h),
            ResultList(results: results, score: score),
            ReTakeQuizButton(),
          ],
        ),
      ),
    );
  }
}
