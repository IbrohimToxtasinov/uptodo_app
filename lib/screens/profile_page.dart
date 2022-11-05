import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uptodo_app/utils/colors.dart';
import 'package:uptodo_app/utils/images.dart';
import 'package:uptodo_app/utils/styles.dart';
import 'package:uptodo_app/widgets/buttonwidegt.dart';

class ProfiePage extends StatelessWidget {
  const ProfiePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        backgroundColor: MyColors.c000000,
        title: Text(
          "Profile",
          style: MyStyles.latobolditalic700
              .copyWith(color: MyColors.cFFFFFF, fontSize: 20),
        ),
      ),
      backgroundColor: MyColors.c000000,
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(MyImages.imageMyIcon),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "Ibrohim Toxtasinov",
                style: MyStyles.latoregular400.copyWith(
                    fontSize: 20, color: MyColors.cFFFFFF.withOpacity(0.87)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildbuttonWidget(context, text: "10 Task left"),
                  buildbuttonWidget(context, text: "5 Task done"),
                ],
              ),
            ),
            Text(
              "Settings",
              style: MyStyles.latoregular400.copyWith(
                  fontSize: 14,
                  color: MyColors.cAFAFAF,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 16,
            ),
            ExpansionTile(
              iconColor: MyColors.cFFFFFF,
              title: Row(
                children: [
                  SvgPicture.asset(MyImages.iconSettings),
                  const SizedBox(width: 10,),
                  Text("App Settings",
                      style: MyStyles.latoregular400.copyWith(
                          color: MyColors.cFFFFFF.withOpacity(0.87),
                          fontSize: 16,
                          fontWeight: FontWeight.w400))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
