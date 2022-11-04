import 'package:flutter/material.dart';
import 'package:uptodo_app/models/uptodo_models.dart';
import 'package:uptodo_app/utils/images.dart';
import 'package:uptodo_app/utils/styles.dart';
import 'package:uptodo_app/widgets/pusto_widget.dart';
import 'package:uptodo_app/widgets/task_item.dart';
import 'package:uptodo_app/widgets/update_taskwidget.dart';

import '../database/local_database.dart';
import '../utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String search = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SizedBox(
          height: 670,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  onChanged: (val) {
                    setState(() {
                      search = val;
                    });
                  },
                  style: MyStyles.latoregular400.copyWith(color: MyColors.cFFFFFF),
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  decoration: const InputDecoration(
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
              ),
              Expanded(
                child: FutureBuilder(
                  future: LocalDatabase.getTaskByTitle(title: search),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<TodoModel>> snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.isEmpty) {
                        return Center(
                          child: pustoWidget(context,
                            title: "What do you want to do today?",
                            description: "Tap + to add your tasks",
                            image: MyImages.iconHomePage,
                          )
                        );
                      }
                      return Container(
                        height: 1000,
                        child: ListView.builder(
                          itemCount: snapshot.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            return TaskItem(
                              model: snapshot.data?[index],
                              onDeleted: () {
                                setState(() {});
                              },
                              onSelected: () {
                                showModalBottomSheet(
                                  backgroundColor: MyColors.c363636,
                                  context: context,
                                  builder: (context) {
                                    return UpdateTaskWidget(
                                      todo: snapshot.data![index],
                                      onUpdatedTask: () {
                                        setState(() {});
                                      },
                                    );
                                  },
                                );
                              },
                            );
                          },
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}