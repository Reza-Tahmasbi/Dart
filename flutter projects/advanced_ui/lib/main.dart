import 'package:advanced_ui/carousel/carousel_slider.dart';
import 'package:advanced_ui/data.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' as custom;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark),);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const defaultFontFamily = "Avenir";
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final primaryTextColor = Color(0xff0D253C);
    final secondaryTextColor = Color(0xff2D4379);
    final primaryColor = Color(0xff376AED);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
            textStyle: WidgetStateProperty.all(const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: defaultFontFamily)),
          )),
          textTheme: TextTheme(
              headlineLarge: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: primaryTextColor,
                  fontFamily: defaultFontFamily),
              headlineMedium: TextStyle(
                  fontSize: 18,
                  color: secondaryTextColor,
                  fontWeight: FontWeight.w200,
                  fontFamily: defaultFontFamily),
              headlineSmall: TextStyle(
                  fontSize: 13,
                  color: secondaryTextColor,
                  fontFamily: defaultFontFamily),
              labelMedium: TextStyle(
                  fontSize: 18,
                  color: primaryTextColor,
                  fontWeight: FontWeight.w700,
                  fontFamily: defaultFontFamily),
              labelLarge: TextStyle(
                  fontSize: 20,
                  color: primaryTextColor,
                  fontWeight: FontWeight.w700,
                  fontFamily: defaultFontFamily),
              displaySmall: TextStyle(
                fontFamily: defaultFontFamily,
                fontWeight: FontWeight.w700,
                color: Color(0xff7B8BB2),
                fontSize: 10,
              ),
              labelSmall: TextStyle(
                  fontSize: 14,
                  color: primaryColor,
                  fontWeight: FontWeight.w400,
                  fontFamily: defaultFontFamily))),
      home: Stack(
        children: [
          Positioned.fill(child: const Homescreen()),
          Positioned(bottom: 0, right: 0, left: 0, child: _BottomNavigation()),
        ],
      ),
    );
  }
}

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final stories = AppDatabase.stories;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hi, Jonathan!',
                      style: themeData.textTheme.headlineMedium,
                    ),
                    Image.asset(
                      "assets/img/icons/notification.png",
                      width: 32,
                      height: 32,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 0, 16),
                child: Text("Explore today’s",
                    style: themeData.textTheme.headlineLarge),
              ),
              _StoryList(stories: stories, themeData: themeData),
              const SizedBox(
                height: 16,
              ),
              _CategorySlider(),
              const _PostList(),
              SizedBox(
                height: 32,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _CategorySlider extends StatelessWidget {
  final categories = AppDatabase.categories;
  _CategorySlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: categories.length,
        itemBuilder: (context, index, realIndex) {
          return _Category(
            left: realIndex == 0 ? 32 : 8,
            right: realIndex == categories.length - 1 ? 32 : 8,
            category: categories[realIndex],
          );
        },
        options: CarouselOptions(
          autoPlay: true,
          scrollPhysics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          viewportFraction: 0.8,
          aspectRatio: 1.2,
          initialPage: 0,
          disableCenter: true,
          enableInfiniteScroll: false,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
        ));
  }
}

class _Category extends StatelessWidget {
  final Category category;
  final double left;
  final double right;
  const _Category(
      {super.key,
      required this.category,
      required this.left,
      required this.right});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(left, 0, right, 0),
      child: Stack(
        children: [
          Positioned.fill(
              top: 100,
              right: 65,
              left: 65,
              bottom: 16,
              child: Container(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(blurRadius: 20, color: Color(0xaa0D253C))
                ]),
              )),
          Positioned.fill(
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(32),
              ),
              foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  gradient: const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [Color(0xff0D253C), Colors.transparent],
                  )),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: Image.asset(
                    "assets/img/posts/large/${category.imageFileName}",
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Positioned(
            bottom: 56,
            left: 32,
            child: Text(category.title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

class _StoryList extends StatelessWidget {
  const _StoryList({
    super.key,
    required this.stories,
    required this.themeData,
  });

  final List<StoryData> stories;
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: stories.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.fromLTRB(32, 2, 32, 0),
          itemBuilder: (context, index) {
            final story = stories[index];
            return _Story(story: story, themeData: themeData);
          }),
    );
  }
}

