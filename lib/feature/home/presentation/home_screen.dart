import 'package:e_learning/core/contant/image_manager.dart';
import 'package:e_learning/core/routing/routes.dart';
import 'package:e_learning/feature/home/presentation/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(ImageManager.logo),
            SizedBox(height: 10.h),
            const TitleText(),
            SizedBox(height: 30.h),
            StartButton(
              onPressed: () =>
                  Navigator.pushNamed(context, Routes.questionsRoute),
            ),
          ],
        ),
      ),
    );
  }
}
