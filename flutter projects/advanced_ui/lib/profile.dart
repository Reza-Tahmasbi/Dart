import 'package:advanced_ui/data.dart';
import 'package:advanced_ui/gen/assets.gen.dart';
import 'package:advanced_ui/home.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key});
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final posts = AppDatabase.posts;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              elevation: 0,
              backgroundColor: themeData.colorScheme.background.withOpacity(0),
              title: const Text("Profile"),
              actions: [
                IconButton(
                  icon: Icon(Icons.more_horiz_rounded),
                  onPressed: () {},
                ),
                const SizedBox(
                  width: 16,
                )
              ],
            ),
            Stack(
              children: [
                Container(
                    margin: EdgeInsets.fromLTRB(32, 0, 32, 64),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: themeData.colorScheme.surface,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20,
                            color: themeData.colorScheme.onBackground
                                .withOpacity(0.2),
                          )
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                          child: Row(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Assets.img.stories.story8
                                      .image(width: 84, height: 84)),
                              const SizedBox(
                                width: 16,
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "@joviedan",
                                      style: themeData.textTheme.bodySmall,
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      "Jovi Daniel",
                                      style: themeData.textTheme.bodyMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "UX Designer",
                                      style: themeData.textTheme.bodyMedium!
                                          .apply(
                                              color: themeData
                                                  .colorScheme.primary),
                                    ),
                                  ]),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                          child: Text(
                            'About me',
                            style: themeData.textTheme.labelMedium!
                                .copyWith(fontSize: 14),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(32, 4, 32, 32),
                          child: Text(
                              style: themeData.textTheme.bodyMedium!.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w100),
                              'Madisone Blackstone is a director of user experience design, with experience managing global teams'),
                        ),
                        const SizedBox(
                          height: 24,
                        )
                      ],
                    )),
                Positioned(
                    bottom: 32,
                    left: 96,
                    right: 96,
                    child: Container(
                      height: 32,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            blurRadius: 30,
                            color: themeData.colorScheme.onBackground
                                .withOpacity(0.8)),
                      ]),
                    )),
                Positioned(
                    bottom: 32,
                    left: 64,
                    right: 64,
                    child: Container(
                      height: 68,
                      decoration: BoxDecoration(
                          color: themeData.colorScheme.primary,
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xff2151CD),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("52",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              themeData.colorScheme.onPrimary)),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "Post",
                                    style: themeData.textTheme.labelSmall!
                                        .copyWith(
                                      fontWeight: FontWeight.w200,
                                      color: themeData.colorScheme.onPrimary,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("250",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            themeData.colorScheme.onPrimary)),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "Following",
                                  style:
                                      themeData.textTheme.labelSmall!.copyWith(
                                    fontWeight: FontWeight.w200,
                                    color: themeData.colorScheme.onPrimary,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("4.5K",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            themeData.colorScheme.onPrimary)),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "Followers",
                                  style:
                                      themeData.textTheme.labelSmall!.copyWith(
                                    fontWeight: FontWeight.w200,
                                    color: themeData.colorScheme.onPrimary,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: themeData.colorScheme.surface,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      color:
                          themeData.colorScheme.onBackground.withOpacity(0.2),
                    )
                  ]),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            "My Posts",
                            style: themeData.textTheme.bodyMedium!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Assets.img.icons.grid.svg()),
                        IconButton(
                            onPressed: () {},
                            icon: Assets.img.icons.table.svg()),
                      ],
                    ),
                  ),
                  for (var i = 0; i < posts.length; i++) Post(post: posts[i]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
