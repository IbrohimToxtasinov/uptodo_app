import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uptodo_app/models/uptodo_models.dart';
import 'package:uptodo_app/utils/colors.dart';
import 'package:uptodo_app/utils/images.dart';
import 'package:uptodo_app/utils/styles.dart';
import 'package:uptodo_app/utils/time_utils.dart';
import 'package:uptodo_app/widgets/categorywidget.dart';
import 'package:uptodo_app/widgets/flagwidget.dart';

import '../../database/local_database.dart';

class AddTaskWidget extends StatefulWidget {
  VoidCallback onNewTask;

  AddTaskWidget({Key? key, required this.onNewTask}) : super(key: key);

  @override
  State<AddTaskWidget> createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends State<AddTaskWidget> {
  final formKey = GlobalKey<FormState>();
  String newTitle = "";
  String newDescription = "";
  String newprority = "";
  DateTime? taskDay; // 02.11.2022 ----
  TimeOfDay? taskTime; // ---------- 21:25
  int isSelected = -1;
  int categoryId = -1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Form(
        key: formKey,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            color: MyColors.c363636,
          ),
          height: 320,
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Add Task",
                  style: MyStyles.latobolditalic700.copyWith(
                      fontSize: 30, color: MyColors.cFFFFFF.withOpacity(0.87))),
              const SizedBox(height: 20,),
              TextFormField(
                onSaved: (val) {
                  newTitle = val ?? "";
                },
                maxLength: 20, 
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: MyColors.c979797, width: 1)),
                  filled: true,
                  fillColor: MyColors.c363636,
                  focusColor: Colors.grey,
                  hintText: "Title",
                  hintStyle: MyStyles.latoregular400
                      .copyWith(color: MyColors.cFFFFFF.withOpacity(0.87)),
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                onSaved: (val) {
                  newDescription = val ?? "";
                },
                maxLength: 20,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: MyColors.c979797, width: 1)),
                  filled: true,
                  fillColor: MyColors.c363636,
                  focusColor: Colors.grey,
                  hintText: "Description",
                  hintStyle: MyStyles.latoregular400
                      .copyWith(color: MyColors.cFFFFFF.withOpacity(0.87)),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () async {
                          taskDay = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2300),
                          );
                          taskTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          taskDay = DateTime(
                            taskDay!.year,
                            taskDay!.month,
                            taskDay!.day,
                            taskTime!.hour,
                            taskTime!.minute,
                          );
                        },
                        child: SvgPicture.asset(
                          MyImages.iconTime,
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          backgroundColor: MyColors.c363636,
                          content: CategoryPicker(
                            onSelected: (index) {
                              categoryId = index;
                              setState(() {});
                            },
                          ),
                        ),
                      );
                        },
                        child: SvgPicture.asset(MyImages.iconTag),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (((context) => StatefulBuilder(
                                    builder: (context, state) {
                                      return AlertDialog(
                                        contentPadding: const EdgeInsets.only(
                                            top: 8, left: 8, right: 8),
                                        title: const Center(
                                            child: Text(
                                          'Task Priority',
                                          style: TextStyle(color: Colors.white),
                                        )),
                                        backgroundColor: MyColors.c363636,
                                        content: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.42,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.9,
                                          color: MyColors.c363636,
                                          child: Column(
                                            children: [
                                              const Divider(
                                                thickness: 0.7,
                                                color: Colors.white70,
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.32,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.9,
                                                child: GridView.builder(
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 4),
                                                  itemCount: 10,
                                                  itemBuilder:
                                                      ((context, index) {
                                                    return Padding(
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      child: InkWell(
                                                        onTap: () {
                                                          state(() {
                                                            isSelected = index;
                                                            newprority =
                                                                (index + 1)
                                                                    .toString();
                                                          });
                                                        },
                                                        child: Container(
                                                          width: 50,
                                                          height: 50,
                                                          decoration: BoxDecoration(
                                                              color: isSelected ==
                                                                      index
                                                                  ? MyColors
                                                                      .c8687E7
                                                                  : const Color(
                                                                      0xFF272727),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6)),
                                                          child: Column(
                                                            children: [
                                                              const SizedBox(
                                                                height: 5,
                                                              ),
                                                              SvgPicture
                                                                  .asset(
                                                                  MyImages
                                                                .iconFlag,
                                                                  width: 26,
                                                                ),
                                                              const SizedBox(
                                                                height: 3,
                                                              ),
                                                              Text(
                                                                (index + 1)
                                                                    .toString(),
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        22,
                                                                    color: Colors
                                                                        .white),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 45),
                                                    child: InkWell(
                                                        onTap: (() {
                                                          Navigator.pop(
                                                              context);
                                                        }),
                                                        child: const Text(
                                                          'Cancel',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        )),
                                                  ),
                                                  InkWell(
                                                      onTap: () {
                                                        state(() {
                                                          Navigator.pop(
                                                              context);
                                                          newprority =
                                                              newprority;
                                                        });
                                                      },
                                                      child: Container(
                                                          height: 50,
                                                          width: 120,
                                                          color:
                                                              MyColors.c8687E7,
                                                          child: const Center(
                                                              child: Text(
                                                            'Save',
                                                            style: TextStyle(
                                                            color: Colors
                                                                .white),
                                                          ))))
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ))));
                        },
                        child: SvgPicture.asset(MyImages.iconFlag),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      formKey.currentState?.save();
                      if (newTitle.isNotEmpty &&
                        newDescription.isNotEmpty &&
                        newprority.isNotEmpty &&
                        taskDay != null &&
                        categoryId != -1 ) {
                          var newTodo = TodoModel(
                            title: newTitle,
                            description: newDescription,
                            date: (taskDay ?? DateTime.now()).toString(),
                            priority: newprority,
                            categoryId: categoryId,
                            isCompleted: 0,
                          );
                          LocalDatabase.insertToDatabase(newTodo);
                          widget.onNewTask();
                          Navigator.pop(context);
                        }
                        else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Malumot To'dirishda xatolik"),
                          content: Container(
                            height: 70,
                            width: 300,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(MyImages.iconTime, color: MyColors.c000000,),
                                    const SizedBox(width: 20,),
                                    SvgPicture.asset(MyImages.iconTag, color: MyColors.c000000,),
                                    const SizedBox(width: 20,),
                                    SvgPicture.asset(MyImages.iconFlag, color: MyColors.c000000,),
                                  ]
                                ),
                                const SizedBox(height: 20,),
                                Text("Barchasini to'ldiring", style: MyStyles.latoregular400.copyWith(fontSize: 20, fontWeight: FontWeight.w400),)
                              ],
                            ),
                          ),

                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Ok"),
                            )
                          ],
                        ),
                      );
                    }
                        },
                    child: SvgPicture.asset(MyImages.iconSend),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
