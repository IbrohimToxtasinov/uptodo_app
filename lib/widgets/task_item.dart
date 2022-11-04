import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uptodo_app/database/local_database.dart';
import 'package:uptodo_app/models/category_model.dart';
import 'package:uptodo_app/models/uptodo_models.dart';
import 'package:uptodo_app/utils/colors.dart';
import 'package:uptodo_app/utils/images.dart';
import 'package:uptodo_app/utils/time_utils.dart';

class TaskItem extends StatelessWidget {
  TodoModel? model;
  TodoCategory? category;
  final VoidCallback onDeleted;
  final VoidCallback onSelected;

  TaskItem({
    Key? key,
    required this.model,
    required this.onDeleted,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelected,
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: MyColors.c363636,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text(
                  TodoCategory.categories[model!.categoryId].name.toString(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                //SvgPicture.asset(TodoCategory)
                const SizedBox(height: 15),
                Text(
                  TimeUtils.formatToMyTime(DateTime.parse(model!.date)),
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
            Column(
              children: [
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
                                    var res =
                                        await LocalDatabase.deleteTaskById(
                                            model!.id!);
                                    if (res != 0) {
                                      Navigator.pop(context);
                                      onDeleted();
                                    }
                                  },
                                  child: Text("YES"),
                                ),
                              ],
                            );
                          });
                    },
                    icon: const Icon(
                      Icons.delete_forever,
                      color: Colors.red,
                      size: 28,
                    )),
                Container(
                  width: 60,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 2, color: MyColors.c8687E7)
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(MyImages.iconFlag),
                        const SizedBox(width: 10,),
                        Text(
                          model?.priority.toString() ?? "-1",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
