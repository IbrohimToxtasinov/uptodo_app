import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:uptodo_app/utils/colors.dart';
import 'package:uptodo_app/utils/styles.dart';

import '../database/shared_praferences.dart';

class SelectLang extends StatefulWidget {
  final VoidCallback onTap;
  const SelectLang({Key? key, required this.onTap}) : super(key: key);
  @override
  State<SelectLang> createState() => _SelectLangState();
}

class _SelectLangState extends State<SelectLang> {
  int selectedLang = StorageRepository.getInt("selectedLang");

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
          activeColor: MyColors.cFFFFFF,
          selectedTileColor: MyColors.cFFFFFF,
          title: Text(
            "Uzbek",
            style: MyStyles.latoregular400
                .copyWith(fontSize: 16, color: MyColors.cFFFFFF),
          ),
          value: 0,
          groupValue: selectedLang,
          onChanged: (value) {
            setState(() async {
              selectedLang = value as int;
              context.setLocale(const Locale('uz', 'UZ'));
              widget.onTap();
              await StorageRepository.saveInt("selectedLang", selectedLang);
            });
          },
        ),
        RadioListTile(
          activeColor: MyColors.cFFFFFF,
          selectedTileColor: MyColors.cFFFFFF,
          title: Text(
            "English",
            style: MyStyles.latoregular400
                .copyWith(fontSize: 16, color: MyColors.cFFFFFF),
          ),
          value: 1,
          groupValue: selectedLang,
          onChanged: (value) {
            setState(() async {
              selectedLang = value as int;
              context.setLocale(const Locale('en', 'US'));
              widget.onTap();
              await StorageRepository.saveInt("selectedLang", selectedLang);
            });
          },
        ),
        RadioListTile(
          activeColor: MyColors.cFFFFFF,
          selectedTileColor: MyColors.cFFFFFF,
          title: Text(
            "Russian",
            style: MyStyles.latoregular400
                .copyWith(fontSize: 16, color: MyColors.cFFFFFF),
          ),
          value: 2,
          groupValue: selectedLang,
          onChanged: (value) {
            setState(() async {
              widget.onTap();
              selectedLang = value as int;
              context.setLocale(const Locale('ru', 'RU'));
              await StorageRepository.saveInt("selectedLang", selectedLang);
            });
          },
        ),
      ],
    );
  }
}
