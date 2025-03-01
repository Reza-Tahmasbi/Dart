import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.dark;
  Locale _locale = Locale("en");
  @override
  Widget build(BuildContext context) {
    Color surfaceColor = Color(0x0dffffff);
    Color primaryColor = Colors.pink.shade400;
    return MaterialApp(
      title: "Curriculum Vitae",
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      theme: _themeMode == ThemeMode.dark
          ? MyAppThemeConfig.dark().getTheme(_locale.languageCode)
          : MyAppThemeConfig.light().getTheme(_locale.languageCode),
      home: MyHomePage(
        toggleThemeMode: () {
          setState(() {
            if (_themeMode == ThemeMode.dark)
              _themeMode = ThemeMode.light;
            else
              _themeMode = ThemeMode.dark;
          });
        },
        selectedLanguageChanged: (_Language newSelectedLanguageByUser) {
          setState(() {
            _locale = newSelectedLanguageByUser == _Language.en
                ? Locale('en')
                : Locale('fa');
          });
        },
      ),
    );
  }
}

class MyAppThemeConfig {
  static const String faPrimaryFontFamily = "Bnazanin";
  final primaryColor = Colors.pink.shade400;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color surfaceColor;
  final Color backgroundColor;
  final Color appBarColor;

  final Brightness brightness;

  MyAppThemeConfig.dark()
      : primaryTextColor = Colors.white,
        secondaryTextColor = Colors.white70,
        surfaceColor = Color(0x0dffffff),
        backgroundColor = Color.fromARGB(255, 30, 30, 30),
        appBarColor = Colors.black,
        brightness = Brightness.dark;

  MyAppThemeConfig.light()
      : primaryTextColor = Colors.grey.shade900,
        secondaryTextColor = Colors.grey.shade900.withOpacity(0.8),
        surfaceColor = Color(0x0d000000),
        backgroundColor = Colors.white,
        appBarColor = Color.fromARGB(255, 235, 235, 235),
        brightness = Brightness.light;

  MyAppThemeConfig({
    required this.brightness,
    required this.primaryTextColor,
    required this.secondaryTextColor,
    required this.surfaceColor,
    required this.backgroundColor,
    required this.appBarColor,
  });

  ThemeData getTheme(String langaugeCode) {
    return ThemeData(
      primaryColor: primaryColor,
      dividerColor: surfaceColor,
      brightness: Brightness.dark,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(primaryColor),
        ),
      ),
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: appBarColor,
          foregroundColor: primaryTextColor),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: surfaceColor,
      ),
      textTheme: langaugeCode == "en" ? enPrimaryTextTheme : faPrimaryTextTheme,
    );
  }

  TextTheme get enPrimaryTextTheme => GoogleFonts.latoTextTheme(TextTheme(
      bodyMedium: TextStyle(fontSize: 10, color: primaryTextColor),
      bodySmall: TextStyle(fontSize: 12, color: primaryTextColor),
      headlineMedium: TextStyle(
          fontSize: 24, fontWeight: FontWeight.w900, color: primaryTextColor),
      titleLarge: TextStyle(
          fontSize: 15, fontWeight: FontWeight.w900, color: primaryTextColor),
      titleMedium: TextStyle(
          fontSize: 15, fontWeight: FontWeight.w900, color: primaryTextColor),
      labelSmall: TextStyle(color: primaryTextColor)));

  TextTheme get faPrimaryTextTheme => TextTheme(
        labelSmall: TextStyle(color: primaryTextColor),
        bodyMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: primaryTextColor,
            fontFamily: faPrimaryFontFamily),
        bodySmall: TextStyle(
            fontSize: 13,
            height: 2,
            fontWeight: FontWeight.bold,
            color: primaryTextColor,
            fontFamily: faPrimaryFontFamily),
        headlineMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
            color: primaryTextColor,
            fontFamily: faPrimaryFontFamily),
        titleLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w900,
            color: primaryTextColor,
            fontFamily: faPrimaryFontFamily),
        titleMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: primaryTextColor,
            fontFamily: faPrimaryFontFamily),
      );
}

class MyHomePage extends StatefulWidget {
  final Function() toggleThemeMode;
  final Function(_Language _Language) selectedLanguageChanged;
  const MyHomePage(
      {Key? key,
      required this.toggleThemeMode,
      required this.selectedLanguageChanged})
      : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum _SkillType {
  photoshop,
  xd,
  illustrator,
  afterEffect,
  lightRoom,
}

class _MyHomePageState extends State<MyHomePage> {
  _SkillType _skill = _SkillType.photoshop;
  _Language _language = _Language.en;

  void _updateSelectedSkill(_SkillType skillType) {
    setState(() {
      _skill = skillType;
    });
  }

