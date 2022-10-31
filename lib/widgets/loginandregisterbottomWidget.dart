import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uptodo_app/utils/colors.dart';
import 'package:uptodo_app/utils/images.dart';
import 'package:uptodo_app/utils/styles.dart';

Widget buildloginandregisterbottom(BuildContext context, {name, name2, pagname, height}) {
  return Padding(
    padding: const EdgeInsets.only(left: 24, right: 24),
    child: Column(
      children: [
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(MyImages.iconLine),
            Text("or",
                style: MyStyles.latoregular400.copyWith(
                    fontSize: 16,
                    color: MyColors.c979797,
                    fontWeight: FontWeight.w400)),
            SvgPicture.asset(MyImages.iconLine),
          ],
         ),
        SizedBox(height: height),
        InkWell(
          onTap: () {},
          child: Container(
            width: double.infinity,
            height: 48,
            decoration: BoxDecoration(
              color: MyColors.c000000,
              border:
                  Border.all(width: 2, color: MyColors.c8E7CFFF),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(MyImages.iconGoogle),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "$name with Google",
                    style: MyStyles.latoregular400.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: MyColors.cFFFFFF),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        InkWell(
          onTap: () {},
          child: Container(
            width: double.infinity,
            height: 48,
            decoration: BoxDecoration(
              color: MyColors.c000000,
              border:
                  Border.all(width: 2, color: MyColors.c8E7CFFF),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(MyImages.iconApple),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "$name with Appe",
                    style: MyStyles.latoregular400.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: MyColors.cFFFFFF),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 46),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Don’t have an account?",
              style: MyStyles.latoregular400.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: MyColors.c979797)),
            const SizedBox(width: 10),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => pagname)));
              },
              child: Text(name2,
                style: MyStyles.latoregular400.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: MyColors.cFFFFFF.withOpacity(0.87),
                )
              )
            ),
          ],
        ),
      ],
    ),
  );
}