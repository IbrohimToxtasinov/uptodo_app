// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uptodo_app/models/category_model.dart';
import 'package:uptodo_app/utils/colors.dart';
import 'package:uptodo_app/utils/images.dart';
import 'package:uptodo_app/utils/styles.dart';


class CategoryPicker extends StatefulWidget {
  ValueChanged<int> onSelected;

  CategoryPicker({Key? key, required this.onSelected}) : super(key: key);

  @override
  State<CategoryPicker> createState() => _CategoryPickerState();
}
  int count = -1;
class _CategoryPickerState extends State<CategoryPicker> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.625,
      width: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        children: [
          Text("Choose Category", style: MyStyles.latobold700.copyWith(fontSize: 16, color: MyColors.cFFFFFF.withOpacity(0.87), fontWeight: FontWeight.w700)),
          const SizedBox(height: 5),
          const Divider(thickness: 1, color: MyColors.c979797),
          const SizedBox(height: 10),
          Container(
            height: 400,
            child: GridView.builder(
                itemCount: TodoCategory.categories.length,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 4,
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  return categoryItem(TodoCategory.categories[index], index);
                }
              ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 33, right: 8, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: (() {
                    Navigator.pop(context);
                  }),
                child: Container(
                  height: 48,
                  width: 120,
                  decoration: BoxDecoration(
                    color: MyColors.c363636,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Text("Cancel", style: MyStyles.latoregular400.copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: MyColors.cFFFFFF),)))           
                ),
                InkWell(
                  onTap: (() {
                    widget.onSelected(count);
                    Navigator.pop(context);
                  }),
                child: Container(
                  height: 48,
                  width: 120,
                  decoration: BoxDecoration(
                    color: MyColors.c8687E7,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Text("Edit", style: MyStyles.latoregular400.copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: MyColors.cFFFFFF),)))           
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget categoryItem(TodoCategory category, int index) {
    return InkWell(
      onTap: () {
        count = index;
      },
      child: Column(
        children: [
          Container(
            height: 64,
            width: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Color(category.colorName),
            ),
            child: Center(
              child: SvgPicture.asset(category.iconName)
            ),
          ),
          const SizedBox(height: 4),
          Expanded(
            child: Text(
              category.name,
              style: MyStyles.latoregular400.copyWith(color: MyColors.cFFFFFF.withOpacity(0.87), fontWeight: FontWeight.w500, fontSize: 14)
            ),
          ),
        ],
      ),
    );
  }
}