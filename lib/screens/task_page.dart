import 'package:flutter/material.dart';
import 'package:uptodo_app/models/category_model.dart';
import 'package:uptodo_app/models/uptodo_models.dart';
import 'package:uptodo_app/utils/colors.dart';
import 'package:uptodo_app/utils/images.dart';
import 'package:uptodo_app/utils/styles.dart';
import 'package:uptodo_app/utils/time_utils.dart';
import 'package:uptodo_app/widgets/buttonwidegt.dart';
import 'package:uptodo_app/widgets/update_taskwidget.dart';

class TaskPage extends StatefulWidget {
  final TodoModel todo;
  final VoidCallback onDeleted;
  const TaskPage({super.key, required this.todo, required this.onDeleted});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.c000000,
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 30, bottom: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildsvgbuttonWidget(iconName: MyImages.iconClear),
                  buildsvgbuttonWidget(iconName: MyImages.iconRepeat),
                ],
              ),
              const SizedBox(
                height: 38,
              ),
              buildtaskWidget(
                context,
                onDeleted: () {
                  setState(() {});
                },
                id: widget.todo.id,
                title: widget.todo.title,
                description: widget.todo.description,
                category: TodoCategory.categories[widget.todo.categoryId].name,
                name:
                    TimeUtils.formatToMyTime(DateTime.parse(widget.todo.date)),
                priority: widget.todo.priority,
                iconName:
                    TodoCategory.categories[widget.todo.categoryId].iconName,
                colorName:
                    TodoCategory.categories[widget.todo.categoryId].colorName,
                isCompleted: widget.todo.isCompleted,
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: MyColors.c363636,
                      context: context,
                      //   builder: (context) {
                      //     return UpdateTaskWidget(
                      //       todo: widget.todo,
                      //       onUpdatedTask: () {
                      //         setState(() {});
                      //       },
                      //     );
                      //   },
                      // );
                      builder: (((context) =>
                          StatefulBuilder(builder: (context, state) {
                            return UpdateTaskWidget(
                              todo: widget.todo,
                              onUpdatedTask: () {
                                state(() {});
                              },
                            );
                          }))));
                },
                child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: MyColors.c8687E7,
                  ),
                  child: Center(
                    child: Text(
                      "Edit Task",
                      style: MyStyles.latoregular400
                          .copyWith(fontSize: 20, color: MyColors.cFFFFFF),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
