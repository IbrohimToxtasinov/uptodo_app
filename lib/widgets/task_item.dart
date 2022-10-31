import 'package:flutter/material.dart';
import 'package:uptodo_app/database/local_database.dart';
import 'package:uptodo_app/models/uptodo_models.dart';
import 'package:uptodo_app/utils/colors.dart';
import 'package:uptodo_app/utils/styles.dart';


class TaskItem extends StatelessWidget {
  TodoModel? model;
  final VoidCallback onDeleted;

  TaskItem({
    Key? key,
    required this.model,
    required this.onDeleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: MyColors.c363636,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 270,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Text(
                //   model?.id.toString() ?? "-1",
                //   style: const TextStyle(color: Colors.white),
                // ),
                const SizedBox(height: 8),
                Text(
                  model?.title.toString() ?? "No title",
                  style: MyStyles.latobolditalic700.copyWith(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(height: 8),
                Text(
                  model?.description.toString() ?? "No desc",
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Delete"),
                        content: Text(
                          "Are you sure to delete task ${model?.title}",
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
                              var res = await LocalDatabase.deleteTaskById(
                                  model!.id!);

                              if (res != 0) {
                                // ignore: use_build_context_synchronously
                                Navigator.pop(context);
                                onDeleted();
                              }
                            },
                            child: const Text("YES"),
                          ),
                        ],
                      );
                    });
              },
              icon: Icon(
                Icons.delete_forever,
                color: Colors.red,
                size: 28,
              ))
        ],
      ),
    );
  }
}