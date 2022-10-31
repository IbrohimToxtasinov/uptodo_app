// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:uptodo_app/utils/colors.dart';
import 'package:uptodo_app/utils/styles.dart';

//Title and Description 
Widget textanddescriptionWidget(context, {title, description}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          title,
          style: MyStyles.latobold700.copyWith(fontSize: 32, fontWeight: FontWeight.w700, color: MyColors.cFFFFFF.withOpacity(0.87), ),textAlign: TextAlign.center,
        ),
      ),
      const SizedBox(
        height: 42,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Text(
          description,
          style: MyStyles.latoregular400.copyWith(
              height: 1.5,
              fontSize: 16,
              color: MyColors.cFFFFFF.withOpacity(0.67),
              fontWeight: FontWeight.w400,
              letterSpacing: 0.7),
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );
}

//Login & Register
Widget textboldWidget(BuildContext context, {botom, title}) {
  return Padding(
    padding: EdgeInsets.only(left: 24, bottom: botom),
    child: Text(
      title,
      style: MyStyles.latobold700.copyWith(fontSize: 32, fontWeight: FontWeight.w700, color: MyColors.cFFFFFF.withOpacity(0.87)),
      textAlign: TextAlign.start,
    ),
  );
}

