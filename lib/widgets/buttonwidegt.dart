// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uptodo_app/database/local_database.dart';
import 'package:uptodo_app/screens/main_page.dart';
import 'package:uptodo_app/utils/colors.dart';
import 'package:uptodo_app/utils/images.dart';
import 'package:uptodo_app/utils/styles.dart';
import 'package:uptodo_app/widgets/update_taskwidget.dart';

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

Widget buildtaskWidget(BuildContext context,
    {required VoidCallback onDeleted,
    title,
    name,
    category,
    priority,
    iconName,
    description,
    colorName,
    isCompleted,
    id}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
                color: isCompleted == 1 ? Colors.green : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                )),
            height: 20,
            width: 20,
          ),
          const SizedBox(
            width: 21,
          ),
          Text(
            title,
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
          Text(description,
              style: MyStyles.latoregular400.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: MyColors.cAFAFAF))
        ],
      ),
      const SizedBox(height: 40),
      taskswidget(context,
          name: name, taskname: "Task Time :", taskicon: MyImages.iconTime),
      const SizedBox(height: 34),
      taskCategoryWidget(context,
          iconName: iconName,
          name: category,
          taskname: "Task Category :",
          taskicon: MyImages.iconTag,
          colorName: colorName),
      const SizedBox(height: 34),
      taskPrioritywidget(context,
          name: priority,
          taskname: "Task Priority :",
          taskicon: MyImages.iconFlag),
      const SizedBox(height: 34),
      taskswidget(context,
          name: "Add Sub - Task",
          taskname: "Sub - Task :",
          taskicon: MyImages.iconSub),
      const SizedBox(height: 34),
      InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Delete"),
                  content: Text(
                    "Are you sure to delete task $title",
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("NO"),
                    ),
                    TextButton(
                      onPressed: () async {
                        var res = await LocalDatabase.deleteTaskById(id);
                        if (res != 0) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const MainPage()));
                          onDeleted();
                        }
                      },
                      child: const Text("YES"),
                    ),
                  ],
                );
              });
        },
        child: Text(
          "Delete task",
          style: MyStyles.latoregular400.copyWith(
              fontWeight: FontWeight.w400, fontSize: 16, color: Colors.red),
        ),
      ),
    ],
  );
}

Widget taskswidget(
  BuildContext context, {
  taskname,
  taskicon,
  name,
}) {
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

Widget taskPrioritywidget(
  BuildContext context, {
  taskname,
  taskicon,
  name,
}) {
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
            border: Border.all(width: 2, color: MyColors.c8687E7)),
        child: Center(
            child: Row(
          children: [
            SvgPicture.asset(MyImages.iconFlag),
            const SizedBox(
              width: 10,
            ),
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

Widget taskCategoryWidget(
  BuildContext context, {
  taskname,
  taskicon,
  name,
  iconName,
  colorName,
}) {
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
            borderRadius: BorderRadius.circular(6), color: Color(colorName)),
        child: Center(
            child: Row(
          children: [
            SvgPicture.asset(iconName),
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

Widget editTaskWidget(BuildContext context,
    {height,
    color,
    textcolor,
    textname,
    todo,
    required VoidCallback onUpdatedTask}) {
  return InkWell(onTap: () {
    showModalBottomSheet(
      backgroundColor: MyColors.c363636,
      context: context,
      builder: (context) {
        return UpdateTaskWidget(
          todo: todo,
          onUpdatedTask: onUpdatedTask,
        );
      },
    );
    child:
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: color,
      ),
      child: Center(
          child: Text(textname,
              style: MyStyles.latoregular400.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: textcolor))),
    );
  });
}
