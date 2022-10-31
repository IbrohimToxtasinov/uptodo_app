import 'package:flutter/material.dart';
import 'package:uptodo_app/models/uptodo_models.dart';
import 'package:uptodo_app/utils/colors.dart';
import 'package:uptodo_app/utils/styles.dart';

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          color: MyColors.c363636,
        ),
        height: 370,
        padding: const EdgeInsets.all(24),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Add Task", style: MyStyles.latobold700.copyWith(fontSize: 20, color: MyColors.cFFFFFF.withOpacity(0.87)),),
              const SizedBox(height: 22,),
              TextFormField(
              onSaved: (val) {
                newDescription = val ?? "";
              },
              validator: (value) {
                newTitle = value ?? "";
                return value!.isEmpty
                    ? "Please add description to your to do app"
                    : "";
              },
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyColors.c979797, width: 1)),
                filled: true,
                fillColor: MyColors.c363636,
                focusColor: Colors.grey,
                hintText: "Title",
                hintStyle:
                    MyStyles.latoregular400.copyWith(color: MyColors.cFFFFFF.withOpacity(0.87)),
              ),
            ),
              const SizedBox(height: 12),
              TextFormField(
              onSaved: (val) {
                newDescription = val ?? "";
              },
              validator: (value) {
                newDescription = value ?? "";
                return value!.isEmpty
                    ? "Please add description to your to do app"
                    : "";
              },
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyColors.c979797, width: 1)),
                filled: true,
                fillColor: MyColors.c363636,
                focusColor: Colors.grey,
                hintText: "Description",
                hintStyle:
                    MyStyles.latoregular400.copyWith(color: MyColors.cFFFFFF.withOpacity(0.87)),
              ),
            ),
              SizedBox(height: 12),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        formKey.currentState?.save();
                        var newTodo = TodoModel(
                          title: newTitle,
                          description: newDescription,
                          date: "date",
                          priority: "priority",
                          isCompleted: 0,
                        );
                        LocalDatabase.insertToDatabase(newTodo);

                        widget.onNewTask();

                        Navigator.pop(context);
                      },
                      child: Text("Add")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}