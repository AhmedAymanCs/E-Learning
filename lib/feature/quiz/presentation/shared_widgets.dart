import 'package:e_learning/core/contant/color_manager.dart';
import 'package:e_learning/core/contant/font_manager.dart';
import 'package:e_learning/core/contant/string_manager.dart';
import 'package:e_learning/core/widgets/cutom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgressBar extends StatelessWidget {
  final int currentQuestion;
  final int totalQuestions;
  const ProgressBar({
    super.key,
    required this.currentQuestion,
    required this.totalQuestions,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: ColorManager.white,
        border: Border(
          bottom: const BorderSide(color: ColorManager.gray200, width: 1),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(StringManager.question),
              Text(' $currentQuestion'),
              Text(' of $totalQuestions'),
              Spacer(),
              Text('${((currentQuestion / totalQuestions) * 100).toInt()}%'),
            ],
          ),
          SizedBox(height: 5.h),
          LinearProgressIndicator(
            value: (currentQuestion + 1) / totalQuestions,
            backgroundColor: ColorManager.gray300,
            color: ColorManager.primaryColor,
            minHeight: 5,
          ),
        ],
      ),
    );
  }
}

class AnswerCard extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final int cardIndex;
  final int currentIndex;
  const AnswerCard({
    super.key,
    this.onTap,
    required this.cardIndex,
    required this.currentIndex,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = currentIndex == cardIndex;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorManager.white,
          border: BoxBorder.all(color: ColorManager.gray200),
        ),
        child: ListTile(
          tileColor: ColorManager.white,
          leading: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected
                  ? ColorManager.primaryColor
                  : Colors.transparent,
              border: Border.all(
                color: isSelected
                    ? ColorManager.primaryColor
                    : ColorManager.gray200,
                width: 2,
              ),
            ),

            child: isSelected
                ? const Icon(Icons.circle, size: 15, color: Colors.white)
                : null,
          ),
          title: Text(text),
        ),
      ),
    );
  }
}

class QuizCard extends StatelessWidget {
  final String question;
  final List<String> answers;
  final int currentSelectedAnswer;
  final Function(int) onAnswerSelected;
  const QuizCard({
    super.key,
    required this.question,
    required this.answers,
    required this.currentSelectedAnswer,
    required this.onAnswerSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomCard(text: question),
          SizedBox(height: 30.h),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: answers.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
                child: AnswerCard(
                  cardIndex: index,
                  currentIndex: currentSelectedAnswer,
                  text: answers[index],
                  onTap: () => onAnswerSelected(index),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  final bool enable;
  final bool last;
  final VoidCallback? onPressed;
  const NextButton({
    super.key,
    this.onPressed,
    this.enable = false,
    required this.last,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: ElevatedButton(
        onPressed: enable ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.primaryColor,
        ),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          child: Text(
            last ? StringManager.submit : StringManager.next,
            style: TextStyle(color: Colors.white, fontSize: FontSize.s16),
          ),
        ),
      ),
    );
  }
}
