import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uptodo_app/database/local_database.dart';
import 'package:uptodo_app/models/category_model.dart';
import 'package:uptodo_app/models/uptodo_models.dart';
import 'package:uptodo_app/utils/colors.dart';
import 'package:uptodo_app/utils/images.dart';
import 'package:uptodo_app/utils/time_utils.dart';

class TaskItem extends StatelessWidget {
  final TodoModel? model;
  final TodoCategory? category;
  final VoidCallback onSelected;
  final ValueChanged<TodoModel> onCompleted;

  const TaskItem(
      {Key? key,
      required this.model,
      required this.onSelected,
      required this.onCompleted,
      this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: MyColors.c363636,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              onCompleted(model!);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: model!.isCompleted == 1
                      ? Colors.green
                      : Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  )),
              height: 20,
              width: 20,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: onSelected,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                SizedBox(
                  width: 150,
                  child: Text(
                    model!.title.toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  TimeUtils.formatToMyTime(DateTime.parse(model!.date)),
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete_forever,
                    color: Colors.red,
                    size: 28,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 35,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(TodoCategory
                          .categories[model!.categoryId].colorName),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(TodoCategory
                            .categories[model!.categoryId].iconName
                            .toString()),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          TodoCategory.categories[model!.categoryId].name
                              .toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Container(
                    width: 60,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(width: 2, color: MyColors.c8687E7)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(MyImages.iconFlag),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            model?.priority.toString() ?? "-1",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
