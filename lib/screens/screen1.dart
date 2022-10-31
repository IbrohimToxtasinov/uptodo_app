import 'package:flutter/material.dart';
import 'package:uptodo_app/database/local_database.dart';
import 'package:uptodo_app/models/uptodo_models.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: LocalDatabase.getList(),
        builder:
            (BuildContext context, AsyncSnapshot<List<TodoModel>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(snapshot.data?[index].id.toString() ?? "-1"),
                      Text(
                          snapshot.data?[index].title.toString() ?? "No title"),
                      Text(snapshot.data?[index].description.toString() ??
                          "No desc"),
                    ],
                  );
                });
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}