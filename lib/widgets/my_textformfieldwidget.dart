// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:uptodo_app/utils/colors.dart';
import 'package:uptodo_app/utils/styles.dart';

Widget buildtextFormFieldWidget(BuildContext context, {title, hintname, hasUsername, haspassword}) {
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
            keyboardType: TextInputType.text,
            obscureText: false,
            onChanged: (value) {
              String patternUpperCase = r'^(?=.*?[A-Z]).*$';
              RegExp regExp = RegExp(patternUpperCase);

              String patternLowerCase = r'^(?=.*?[a-z]).*$';
              RegExp regExp2 = RegExp(patternLowerCase);

              String patternDigit = r'^(?=.*?[0-9]).*$';
              RegExp regExp3 = RegExp(patternDigit);

              //setState(() {
                hasUsername = regExp.hasMatch(value);
                haspassword = regExp2.hasMatch(value);
                haspassword = regExp3.hasMatch(value);
              //});
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