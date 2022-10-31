// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:uptodo_app/models/uptodo_models.dart';
import 'package:uptodo_app/utils/colors.dart';
import 'package:uptodo_app/utils/images.dart';
import 'package:uptodo_app/utils/styles.dart';
import 'package:uptodo_app/widgets/my_sliderwidget.dart';
import 'package:uptodo_app/widgets/pusto_widget.dart';
import 'package:uptodo_app/widgets/task_item.dart';

import '../database/local_database.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: LocalDatabase.getList(),
        builder:
            (BuildContext context, AsyncSnapshot<List<TodoModel>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return Center(
                  child: pustoWidget(context,
                      title: "What do you want to do today?",
                      description: "Tap + to add your tasks",
                      image: MyImages.iconHomePage));
            }
            return Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextField(
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: "Search for your task...",
                      prefixIcon: Icon(Icons.search, color: Color.fromARGB(255, 100, 99, 99),),
                      hintStyle: TextStyle(color: Color.fromARGB(255, 100, 99, 99), fontWeight: FontWeight.w400, fontSize: 16),
                      filled: true,
                      fillColor: Colors.black,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Color.fromARGB(255, 100, 99, 99),)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Color.fromARGB(255, 100, 99, 99),)
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    width: 76,
                    height: 31,
                    padding: const EdgeInsets.only(left: 10, top: 5, bottom: 7, right: 7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: MyColors.cFFFFFF.withOpacity(0.21),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Today", style: MyStyles.latoregular400.copyWith(fontSize: 12, color: MyColors.cFFFFFF.withOpacity(0.87))),
                          Icon(Icons.arrow_drop_down_sharp, color: MyColors.cFFFFFF.withOpacity(0.87),)
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return TaskItem(
                          model: snapshot.data?[index],
                          onDeleted: () {
                            setState(() {});
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
