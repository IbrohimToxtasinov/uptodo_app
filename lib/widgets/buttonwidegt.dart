import 'package:flutter/cupertino.dart';
import 'package:uptodo_app/utils/colors.dart';
import 'package:uptodo_app/utils/styles.dart';

Widget buildbuttonWidget(BuildContext context, {text}) {
  return Container(
    height: 58,
    width: 154,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      color: MyColors.c363636,
    ),
    child: Center(
      child: Text(
        text,
        style: MyStyles.latoregular400.copyWith(
            fontSize: 16, color: MyColors.cFFFFFF, fontWeight: FontWeight.w400),
      ),
    ),
  );
}
