import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uptodo_app/utils/colors.dart';
import 'package:uptodo_app/utils/images.dart';
import 'package:uptodo_app/utils/styles.dart';
import 'package:uptodo_app/widgets/my_back_arrowwidget.dart';

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

Widget buildsvgbuttonWidget({iconName}) {
  return Container(
    height: 32,
    width: 32,
    padding: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: MyColors.c1D1D1D,
      borderRadius: BorderRadius.circular(4),
    ),
    child: SvgPicture.asset(iconName),
  );
}

Widget buildtaskWidget(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 1.5, color: MyColors.cFFFFFF),
              color: MyColors.c363636,
            ),
          ),
          const SizedBox(
            width: 21,
          ),
          Text(
            "Do Math Homework",
            style: MyStyles.latoregular400.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: MyColors.cFFFFFF.withOpacity(0.87)),
          ),
          const Spacer(),
          SvgPicture.asset(MyImages.iconEdit),
        ],
      ),
      const SizedBox(height: 15),
      Row(
        children: [
          const SizedBox(width: 37),
          Text("Do chapter 2 to 5 for next week",
              style: MyStyles.latoregular400.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: MyColors.cAFAFAF))
        ],
      ),
      const SizedBox(height: 38),
      taskswidget(
          context,
          name: "Today At 16:45",
          taskname: "Task Time :",
          taskicon: MyImages.iconTime),
      const SizedBox(height: 34),
      taskTimeWidget(
          context,
          name: "University",
          taskname: "Task Category :",
          taskicon: MyImages.iconTag),
      const SizedBox(height: 34),
      taskswidget(
          context,
          name: "Default",
          taskname: "Task Priority :",
          taskicon: MyImages.iconFlag),
      const SizedBox(height: 34),
      taskswidget(
          context,
          name: "Add Sub - Task",
          taskname: "Sub - Task :",
          taskicon: MyImages.iconFlag),
      const SizedBox(height: 34),
      Text(
        "Delete task",
        style: MyStyles.latoregular400.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Colors.red),
      ),
      const SizedBox(height: 120),
      editTaskWidget(context, height: 48.0, color: MyColors.c8687E7, textcolor: MyColors.cFFFFFF, textname: "Edit Task"),
    ],
  );
}
Widget editTaskWidget(BuildContext context, {height, color, textcolor, textname}) {
  return Container(
    height: height,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      color: color,
    ),
    child: Center(child: Text(textname, style: MyStyles.latoregular400.copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: textcolor))),
  );
}



Widget taskswidget(
  BuildContext context,
  {
    taskname,
    taskicon,
    name,
  }
) {
  return Row(
    children: [
      SvgPicture.asset(taskicon),
      const SizedBox(width: 8),
      Text(taskname,
          style: MyStyles.latoregular400.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: MyColors.cFFFFFF.withOpacity(0.87))),
      const Spacer(),
      Container(
        height: 37,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: MyColors.cFFFFFF.withOpacity(0.21),
        ),
        child: Center(
            child: Text(
          name,
          style: MyStyles.latoregular400.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: MyColors.cFFFFFF.withOpacity(0.87)),
        )),
      ),
    ],
  );
}
Widget taskTimeWidget(
  BuildContext context,
  {
    taskname,
    taskicon,
    name,
  }
) {
  return Row(
    children: [
      SvgPicture.asset(taskicon),
      const SizedBox(width: 8),
      Text(taskname,
          style: MyStyles.latoregular400.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: MyColors.cFFFFFF.withOpacity(0.87))),
      const Spacer(),
      Container(
        height: 37,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: MyColors.cFFFFFF.withOpacity(0.21),
        ),
        child: Center(
            child: Row(
          children: [
            SvgPicture.asset(MyImages.iconUniversity),
            const SizedBox(width: 10),
            Text(
              name,
              style: MyStyles.latoregular400.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: MyColors.cFFFFFF.withOpacity(0.87)),
            ),
          ],
        )),
      ),
    ],
  );
}