class _Story extends StatelessWidget {
  const _Story({
    super.key,
    required this.story,
    required this.themeData,
  });

  final StoryData story;
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            story.isViewed ? _profileImageViewed() : _profileImageNormal(),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset("assets/img/icons/${story.iconFileName}",
                  width: 24, height: 24),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Text(story.name, style: themeData.textTheme.headlineSmall),
      ],
    );
  }

  Container _profileImageNormal() {
    return Container(
      margin: const EdgeInsets.fromLTRB(4, 0, 4, 0),
      width: 68,
      height: 68,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(begin: Alignment.topLeft, colors: [
            Color(0xff376AED),
            Color(0xff49B0E2),
            Color(0xff9CECFB),
          ])),
      child: Container(
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
        ),
        padding: EdgeInsets.all(5),
        child: _profileImage(),
      ),
    );
  }

  Widget _profileImageViewed() {
    return SizedBox(
      width: 68,
      height: 68,
      child: DottedBorder(
        borderType: BorderType.RRect,
        strokeWidth: 2,
        radius: const Radius.circular(24),
        color: Color(0xff7B8BB2),
        dashPattern: const [8, 3],
        padding: const EdgeInsets.all(7),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
          ),
          child: _profileImage(),
        ),
      ),
    );
  }

  Widget _profileImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(17),
      child: Image.asset(
        "assets/img/stories/${story.imageFileName}",
      ),
    );
  }
}

class _PostList extends StatelessWidget {
  const _PostList({super.key});
  @override
  Widget build(BuildContext context) {
    final posts = AppDatabase.posts;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 32, right: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Latest News",
                  style: Theme.of(context).textTheme.labelLarge),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "More",
                    style: TextStyle(color: Color(0xff376AED)),
                  ))
            ],
          ),
        ),
        SizedBox(
          height: 300,
          child: ListView.builder(
              itemCount: posts.length,
              itemExtent: 141,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                final post = posts[index];
                return _Post(post: post);
              }),
        ),
      ],
    );
  }
}

class _Post extends StatelessWidget {
  const _Post({
    super.key,
    required this.post,
  });

  final PostData post;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(32, 8, 32, 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(blurRadius: 10, color: Color(0x1a5282FF))
          ]),
      child: Row(children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset("assets/img/posts/small/${post.imageFileName}")),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(post.caption,
                    style: const TextStyle(
                        fontFamily: MyApp.defaultFontFamily,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff376AED))),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  post.title,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(CupertinoIcons.hand_thumbsup,
                        size: 16,
                        color: Theme.of(context).textTheme.bodySmall!.color),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      post.likes,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Icon(CupertinoIcons.clock,
                        size: 16,
                        color: Theme.of(context).textTheme.bodySmall!.color),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      post.time,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        post.isBookmarked
                            ? CupertinoIcons.bookmark_fill
                            : CupertinoIcons.bookmark,
                        size: 16,
                        color: Theme.of(context).textTheme.bodySmall!.color,
                      ),
                    ))
                  ],
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
                height: 65,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 20,
                        color: Color(0x9B8487).withOpacity(0.3)),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly
                  ,
                  children: const [
                    _BottomNavigationItem(
                      iconFileName: "Home.png",
                      activeIconsFileName: "Home.png",
                      title: "Home",
                    ),
                    _BottomNavigationItem(
                      iconFileName: "Articles.png",
                      activeIconsFileName: "Articles.png",
                      title: "Articles",
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    _BottomNavigationItem(
                      iconFileName: "Search.png",
                      activeIconsFileName: "Search.png",
                      title: "Search",
                    ),
                    _BottomNavigationItem(
                      iconFileName: "Menu.png",
                      activeIconsFileName: "Menu.png",
                      title: "Menu",
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
                    border: Border.all(color: Colors.white, width: 4)
                  ),
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

  const _BottomNavigationItem(
      {super.key,
      required this.iconFileName,
      required this.activeIconsFileName,
      required this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/img/icons/$iconFileName"),
        const SizedBox(
          height: 4,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ],
    );
  }
}
