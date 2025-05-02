import 'package:flutter/material.dart';
import 'package:nike_ecommerce_app/data/repo/product_repository.dart';
import 'package:nike_ecommerce_app/data/source/banner_data_source.dart';
import 'package:nike_ecommerce_app/theme.dart';
import 'package:nike_ecommerce_app/ui/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    productRepository.getAll(0).then((value) {
      debugPrint(value.toString());
    }).catchError((e) {
      debugPrint(e.toString());
    });

    bannerRepository.getAll().then((value) {
      debugPrint(value.toString());
    }).catchError((e) {
      debugPrint(e.toString());
    });

    const defaultTextStyle = TextStyle(
        fontFamily: "Vaziri", color: LightThemeColors.primaryTextColor);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          textTheme: TextTheme(
            bodyLarge: defaultTextStyle,
            labelMedium: defaultTextStyle.copyWith(
                color: LightThemeColors.secondaryTextColor),
            headlineSmall:
                defaultTextStyle.copyWith(fontWeight: FontWeight.bold),
          ),
          colorScheme: ColorScheme.light(
            primary: LightThemeColors.primaryColor,
            secondary: LightThemeColors.secondaryColor,
            onSecondary: Colors.white,
          )),
      home: Directionality(
          textDirection: TextDirection.rtl,
          child: const HomeScreen()),
    );
  }
}
