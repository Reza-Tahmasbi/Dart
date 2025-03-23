import 'package:advanced_ui/article.dart';
import 'package:advanced_ui/auth.dart';
import 'package:advanced_ui/gen/fonts.gen.dart';
import 'package:advanced_ui/home.dart';
import 'package:advanced_ui/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'profile.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final primaryTextColor = Color(0xff0D253C);
    final secondaryTextColor = Color(0xff2D4379);
    final primaryColor = Color(0xff376AED);
    return SafeArea(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.light(
              primary: primaryColor,
              onPrimary: Colors.white,
              onSurface: primaryTextColor,
              background: Color(0xffFBFCFF),
              surface: Colors.white,
              onBackground: primaryTextColor,
            ),
            snackBarTheme: SnackBarThemeData(
                backgroundColor: primaryColor,
                contentTextStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: FontFamily.avenir)),
            appBarTheme: AppBarTheme(
                titleSpacing: 32,
                backgroundColor: Colors.white,
                foregroundColor: primaryTextColor),
            textButtonTheme: TextButtonThemeData(
                style: ButtonStyle(
              textStyle: WidgetStateProperty.all(const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: FontFamily.avenir)),
            )),
            textTheme: TextTheme(
                headlineLarge: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: primaryTextColor,
                    fontFamily: FontFamily.avenir),
                headlineMedium: TextStyle(
                    fontSize: 18,
                    color: secondaryTextColor,
                    fontWeight: FontWeight.w200,
                    fontFamily: FontFamily.avenir),
                headlineSmall: TextStyle(
                    fontSize: 13,
                    color: secondaryTextColor,
                    fontFamily: FontFamily.avenir),
                labelMedium: TextStyle(
                    fontSize: 18,
                    color: primaryTextColor,
                    fontWeight: FontWeight.w700,
                    fontFamily: FontFamily.avenir),
                labelLarge: TextStyle(
                    fontSize: 20,
                    color: primaryTextColor,
                    fontWeight: FontWeight.w700,
                    fontFamily: FontFamily.avenir),
                displaySmall: TextStyle(
                  fontFamily: FontFamily.avenir,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff7B8BB2),
                  fontSize: 10,
                ),
                labelSmall: TextStyle(
                    fontSize: 14,
                    color: primaryColor,
                    fontWeight: FontWeight.w400,
                    fontFamily: FontFamily.avenir))),

        // home: Stack(
        //   children: [
        //     Positioned.fill(child: const Splash()),
        //     Positioned(bottom: 0, right: 0, left: 0, child: _BottomNavigation()),
        //   ],
        // ),
        // home: const SplashScreen(),
        // home: const AuthScreen(),
        // home: const ArticleScreen(),
        home: const MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

const int homeIndex = 0;
const int articleIndex = 1;
const int searchIndex = 2;
const int menuIndex = 3;
const double bottomNavigationHeight = 85;

class _MainScreenState extends State<MainScreen> {
  int selectedScreenIndex = homeIndex;
  final List<int> _history = [];

