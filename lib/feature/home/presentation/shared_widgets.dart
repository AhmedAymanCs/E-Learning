import 'package:e_learning/core/constant/color_manager.dart';
import 'package:e_learning/core/constant/font_manager.dart';
import 'package:e_learning/core/constant/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleText extends StatelessWidget {
  const TitleText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      StringManager.appName,
      style: TextStyle(
        fontSize: FontSize.s22,
        fontWeight: FontWeightManager.semiBold,
      ),
    );
  }
}

class StartButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const StartButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.primaryColor,
        ),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          child: Text(
            StringManager.startQuiz,
            style: TextStyle(color: Colors.white, fontSize: FontSize.s18),
          ),
        ),
      ),
    );
  }
}
