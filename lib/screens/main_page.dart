import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uptodo_app/screens/HomePage.dart';
import 'package:uptodo_app/screens/profile_page.dart';
import 'package:uptodo_app/screens/screen1.dart';
import 'package:uptodo_app/screens/task_page.dart';
import 'package:uptodo_app/utils/colors.dart';
import 'package:uptodo_app/utils/styles.dart';
import 'package:uptodo_app/widgets/add_taskwidget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget>  pages =  [
      const HomePage(),
      const Screen1(),
      const HomePage(),
      const TaskPage(),
      const ProfiePage(),
    ];

    return Scaffold(
      body: pages[_selectedIndex],
      backgroundColor: Colors.black,
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              if(index == 2){
                showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: MyColors.c363636,
                  context: context,
                  builder: (context) {
                  return AddTaskWidget(
                    onNewTask: () {
                      setState(() {
                        _selectedIndex = 0;
                      });
                    },
                  );
                },
              );
              }
              _selectedIndex = index;
            });
          },
          iconSize: 28,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.50),
          backgroundColor: MyColors.c363636,
          type: BottomNavigationBarType.fixed,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Index',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Calendar',
            ),
            BottomNavigationBarItem(
              icon: Center(
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const  BoxDecoration(
                    shape: BoxShape.circle,
                    color: MyColors.c8875FF,
                  ),
                  child: Center(
                    child: Text("+", style: MyStyles.latobold700.copyWith(fontSize: 20, color: MyColors.c000000),),
                  ),
                ),
              ),
              label: "",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.watch_later_outlined),
              label: 'Focus',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}