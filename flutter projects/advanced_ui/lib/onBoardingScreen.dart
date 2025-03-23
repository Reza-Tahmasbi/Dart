import 'package:advanced_ui/auth.dart';
import 'package:advanced_ui/data.dart';
import 'package:advanced_ui/gen/assets.gen.dart';
import 'package:advanced_ui/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboardingscreen extends StatefulWidget {
  const Onboardingscreen({super.key});

  @override
  State<Onboardingscreen> createState() => _OnboardingscreenState();
}

class _OnboardingscreenState extends State<Onboardingscreen> {
  final PageController _pageController = PageController();
  final items = AppDatabase.onboardingItems;
  int page = 0;
  @override
  void initState() {
    _pageController.addListener(() {
      if (_pageController.page!.round() != page) {
        setState(() {
          page = _pageController.page!.round();
          debugPrint("Onboarding: Selected Page -> $page");
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final items = AppDatabase.onboardingItems;
    return Scaffold(
        backgroundColor: themeData.colorScheme.background,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 32, bottom: 8),
                  child:
                      Assets.img.background.onboarding.image(fit: BoxFit.cover),
                ),
              ),
              Container(
                  height: 280,
                  decoration: BoxDecoration(
                    color: themeData.colorScheme.surface,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black
                            .withOpacity(0.1), // Adjust opacity as needed
                        blurRadius: 20,
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                          child: PageView.builder(
                        itemCount: items.length,
                        controller: _pageController,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(32),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(items[index].title,
                                      style: themeData.textTheme.titleMedium!
                                          .apply(fontSizeDelta: 3)),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Text(items[index].description,
                                      style: themeData.textTheme.titleMedium!
                                          .apply(fontSizeDelta: -2.5))
                                ]),
                          );
                        },
                      )),
                      Container(
                        height: 60,
                        padding: const EdgeInsets.only(
                            left: 32, right: 32, bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SmoothPageIndicator(
                              controller: _pageController,
                              count: items.length,
                              effect: ExpandingDotsEffect(
                                activeDotColor: themeData.colorScheme.primary,
                                dotWidth: 8,
                                dotHeight: 8,
                                dotColor: themeData.colorScheme.primary
                                    .withOpacity(0.1),
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  if (page == items.length - 1){
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const AuthScreen()));
                                  }else{
                                    _pageController.animateToPage(page + 1, duration: Duration(milliseconds: 500), curve: Curves.decelerate);
                                  }
                                },
                                style: ButtonStyle(
                                    minimumSize: WidgetStateProperty.all(
                                        const Size(64, 60)),
                                    shape: WidgetStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12)))),
                                child: Icon(page == items.length - 1
                                    ? CupertinoIcons.check_mark
                                    : CupertinoIcons.arrow_right)),
                          ],
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ));
  }
}
