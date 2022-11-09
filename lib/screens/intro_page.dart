import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uptodo_app/screens/HomePage.dart';
import 'package:uptodo_app/screens/main_page.dart';
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
  bool isLog = false;

  Future<bool> isLoggedIn() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    isLog = pref.getBool("LoginedIn") ?? false;
    return pref.getBool("LoginedIn") ?? false;
  }

  @override
  void initState() {
    super.initState();

    isLoggedIn();
    goNext();
  }

  void goNext() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) {
            return isLog ? const MainPage() : const OnboardingPage();
          },
        ),
      );
    });
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