  GlobalKey<NavigatorState> _homeKey = GlobalKey();
  GlobalKey<NavigatorState> _articleKey = GlobalKey();
  GlobalKey<NavigatorState> _searchKey = GlobalKey();
  GlobalKey<NavigatorState> _menuKey = GlobalKey();
  late final map = {
    homeIndex: _homeKey,
    articleIndex: _articleKey,
    searchIndex: _searchKey,
    menuIndex: _menuKey,
  };
  Future<bool> _onWillPop() async {
    final NavigatorState currentSelectedTabNavigatorState =
        map[selectedScreenIndex]!.currentState!;
    if (currentSelectedTabNavigatorState.canPop()) {
      currentSelectedTabNavigatorState.pop();
      return false;
    } else if (_history.isNotEmpty) {
      setState(() {
        selectedScreenIndex = _history.removeLast();
      });
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              bottom: bottomNavigationHeight,
              child: IndexedStack(index: selectedScreenIndex, children: [
                _navigator(_homeKey, homeIndex, const Homescreen()),
                _navigator(_articleKey, articleIndex, const ArticleScreen()),
                _navigator(_searchKey, searchIndex, const SearchScreen(tabName: "Search",)),
                _navigator(_menuKey, menuIndex, const ProfileScreen()),
              ]),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _BottomNavigation(
                selectedIndex: selectedScreenIndex,
                onTap: (int index) {
                  setState(() {
                    _history.remove(selectedScreenIndex);
                    _history.add(selectedScreenIndex);
                    selectedScreenIndex = index;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navigator(GlobalKey key, int index, Widget child) {
    return key.currentState == null && selectedScreenIndex!= index?Container():Navigator(
      key: key,
      onGenerateRoute: (settings) => MaterialPageRoute(
          builder: (context) => Offstage(
                offstage: selectedScreenIndex != index,
                child: child,
              )),
    );
  }
}


class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key, this.screenNumber = 1, required this.tabName});
  final String tabName;
  final int screenNumber;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Tab $tabName, Search Screen #$screenNumber",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SearchScreen(tabName: tabName,screenNumber: screenNumber + 1,)));
            },
            child: Text("Click me"))
      ],
    ));
  }
}

class _BottomNavigation extends StatelessWidget {
  final Function(int index) onTap;
  final int selectedIndex;
  const _BottomNavigation(
      {super.key, required this.onTap, required this.selectedIndex});
  @override
  Widget build(
    BuildContext context,
  ) {
    return SizedBox(
      height: 85,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
                height: bottomNavigationHeight,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 20,
                        color: Color(0x9B8487).withOpacity(0.3)),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _BottomNavigationItem(
                      iconFileName: "Home.png",
                      activeIconsFileName: "Home.png",
                      title: "Home",
                      onTap: () => onTap(homeIndex),
                      isActive: selectedIndex == homeIndex,
                    ),
                    _BottomNavigationItem(
                      iconFileName: "Articles.png",
                      activeIconsFileName: "Articles.png",
                      title: "Articles",
                      onTap: () => onTap(articleIndex),
                      isActive: selectedIndex == articleIndex,
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    _BottomNavigationItem(
                      iconFileName: "Search.png",
                      activeIconsFileName: "Search.png",
                      title: "Search",
                      onTap: () => onTap(searchIndex),
                      isActive: selectedIndex == searchIndex,
                    ),
                    _BottomNavigationItem(
                      iconFileName: "Menu.png",
                      activeIconsFileName: "Menu.png",
                      title: "Menu",
                      onTap: () => onTap(menuIndex),
                      isActive: selectedIndex == menuIndex,
                    )
                  ],
                )),
          ),
          Center(
            child: Container(
              width: 65,
              height: 85,
              alignment: Alignment.topCenter,
              child: Container(
                  height: 65,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32.5),
                      color: Color(0xff376AED),
                      border: Border.all(color: Colors.white, width: 4)),
                  child: Image.asset("assets/img/icons/plus.png")),
            ),
          )
        ],
      ),
    );
  }
}

class _BottomNavigationItem extends StatelessWidget {
  final String iconFileName;
  final String activeIconsFileName;
  final String title;
  final bool isActive;
  final Function() onTap;

  const _BottomNavigationItem(
      {super.key,
      required this.iconFileName,
      required this.activeIconsFileName,
      required this.title,
      required this.onTap,
      required this.isActive});
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/img/icons/$iconFileName"),
            const SizedBox(
              height: 4,
            ),
            Text(
              title,
              style: themeData.textTheme.displaySmall!.apply(
                  color: isActive
                      ? themeData.colorScheme.primary
                      : themeData.textTheme.titleLarge!.color),
            ),
          ],
        ),
      ),
    );
  }
}
