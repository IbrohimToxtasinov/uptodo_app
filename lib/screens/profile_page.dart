import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uptodo_app/database/shared_praferences.dart';
import 'package:uptodo_app/utils/colors.dart';
import 'package:uptodo_app/utils/images.dart';
import 'package:uptodo_app/utils/styles.dart';
import 'package:uptodo_app/widgets/buttonwidegt.dart';
import 'package:uptodo_app/widgets/select_languages.dart';

class ProfiePage extends StatefulWidget {
  const ProfiePage({super.key});

  @override
  State<ProfiePage> createState() => _ProfiePageState();
}

String name = StorageRepository.getString("userName");

class _ProfiePageState extends State<ProfiePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        backgroundColor: MyColors.c000000,
        title: Text(
          "Profile".tr(),
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
                name,
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
                  buildbuttonWidget(context, text: "10 Task left".tr()),
                  buildbuttonWidget(context, text: "5 Task done".tr()),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Settings".tr(),
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
              initiallyExpanded: false,
              title: Row(
                children: [
                  SvgPicture.asset(MyImages.iconSettings),
                  const SizedBox(
                    width: 10,
                  ),
                  Text("App Settings".tr(),
                      style: MyStyles.latoregular400.copyWith(
                          color: MyColors.cFFFFFF.withOpacity(0.87),
                          fontSize: 16,
                          fontWeight: FontWeight.w400))
                ],
              ),
              children: [
                TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Change name".tr()),
                          content: TextFormField(
                            initialValue: name,
                            onChanged: (val) {
                              setState(() {
                                name = val;
                              });
                            },
                          ),
                          actions: [
                            TextButton(
                                onPressed: () async {
                                  await StorageRepository.saveString(
                                      "userName", name);
                                  Navigator.pop(context);
                                },
                                child: Text("Save".tr())),
                          ],
                        ),
                      );
                    },
                    child: Text(
                      "Edit Username".tr(),
                    )),
                TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (((context) => StatefulBuilder(
                                    builder: (context, state) {
                            return AlertDialog(
                              backgroundColor: MyColors.c363636,
                              content: SizedBox(
                                height: 168,
                                width: 500,
                                child: SelectLang(
                                  onTap: () {
                                    state(() {
                                      
                                    });
                                  },
                                ),
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      setState(() {
                                        Navigator.pop(context);
                                        
                                      });
                                    },
                                    child: const Text("Ok"))
                              ],
                            );
                          }))));
                    },
                    child: Text(
                      "Edit Languages".tr(),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
