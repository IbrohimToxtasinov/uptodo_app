import 'package:flutter/material.dart';
import 'package:uptodo_app/screens/start_screen_page.dart';
import 'package:uptodo_app/utils/colors.dart';
import 'package:uptodo_app/utils/images.dart';
import 'package:uptodo_app/utils/styles.dart';
import 'package:uptodo_app/widgets/my_sliderwidget.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _currentPage = 0;
  final PageController _controller = PageController();
  _onChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    final List <Widget> pages = [
      sliderWidget(context, title: "Manage your tasks", description: "You can easily manage all of your daily tasks in DoMe for free", image: MyImages.iconOnboarding1),
      sliderWidget(context, title: "Create daily routine", description: "In Uptodo  you can create your personalized routine to stay productive", image: MyImages.iconOnboarding2),
      sliderWidget(context, title: "Orgonaize your tasks", description: "You can organize your daily tasks by adding your tasks into separate categories", image: MyImages.iconOnboarding3),
    ];
    return Scaffold(
      backgroundColor: MyColors.c000000,
      body: SafeArea(
        child: Stack(
          children: <Widget> [
            PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: _controller,
              itemCount: pages.length,
              onPageChanged: _onChanged,
              itemBuilder: (context, int index) {
                return Container(
                  child: pages[index]);
              },
            ),
            Positioned(
              left: 30,
              top: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context, MaterialPageRoute(builder: (context) => const StartScreenPage()));
                    }, 
                    child: Text("Skip", style: MyStyles.latoregular400.copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: MyColors.cFFFFFF.withOpacity(0.44)))
                  ),
                  const SizedBox(),
                ],
              ),
            ),
            Positioned(
              top: 140,
              bottom: 100,
              right: 100,
              left: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(pages.length, (int index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 4,
                    width: 26,
                    margin: const EdgeInsets.symmetric(horizontal: 5,),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(56),
                      color: (index == _currentPage)
                      ? MyColors.cFFFFFF
                      : MyColors.cAFAFAF
                    ),
                  );
                }),
              ), 
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24, top: 700,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            _controller.previousPage(
                              duration: const Duration(milliseconds: 800),
                              curve: Curves.easeInOutQuint);
                          }, 
                          child: Text("Back", style: MyStyles.latoregular400.copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: MyColors.cFFFFFF.withOpacity(0.44)))
                        ),
                        InkWell(
                          onTap: () {
                            if(_currentPage == (pages.length - 1)){
                              Navigator.push(
                                context, MaterialPageRoute(builder: (context) => const StartScreenPage()));
                            }
                            else {
                              _controller.nextPage(
                              duration: const Duration(milliseconds: 800),
                              curve: Curves.easeInOutQuint);
                            }
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            height: 48,
                            alignment: Alignment.center,
                            width: (_currentPage == (pages.length - 1)) ? 150 : 90,
                            decoration: BoxDecoration(
                              color:  MyColors.c8875FF,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: (_currentPage == (pages.length - 1))
                            ? const Text("Get Stardred",
                            style: TextStyle(color: MyColors.cFFFFFF, fontSize: 20),)
                            : const Text("Next",
                            style: TextStyle(color: MyColors.cFFFFFF, fontSize: 20),)
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}