import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uptodo_app/database/shared_praferences.dart';
import 'package:uptodo_app/screens/login_page.dart';
import 'package:uptodo_app/screens/main_page.dart';
import 'package:uptodo_app/utils/colors.dart';
import 'package:uptodo_app/utils/images.dart';
import 'package:uptodo_app/utils/styles.dart';

Widget backarrowWidget(BuildContext context, {bottom}) {
  return Padding(
    padding: EdgeInsets.only(left: 24, top: 14, bottom: bottom),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset(MyImages.iconBackArrow, width: 24, height: 24)),
        const SizedBox(),
      ],
    ),
  );
}

// ignore: avoid_init_to_null
// Widget button(BuildContext context, {height, text, color, pagename, textcolor, parol}) {
//   return Padding(
//     padding: const EdgeInsets.only(left: 24, right: 24),
//     child: InkWell(
//       onTap: () async {
//         if(parol == true) {
//           Navigator.push(
//             context, MaterialPageRoute(builder: (context) => const MainPage()));
//             print();
//             await StorageRepository.saveString("name", controller1.text);
//             await StorageRepository.saveString("password", controller1.text);
//         }
//       },
//       child: Container(
//         width: double.infinity,
//         height: height,
//         decoration: BoxDecoration(
//           color: color,
//           border: Border.all(width: 2, color: MyColors.c8E7CFFF),
//           borderRadius: BorderRadius.circular(4),
//         ),
//         child: Center(child: Text(text, style: MyStyles.latoregular400.copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: textcolor),)),
//       ),
//     ),
//   );
// }