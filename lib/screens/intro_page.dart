import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uptodo_app/screens/onboarding_page.dart';
import 'package:uptodo_app/utils/colors.dart';
import 'package:uptodo_app/utils/images.dart';
import 'package:uptodo_app/utils/styles.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  void initState(){
    super.initState();
    Future.delayed(
      const Duration(seconds: 5),
      () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const OnboardingPage())),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.c000000,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(MyImages.iconUpTodoLogo, width: 113, height: 113),
              const SizedBox(height: 19,),
              Text("UpTodo", style: MyStyles.latobold700.copyWith(fontSize: 40, fontWeight: FontWeight.w700, color: MyColors.cFFFFFF),)
            ],
          ),
        ),
      ),
    );
  }
}