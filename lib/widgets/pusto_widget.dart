// ignore_for_file: file_names

import 'package:flutter_svg/flutter_svg.dart';
import 'package:uptodo_app/utils/colors.dart';
import 'package:uptodo_app/utils/styles.dart';
import 'package:flutter/material.dart';

Widget pustoWidget(BuildContext context,{image, title, description}) {
  double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 50, bottom: 50),
      child: Container(
        color: MyColors.c000000,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              image,
              width: width * 0.6,
              height: 278,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              title,
              style: MyStyles.latoregular400.copyWith(fontSize: 20, fontWeight: FontWeight.w400, color: MyColors.cFFFFFF.withOpacity(0.87), ),textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              description,
              style: MyStyles.latoregular400.copyWith(
                  height: 1.5,
                  fontSize: 16,
                  color: MyColors.cFFFFFF.withOpacity(0.87),
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.7),
              textAlign: TextAlign.center,
            ),
          ),
          ],
        ),
      ),
    );
}