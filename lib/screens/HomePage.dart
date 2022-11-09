import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uptodo_app/database/shared_praferences.dart';
import 'package:uptodo_app/models/uptodo_models.dart';
import 'package:uptodo_app/screens/task_page.dart';
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
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(MyImages.iconMenu),
        ),
        backgroundColor: Colors.black,
        title: Text(
          "Home Page",
          style: MyStyles.latobolditalic700
              .copyWith(color: MyColors.cFFFFFF, fontSize: 20),
        ),
        actions: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: const CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage(MyImages.imageMyIcon),
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
      backgroundColor: Colors.black,
      body: Column(children: [
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
              prefixIcon: Icon(
                Icons.search,
                color: Color.fromARGB(255, 100, 99, 99),
              ),
              hintStyle: TextStyle(
                  color: Color.fromARGB(255, 100, 99, 99),
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
              filled: true,
              fillColor: Colors.black,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 100, 99, 99),
                  )),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 100, 99, 99),
                  )),
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ExpansionTile(
                  iconColor: Colors.white,
                  title: const Text(
                    'Uncompleted',
                    style: TextStyle(color: Colors.white),
                  ),
                  children: [
                    FutureBuilder(
                      future: LocalDatabase.getTodosIsCompleted(0, title: search),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<TodoModel>> snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data!.isEmpty) {
                            return Center(
                                child: pustoWidget(
                              context,
                              title: "What do you want to do today?",
                              description: "Tap + to add your tasks",
                              image: MyImages.iconHomePage,
                            ));
                          }
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data?.length ?? 0,
                            itemBuilder: (context, index) {
                              return TaskItem(
                                model: snapshot.data?[index],
                                onSelected: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => TaskPage(
                                                todo: snapshot.data![index],
                                                onDeleted: () {
                                                  setState(
                                                    () {},
                                                  );
                                                },
                                              )));
                                },
                                onCompleted: (TodoModel todo) {
                                  setState(() {
                                    LocalDatabase.updateTaskById(
                                      todo.copyWith(isCompleted: 1),
                                    );
                                  });
                                },
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        }
                        return const Center(child: CircularProgressIndicator());
                      },
                    ),
                  ],
                ),
                ExpansionTile(
                  iconColor: Colors.white,
                  title: const Text(
                    'Completed',
                    style: TextStyle(color: Colors.white),
                  ),
                  children: [
                    FutureBuilder(
                      future: LocalDatabase.getTodosIsCompleted(1, title: search),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<TodoModel>> snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data!.isEmpty) {
                            return Center(
                                child: pustoWidget(
                              context,
                              title: "What do you want to do today?",
                              description: "Tap + to add your tasks",
                              image: MyImages.iconHomePage,
                            ));
                          }
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data?.length ?? 0,
                            itemBuilder: (context, index) {
                              return TaskItem(
                                model: snapshot.data?[index],
                                onSelected: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => TaskPage(
                                                todo: snapshot.data![index],
                                                onDeleted: () {
                                                  setState(
                                                    () {},
                                                  );
                                                },
                                              )));
                                },
                                onCompleted: (TodoModel todo) {
                                  setState(() {
                                    LocalDatabase.updateTaskById(
                                      todo.copyWith(isCompleted: 0),
                                    );
                                  });
                                },
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        }
                        return const Center(child: CircularProgressIndicator());
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
