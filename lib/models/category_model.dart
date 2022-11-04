import 'package:uptodo_app/utils/images.dart';

class TodoCategory {
  String name;
  String iconName;
  int colorName;

  TodoCategory({
    required this.name,
    required this.iconName,
    required this.colorName
  });

  static List<TodoCategory> categories = [
    TodoCategory(colorName: 0xffCCFF80, name: "Grocery", iconName: MyImages.iconGrocery),
    TodoCategory(colorName: 0xffFF9680, name: "Work", iconName: MyImages.iconWork),
    TodoCategory(colorName: 0xff80FFFF, name: "Sport", iconName: MyImages.iconsport),
    TodoCategory(colorName: 0xff80FFD9, name: "Design", iconName: MyImages.iconDesign),
    TodoCategory(colorName: 0xff809CFF, name: "University", iconName: MyImages.iconUniversity),
    TodoCategory(colorName: 0xffFF80EB, name: "Social", iconName: MyImages.iconSocial),
    TodoCategory(colorName: 0xffFC80FF, name: "Music", iconName: MyImages.iconMusic),
    TodoCategory(colorName: 0xff80FFA3, name: "Health", iconName: MyImages.iconHealth),
    TodoCategory(colorName: 0xff80D1FF, name: "Movie", iconName: MyImages.iconMovie),
    TodoCategory(colorName: 0xffFF8080, name: "Home", iconName: MyImages.iconHome),
    TodoCategory(colorName: 0xff80FFD1, name: "Create New", iconName: MyImages.iconCreateNew),
  ];
}