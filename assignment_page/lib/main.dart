import 'package:assignment_page/gen/assets.gen.dart';
import 'package:assignment_page/gen/fonts.gen.dart';
import 'package:assignment_page/post.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final secondryColor = Color(0xff176FF2);
    final primaryColor = Color(0xff232323);
    final greyColor = Color(0xff606060);
    final textColor = Color(0xff3A544F);
    return MaterialApp(
      title: 'Page sample',
      theme: ThemeData(
        textTheme: TextTheme(
            titleMedium: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
              color: secondryColor,
            ),
            labelMedium: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: FontFamily.montserrat,
              fontSize: 18,
              color: primaryColor,
            ),
            labelSmall: TextStyle(
              fontWeight: FontWeight.w200,
              fontFamily: FontFamily.montserrat,
              fontSize: 10,
              color: greyColor,
            ),
            bodyMedium: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 13,
              color: textColor,
            ),
            titleSmall: TextStyle(
              fontSize: 13,
              color: primaryColor,
              fontWeight: FontWeight.w600,
              fontFamily: FontFamily.montserrat,
            )),
        useMaterial3: true,
      ),
      home: const PageScreen(),
    );
  }
}
