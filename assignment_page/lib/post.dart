import 'package:assignment_page/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PageScreen extends StatelessWidget {
  const PageScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          offset: Offset(-1, 1),
                          spreadRadius: 0,
                          blurRadius: 8,
                        )
                      ]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(32),
                        child: Assets.images.buildings.image(),
                      ),
                    ),
                    Positioned(
                      top: 10, // Distance from the top
                      left: 10, // Distance from the left
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white, // White circular background
                          shape: BoxShape.circle, // Circular shape
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              offset: Offset(0, 2),
                              blurRadius: 4,
                              spreadRadius: 0,
                            ),
                          ], // Optional: subtle shadow for depth
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            CupertinoIcons.chevron_left,
                            color: Colors.grey, // Icon color
                            size: 24, // Adjust size as needed
                          ),
                          padding: EdgeInsets.all(
                              8), // Adjust padding inside the button
                          constraints:
                              BoxConstraints(), // Remove default constraints
                        ),
                      ),
                    ),
                    // Bottom-right icon (heart) with white circular background
                    Positioned(
                      bottom: 0, // Distance from the bottom
                      right: 10, // Distance from the right
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white, // White circular background
                          shape: BoxShape.circle, // Circular shape
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              offset: Offset(0, 2),
                              blurRadius: 4,
                              spreadRadius: 0,
                            ),
                          ], // Optional: subtle shadow for depth
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Assets.icons.heart.image(),
                          padding: EdgeInsets.all(
                              8), // Adjust padding inside the button
                          constraints:
                              BoxConstraints(), // Remove default constraints
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Coeurdes Alpes",
                        style: themeData.textTheme.labelMedium),
                    TextButton(
                        onPressed: () {},
                        child: Text("Show map",
                            style: themeData.textTheme.titleMedium)),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          CupertinoIcons.star,
                        ),
                        iconSize: 15,
                        padding: EdgeInsets.zero, // Remove default padding
                        constraints: BoxConstraints(), //
                      ),
                      SizedBox(width: 4),
                      Text("4.5 (355 Reviews)",
                          style: themeData.textTheme.labelSmall),
                    ],
                  ),
                ),
                Text(
                    "Aspen is as close as one can get to a storybook alpine town in America. The choose-your-own-adventure possibilities—skiing, hiking, dining shopping and ....",
                    style: themeData.textTheme.bodyMedium),
                SizedBox(
                  height: 5,
                ),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min, // Keeps the Row compact
                    children: [
                      Text(
                        "Read More",
                        style: themeData.textTheme.titleMedium,
                      ),
                      SizedBox(width: 8), // Adds spacing between text and icon
                      Icon(
                        CupertinoIcons.chevron_down,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Text("Facilities", style: themeData.textTheme.labelMedium),
                SizedBox(
                  height: 24,
                ),
                Opacity(
                  opacity: 0.6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FacilityWidget(facilityName: "wifi"),
                      FacilityWidget(facilityName: "dinner"),
                      FacilityWidget(facilityName: "tub"),
                      FacilityWidget(facilityName: "pool"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 29,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Price", style: themeData.textTheme.titleSmall),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "\$199",
                          style: TextStyle(
                              color: Color(0xff2DD7A4),
                              fontSize: 24,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF176FF2), // Background color
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12), // Border radius of 12
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(42, 18, 42, 18),
                        child: Row(
                          mainAxisSize:
                              MainAxisSize.min, // Keeps the Row compact
                          children: [
                            Text(
                              "Book Now",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                                width: 8), // Adds spacing between text and icon
                            Icon(
                              Icons.arrow_forward, // Right arrow icon
                              color: Colors.white, // Matches the text color
                              size: 20, // Adjust size as needed
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FacilityWidget extends StatelessWidget {
  final String facilityName;
  const FacilityWidget({super.key, required this.facilityName});

  @override
  Widget build(BuildContext context) {
    Widget selectedIcon;
    Widget selectedIconName;

    // Assign correct widget icons
    switch (facilityName) {
      case 'wifi':
        selectedIcon = Assets.icons.wifi.image(width: 32, height: 32);
        selectedIconName = Text("Wifi");
        break;
      case 'dinner':
        selectedIcon = Assets.icons.food.svg(width: 32, height: 30);
        selectedIconName = Text("Dinner");
        break;
      case 'tub':
        selectedIcon = Assets.icons.bath.svg(width: 30, height: 30);
        selectedIconName = Text("Tub");
        break;
      case 'pool':
        selectedIcon = Assets.icons.pool.svg(width: 30, height: 30);
        selectedIconName = Text("Pool");
        break;
      default:
        selectedIcon =
            Icon(CupertinoIcons.question, size: 30, color: Colors.blue);
        selectedIconName = Text("Unknown");
    }

    return Container(
      width: 78,
      height: 75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.withOpacity(0.15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          selectedIcon, // No longer an error!
          selectedIconName,
        ],
      ),
    );
  }
}
