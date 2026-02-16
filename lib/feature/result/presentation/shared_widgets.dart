import 'package:e_learning/core/contant/color_manager.dart';
import 'package:e_learning/core/contant/font_manager.dart';
import 'package:e_learning/core/contant/string_manager.dart';
import 'package:e_learning/core/routing/routes.dart';
import 'package:e_learning/feature/result/data/model/result_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultList extends StatelessWidget {
  final List<QuizResultModel> results;
  final int score;
  const ResultList({super.key, required this.results, required this.score});

  @override
  Widget build(BuildContext context) {
    print(results.length);
    return Expanded(
      child: ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          final result = results[index];
          return Container(
            width: double.infinity,
            margin: EdgeInsets.all(20.w),
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: ColorManager.white,
              border: Border.all(color: ColorManager.gray200, width: 1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Q${index + 1}.',
                  style: TextStyle(fontSize: FontSize.s18),
                ),
                SizedBox(height: 5.h),
                Text(
                  result.question,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.h),
                if (result.isCorrect)
                  Text(
                    "Correct Answer: ${result.userAnswer}",
                    style: TextStyle(color: ColorManager.green),
                  )
                else ...[
                  Text(
                    "Your Answer: ${result.userAnswer}",
                    style: TextStyle(color: ColorManager.red),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    "Right Answer: ${result.correctAnswer}",
                    style: TextStyle(color: ColorManager.green),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}

class ReTakeQuizButton extends StatelessWidget {
  const ReTakeQuizButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.homeRoute);
      },
      child: Container(
        width: double.infinity,
        height: 50,
        color: ColorManager.green,
        child: Center(
          child: Text(
            StringManager.reTakeQuiz,
            style: TextStyle(
              color: ColorManager.white,
              fontSize: FontSize.s16,
              fontWeight: FontWeightManager.semiBold,
            ),
          ),
        ),
      ),
    );
  }
}
