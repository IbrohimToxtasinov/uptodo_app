import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:uptodo_app/screens/HomePage.dart';
import 'package:uptodo_app/screens/login_page.dart';
import 'package:uptodo_app/screens/main_page.dart';
import 'package:uptodo_app/utils/colors.dart';
import 'package:uptodo_app/utils/styles.dart';
import 'package:uptodo_app/widgets/loginandregisterbottomWidget.dart';
import 'package:uptodo_app/widgets/my_back_arrowwidget.dart';
import 'package:uptodo_app/widgets/my_textwidget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}
  bool hasUsername = false;
  bool haspassword = false;
  bool hasconpassword = false;

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.c000000,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              backarrowWidget(context, bottom: 16.0),
              textboldWidget(context, title: "Register", botom: 23.0),
              buildtextFormFieldWidget(context, title: "Username", hintname: "Enter your Username"),
              const SizedBox(height: 25),
              buildtextFormFieldpassWidget(context, title: "Password", hintname: "•  •  •  •  •  •  •  •  •  •  •  •"),
              const SizedBox(height: 25),
              buildtextFormFieldconpassWidget(context, title: "Confirm Password", hintname: "•  •  •  •  •  •  •  •  •  •  •  •"),
              const SizedBox(height: 41,),
              button(context, color: hasUsername == true && haspassword == true  && hasconpassword == true ? MyColors.c8875FF : MyColors.c808687E7D, height: 48.0, pagename: hasUsername == true && haspassword == true && hasconpassword == true ? MainPage() : const RegisterPage(), text: "Register", textcolor: hasUsername == true && haspassword == true ? MyColors.cFFFFFF : MyColors.cFFFFFF.withOpacity(0.5)),
              const SizedBox(height: 31,),
              buildloginandregisterbottom(context, name: "Register", name2: "Login",height: 24.0, pagname: const LoginPage()),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildtextFormFieldWidget(BuildContext context, {title, hintname}) {
  return Padding(
    padding: const EdgeInsets.only(left: 24, right: 24),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: MyStyles.latoregular400
                .copyWith(color: MyColors.cFFFFFF.withOpacity(0.87), fontSize: 16)),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          width: double.infinity,
          child: TextFormField(
            style: const TextStyle(color: MyColors.cFFFFFF),
            keyboardType: TextInputType.text,
            obscureText: false,
            onChanged: (value) {
              String patternUpperCase = r'^(?=.*?[A-Z]).*$';
              RegExp regExp = RegExp(patternUpperCase);

              String patternLowerCase = r'^(?=.*?[a-z]).*$';
              RegExp regExp2 = RegExp(patternLowerCase);

              setState(() {
                  // hasUsername = regExp.hasMatch(value);
                  hasUsername = regExp.hasMatch(value);
                });
              },
              decoration: InputDecoration(
                hintText: hintname,
                hintStyle: const TextStyle(color: Color.fromARGB(255, 100, 99, 99), fontWeight: FontWeight.w400, fontSize: 16),
                filled: true,
                fillColor: Colors.black,
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Color.fromARGB(255, 100, 99, 99),)
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Color.fromARGB(255, 100, 99, 99),)
                ),
                errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Colors.red)
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget buildtextFormFieldpassWidget(BuildContext context, {title, hintname}) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: MyStyles.latoregular400
                  .copyWith(color: MyColors.cFFFFFF.withOpacity(0.87), fontSize: 16)),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            width: double.infinity,
            child: TextFormField(
              style: const TextStyle(color: MyColors.cFFFFFF),
              keyboardType: TextInputType.text,
              obscureText: false,
              onChanged: (value) {
                String patternUpperCase = r'^(?=.*?[A-Z]).*$';
                RegExp regExp = RegExp(patternUpperCase);

                String patternLowerCase = r'^(?=.*?[a-z]).*$';
                RegExp regExp2 = RegExp(patternLowerCase);

                String patternDigit = r'^(?=.*?[0-9]).*$';
                RegExp regExp3 = RegExp(patternDigit);

                setState(() {
                  haspassword = regExp2.hasMatch(value);
                  // haspassword = regExp2.hasMatch(value);
                  // haspassword = regExp3.hasMatch(value);
                });
              },
              decoration: InputDecoration(
                hintText: hintname,
                hintStyle: const TextStyle(color: Color.fromARGB(255, 100, 99, 99), fontWeight: FontWeight.w400, fontSize: 16),
                filled: true,
                fillColor: Colors.black,
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Color.fromARGB(255, 100, 99, 99),)
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Color.fromARGB(255, 100, 99, 99),)
                ),
                errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Colors.red)
                ),
              ),
            )
          ),
        ],
      ),
    );
  }
  Widget buildtextFormFieldconpassWidget(BuildContext context, {title, hintname}) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: MyStyles.latoregular400
                  .copyWith(color: MyColors.cFFFFFF.withOpacity(0.87), fontSize: 16)),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            width: double.infinity,
            child: TextFormField(
              style: const TextStyle(color: MyColors.cFFFFFF),
              keyboardType: TextInputType.text,
              obscureText: false,
              onChanged: (value) {
                String patternUpperCase = r'^(?=.*?[A-Z]).*$';
                RegExp regExp = RegExp(patternUpperCase);

                String patternLowerCase = r'^(?=.*?[a-z]).*$';
                RegExp regExp2 = RegExp(patternLowerCase);

                String patternDigit = r'^(?=.*?[0-9]).*$';
                RegExp regExp3 = RegExp(patternDigit);

                setState(() {
                  hasconpassword = regExp2.hasMatch(value);
                  // haspassword = regExp2.hasMatch(value);
                  // haspassword = regExp3.hasMatch(value);
                });
              },
              decoration: InputDecoration(
                hintText: hintname,
                hintStyle: const TextStyle(color: Color.fromARGB(255, 100, 99, 99), fontWeight: FontWeight.w400, fontSize: 16),
                filled: true,
                fillColor: Colors.black,
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Color.fromARGB(255, 100, 99, 99),)
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Color.fromARGB(255, 100, 99, 99),)
                ),
                errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Colors.red)
                ),
              ),
            )
          ),
        ],
      ),
    );
  }
}
