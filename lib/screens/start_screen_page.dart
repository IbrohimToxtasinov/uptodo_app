import 'package:flutter/material.dart';
import 'package:uptodo_app/screens/login_page.dart';
import 'package:uptodo_app/screens/register_page.dart';
import 'package:uptodo_app/utils/colors.dart';
import 'package:uptodo_app/widgets/my_back_arrowwidget.dart';
import 'package:uptodo_app/widgets/my_textWidget.dart';

class StartScreenPage extends StatelessWidget {
  const StartScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.c000000,
      body: SafeArea(
        child: Column(
          children: [
            backarrowWidget(context,bottom: 58.0),
            textanddescriptionWidget(context, title: "Welcome to UpTodo", description: "Please login to your account or create new account to continue"), 
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 370,),
                  //button(context, height: 48.0, text: "LOGIN", color: MyColors.c8875FF, pagename: const LoginPage(), textcolor: MyColors.cFFFFFF),
                  const SizedBox(height: 28,),
                  //button(context, height: 48.0, text: "CREATE ACCOUNT", color: MyColors.c000000, pagename: const RegisterPage(), textcolor: MyColors.cFFFFFF), 
                ],
              ),
            ), 
          ],
        ),
      ),
    );
  }
}