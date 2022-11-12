import 'package:easy_localization/easy_localization.dart';
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
    final List<Widget> pages = [
    const HomePage(),
    const Screen1(),
    const HomePage(),
    Container(),
     ProfiePage(onTap: () {
       setState(() {
         
       });
     },),
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
              if (index == 2) {
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
            BottomNavigationBarItem(
              icon: const Icon(Icons.home_filled),
              label: 'Home'.tr(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.calendar_month),
              label: 'Calendar'.tr(),
            ),
            BottomNavigationBarItem(
              icon: Center(
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: MyColors.c8875FF,
                  ),
                  child: Center(
                    child: Text(
                      "+",
                      style: MyStyles.latobold700
                          .copyWith(fontSize: 20, color: MyColors.c000000),
                    ),
                  ),
                ),
              ),
              label: "Add".tr(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.watch_later_outlined),
              label: 'Focus'.tr(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person_outline),
              label: 'Profile'.tr(),
            ),
          ],
        ),
      ),
    );
  }

  
}
