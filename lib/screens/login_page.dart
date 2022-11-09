import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uptodo_app/database/shared_praferences.dart';
import 'package:uptodo_app/screens/HomePage.dart';
import 'package:uptodo_app/screens/main_page.dart';
import 'package:uptodo_app/screens/register_page.dart';
import 'package:uptodo_app/utils/colors.dart';
import 'package:uptodo_app/utils/styles.dart';
import 'package:uptodo_app/widgets/loginandregisterbottomWidget.dart';
import 'package:uptodo_app/widgets/my_textwidget.dart';
// import 'package:uptodo_app/widgets/my_textformfieldWidget.dart';
import 'package:uptodo_app/widgets/my_back_arrowWidget.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}
  final username = TextEditingController();
  final password = TextEditingController();
  bool hasUsername = false;
  bool haspassword = false;
class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.c000000,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              backarrowWidget(context, bottom: 41.0),
              textboldWidget(context, title: "Login", botom: 53.0),
              buildtextFormFieldWidget(context, title: "Username", hintname: "Enter your Username", uesrname: username),
              const SizedBox(height: 25),
              buildtextFormFieldpassWidget(context, title: "Password", hintname: "•  •  •  •  •  •  •  •  •  •  •  •", password: password),
              const SizedBox(height: 69,),
              button(context, color: hasUsername == true && haspassword == true ? MyColors.c8875FF : MyColors.c808687E7D, height: 48.0, pagename: hasUsername == true && haspassword == true  ? const MainPage() : const LoginPage(), text: "Login", textcolor: hasUsername == true && haspassword == true ? MyColors.cFFFFFF : MyColors.cFFFFFF.withOpacity(0.5), parol: hasUsername == true && haspassword == true ? true : false),                          
              const SizedBox(height: 31,),
              buildloginandregisterbottom(context, name: "Login", name2: "Register", height: 29.0, pagname: const RegisterPage()),
            ],
          ),
        ),
      ),
    );
  }
  Widget button(BuildContext context, {height, text, color, pagename, textcolor, parol}) {
  return Padding(
    padding: const EdgeInsets.only(left: 24, right: 24),
    child: InkWell(
      onTap: () async {
        if(parol == true)  {
            saveLogin(context);
            print(username.text);
            await StorageRepository.saveString("userName", username.text);
            await StorageRepository.saveString("password", password.text);
        }
      },
      child: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(width: 2, color: MyColors.c8E7CFFF),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(child: Text(text, style: MyStyles.latoregular400.copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: textcolor),)),
      ),
    ),
  );
}




  Widget buildtextFormFieldWidget(BuildContext context, {title, hintname, uesrname}) {
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
            controller: username,
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
Widget buildtextFormFieldpassWidget(BuildContext context, {title, hintname, password}) {
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
            controller: password,
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
void saveLogin(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("LoginedIn", true);

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const MainPage()));
  }
}