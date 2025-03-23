import 'package:advanced_ui/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return SafeArea(
        child: Scaffold(
      floatingActionButton: Container(
          width: 111,
          height: 48,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: themeData.colorScheme.primary,
              boxShadow: [
                BoxShadow(
                    blurRadius: 20,
                    color: themeData.colorScheme.primary.withOpacity(0.5))
              ]),
          child: InkWell(
            onTap: () {
              showSnackBar(context, "Like Button is clicked");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.img.icons.thumbs.svg(width: 24, height: 24),
                const SizedBox(width: 8),
                Text(
                  "2.1k",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: themeData.colorScheme.onPrimary),
                )
              ],
            ),
          )),
      backgroundColor: themeData.colorScheme.surface,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                // pinned: true,
                // floating: true,
                title: const Text("Articles"),
                actions: [
                  IconButton(
                    icon: Icon(Icons.more_horiz_rounded),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 16,
                  )
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate.fixed(
                  [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                      child: Text(
                        "Four Things Every Woman Needs to know",
                        style: themeData.textTheme.labelLarge,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 0, 16, 32),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Assets.img.stories.story9.image(
                              width: 48,
                              height: 48,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Richard Gervain',
                                    style: themeData.textTheme.titleMedium!
                                        .copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12)),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  '2m ago',
                                  style: themeData.textTheme.titleSmall!
                                      .copyWith(
                                          fontSize: 10, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                showSnackBar(
                                    context, "Share button is clicked");
                              },
                              icon: Icon(CupertinoIcons.share,
                                  color: themeData.colorScheme.primary)),
                          IconButton(
                            onPressed: () {
                              showSnackBar(
                                  context, "Bookmark button is clicked");
                            },
                            icon: Icon(CupertinoIcons.bookmark,
                                color: themeData.colorScheme.primary),
                          )
                        ],
                      ),
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32)),
                      child: Assets.img.background.singlePost.image(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 32, 32, 16),
                      child: Text(
                        "A man's sexuality is never your mind responsibility",
                        style: themeData.textTheme.labelMedium!
                            .copyWith(fontSize: 16, color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 8, 32, 8),
                      child: Text(
                          style: themeData.textTheme.bodySmall,
                          "Velis quam porta sedis, nunc etor magnis volu pretis. Duis cursus lumor sit amet, tacor felis adipus ris. Sed blandor quis es magna, inceptos dolorum et varius quam. Nulla facilis es tu lorem, portis eget sagittus nunc. Arcu vestis bulum coris, tempus erat in pharetra sed. Mauris elemen tu ris, justo quid es tu placerat es lorem. Proin dictum es tu felum, ornare quam sed cursus magna. Fusce volut pat es lorem, interdum es tu nunc sed quam. Cras pulvin aris es tu, semper quam es tu dolor es lorem. Vivamus es tu quam sedis, lacinia quam es tu nunc es tu. Quisque es tu magna lorem, aliquet es tu sed es tu quam"),
                    )
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 116,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    themeData.colorScheme.surface,
                    themeData.colorScheme.surface.withOpacity(0.5)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    behavior: SnackBarBehavior.fixed,
  ));
}
