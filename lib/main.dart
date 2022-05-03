import 'package:flutter/material.dart';
import 'package:wallpapers/screens/selected_wallpepar_screen.dart';
import 'package:wallpapers/screens/subcategory_screen.dart';
import 'package:wallpapers/screens/tab_bar_screen.dart';
import 'package:wallpapers/screens/theme_setting_screen.dart';
import 'package:wallpapers/screens/wallpaper_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


    Map<String, Object> _themeDeta={
    'primarySwatch':Colors.indigo,
    'accentColor':Colors.indigoAccent,
    'brightness':(ThemeMode.system==ThemeMode.dark)?Brightness.dark:Brightness.light,
  };

  bool _themeSwitch=(ThemeMode.system==ThemeMode.dark);
    get Theme => ThemeData(
    primarySwatch: _themeDeta['primarySwatch'] as MaterialColor,
    accentColor: _themeDeta['accentColor'] as MaterialAccentColor,
    brightness: _themeDeta['brightness'] as Brightness,
  );


  setTheme(themData)
  {
    setState(() {
      _themeDeta=themData;
    }
    );
  }


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallpaper',
      theme: Theme,
      initialRoute: TabBarScreen.routName,
      routes: {
        TabBarScreen.routName:(context) => TabBarScreen(),
        SubCategoryScreen.routName:(context)=>SubCategoryScreen(),
        WallpeparScreen.routName:(context)=>WallpeparScreen(),
        SelectedWallpeparScreen.routName:(context) => SelectedWallpeparScreen(),
        ThemeSettingScreen.routName:(context) => ThemeSettingScreen(setTheme: setTheme,themeData: _themeDeta),

      },
    );
  }
}

