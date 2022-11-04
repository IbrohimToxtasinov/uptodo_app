import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uptodo_app/utils/colors.dart';
import 'package:uptodo_app/utils/images.dart';

Future flagwidget(BuildContext context, {isSelected, newprority}) {
  return showDialog(
      context: context,
      builder: (((context) => StatefulBuilder(
            builder: (context, state) {
              return AlertDialog(
                contentPadding: EdgeInsets.only(top: 8, left: 8, right: 8),
                title: Center(
                    child: Text(
                  'Task Priority',
                  style: TextStyle(color: Colors.white),
                )),
                backgroundColor: MyColors.c363636,
                content: Container(
                  height: MediaQuery.of(context).size.height * 0.42,
                  width: MediaQuery.of(context).size.height * 0.9,
                  color: MyColors.c363636,
                  child: Column(
                    children: [
                      Divider(
                        thickness: 0.7,
                        color: Colors.white70,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.32,
                        width: MediaQuery.of(context).size.height * 0.9,
                        child: GridView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4),
                          itemCount: 10,
                          itemBuilder: ((context, index) {
                            return Padding(
                              padding: EdgeInsets.all(8),
                              child: InkWell(
                                onTap: () {
                                  state(() {
                                    isSelected = index;
                                    newprority = (index + 1).toString();
                                  });
                                },
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: isSelected == index
                                          ? MyColors.c8687E7
                                          : Color(0xFF272727),
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        child: SvgPicture.asset(
                                          MyImages.iconFlag,
                                          width: 26,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Container(
                                        child: Text(
                                          (index + 1).toString(),
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 45),
                            child: InkWell(
                                onTap: (() {
                                  Navigator.pop(context);
                                }),
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )),
                          ),
                          InkWell(
                              onTap: () {
                                state(() {
                                  Navigator.pop(context);
                                
                                });
                              },
                              child: Container(
                                  height: 50,
                                  width: 120,
                                  color: MyColors.c8687E7,
                                  child: Container(
                                      child: Center(
                                          child: Text(
                                    'Save',
                                    style: TextStyle(color: Colors.white),
                                  )))))
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ))));
}
