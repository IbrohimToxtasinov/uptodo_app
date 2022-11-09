import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SelectLang extends StatefulWidget {
  const SelectLang({Key? key}) : super(key: key);

  @override
  State<SelectLang> createState() => _SelectLangState();
}

class _SelectLangState extends State<SelectLang> {
  int selectedLang = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
          title: const Text("Uzbek"),
          value: 0,
          groupValue: selectedLang,
          onChanged: (value) {
            setState(() {
              selectedLang = value as int;
              context.setLocale(const Locale('uz','UZ'));
            });
          },
        ),
        RadioListTile(
          title: const Text("English"),
          value: 1,
          groupValue: selectedLang,
          onChanged: (value) {
            setState(() {
              selectedLang = value as int;
              context.setLocale(const Locale('en','US'));
            });
          },
        ),
        RadioListTile(
          title: const Text("Russian"),
          value: 2,
          groupValue: selectedLang,
          onChanged: (value) {
            setState(() {
              selectedLang = value as int;
              context.setLocale(const Locale('ru','RU'));
            });
          },
        ),
      ],
    );
  }
}