import 'package:e_learning/core/contant/color_manager.dart';
import 'package:e_learning/core/contant/font_manager.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {
  final String text;
  const CustomCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(30),
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorManager.white,
        border: BoxBorder.all(color: ColorManager.gray200),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: FontSize.s18,
          fontWeight: FontWeightManager.semiBold,
        ),
      ),
    );
  }
}
