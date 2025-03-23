import 'package:advanced_ui/article.dart';
import 'package:advanced_ui/carousel/carousel_slider.dart';
import 'package:advanced_ui/data.dart';
import 'package:advanced_ui/gen/assets.gen.dart';
import 'package:advanced_ui/gen/fonts.gen.dart';
import 'package:advanced_ui/main.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
                  Assets.img.icons.notification.image(width: 32, height: 32),
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
                return Post(post: post);
              }),
        ),
      ],
    );
  }
  }

  class Post extends StatelessWidget {
  const Post({
    super.key,
    required this.post,
  });

  final PostData post;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchScreen(tabName: "Home",))),
      child: Container(
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
              child: Image.asset("assets/img/posts/small/${post.imageFileName}", width: 120,)),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(post.caption,
                      style: const TextStyle(
                          fontFamily: FontFamily.avenir,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff376AED))),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    post.title,
                    style: Theme.of(context).textTheme.titleSmall,
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
      ),
    );
  }
}