  void _updateSelectedLanguage(_Language language) {
    widget.selectedLanguageChanged(language);
    setState(() {
      _language = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Scaffold(
        appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.profileTitle),
            actions: [
              Icon(CupertinoIcons.chat_bubble),
              SizedBox(
                width: 8,
              ),
              InkWell(
                onTap: widget.toggleThemeMode,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 16, 0),
                  child: Icon(CupertinoIcons.ellipsis_vertical),
                ),
              ),
            ]),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(32),
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          "assets/images/profile_image.png",
                          width: 60,
                          height: 60,
                        )),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(AppLocalizations.of(context)!.name,
                              style: Theme.of(context).textTheme.titleMedium),
                          SizedBox(
                            height: 2,
                          ),
                          Text(AppLocalizations.of(context)!.job),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              Icon(
                                CupertinoIcons.location,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .color,
                                size: 13,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(localization.location,
                                  style:
                                      Theme.of(context).textTheme.labelSmall),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      CupertinoIcons.heart,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
                child: Text(AppLocalizations.of(context)!.summary,
                    style: Theme.of(context).textTheme.bodySmall),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 12, 32, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(localization.selectedLanguage),
                    CupertinoSlidingSegmentedControl<_Language>(
                        thumbColor: Theme.of(context).colorScheme.primary,
                        groupValue: _language,
                        children: {
                          _Language.en: Text(localization.enLanguage,
                              style: TextStyle(fontSize: 14)),
                          _Language.fa: Text(localization.faLanguage,
                              style: TextStyle(fontSize: 14)),
                        },
                        onValueChanged: (value) {
                          if (value != null) _updateSelectedLanguage(value);
                        })
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 64, 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(localization.skills,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontWeight: FontWeight.w900)),
                    SizedBox(
                      width: 2,
                    ),
                    Icon(
                      CupertinoIcons.chevron_down,
                      color: Theme.of(context).textTheme.bodySmall!.color,
                      size: 12,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Center(
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  direction: Axis.horizontal,
                  children: [
                    Skill(
                      type: _SkillType.photoshop,
                      title: "Photoshop",
                      imagePath: "assets/images/app_icon_01.png",
                      shadowColor: Colors.blue,
                      isActive: _skill == _SkillType.photoshop,
                      onTap: () {
                        _updateSelectedSkill(_SkillType.photoshop);
                      },
                    ),
                    Skill(
                      type: _SkillType.xd,
                      title: "Adobe XD",
                      imagePath: "assets/images/app_icon_05.png",
                      shadowColor: Colors.pink,
                      isActive: _skill == _SkillType.xd,
                      onTap: () {
                        _updateSelectedSkill(_SkillType.xd);
                      },
                    ),
                    Skill(
                      type: _SkillType.illustrator,
                      title: "Illustrator",
                      imagePath: "assets/images/app_icon_04.png",
                      shadowColor: Colors.orange,
                      isActive: _skill == _SkillType.illustrator,
                      onTap: () {
                        _updateSelectedSkill(_SkillType.illustrator);
                      },
                    ),
                    Skill(
                      type: _SkillType.afterEffect,
                      title: "After Effect",
                      imagePath: "assets/images/app_icon_03.png",
                      shadowColor: Colors.blue.shade800,
                      isActive: _skill == _SkillType.afterEffect,
                      onTap: () {
                        _updateSelectedSkill(_SkillType.afterEffect);
                      },
                    ),
                    Skill(
                      type: _SkillType.lightRoom,
                      title: "Lightroom",
                      imagePath: "assets/images/app_icon_02.png",
                      shadowColor: Colors.blue,
                      isActive: _skill == _SkillType.lightRoom,
                      onTap: () {
                        _updateSelectedSkill(_SkillType.lightRoom);
                      },
                    ),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 12, 32, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(localization.personalInformation,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontWeight: FontWeight.w900)),
                    SizedBox(
                      height: 12,
                    ),
                    TextField(
                        decoration: InputDecoration(
                            labelText: localization.email,
                            prefixIcon: Icon(CupertinoIcons.at))),
                    SizedBox(
                      height: 8,
                    ),
                    TextField(
                        decoration: InputDecoration(
                            labelText: localization.password,
                            prefixIcon: Icon(CupertinoIcons.lock))),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0)),
                        textStyle: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                        ),
                      ),
                      child: Text(localization.save),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class Skill extends StatelessWidget {
  final _SkillType type;
  final String title;
  final String imagePath;
  final Color shadowColor;
  final bool isActive;
  final Function() onTap;

  const Skill({
    Key? key,
    required this.type,
    required this.title,
    required this.imagePath,
    required this.shadowColor,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BorderRadius defaultBorderRadius = BorderRadius.circular(12);
    return InkWell(
      borderRadius: defaultBorderRadius,
      onTap: onTap,
      child: Container(
        width: 110,
        height: 110,
        decoration: isActive
            ? BoxDecoration(
                color: Theme.of(context).dividerColor,
                borderRadius: defaultBorderRadius)
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: isActive
                  ? BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: shadowColor.withOpacity(0.5), blurRadius: 20)
                    ])
                  : null,
              child: Image.asset(
                imagePath,
                width: 40,
                height: 40,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}

enum _Language {
  en,
  fa,
}
