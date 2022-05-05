import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wallpapers/screens/category_screen.dart';
import 'package:wallpapers/screens/search_screen.dart';
import 'package:wallpapers/screens/theme_setting_screen.dart';

import '../DUMMI DETA/dummi_data_wallpepar.dart';
import 'faviourit_screen.dart';
import 'resent_screen.dart';
import 'selected_wallpepar_screen.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen(
      {Key? key})
      : super(key: key);
  static const routName = '/tab-bar-screen';


  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}


class _TabBarScreenState extends State<TabBarScreen> {
  List<Map<String, Object>> _pages = [
    {'name': 'Resent', 'screen': ResentScreen()},
    {'name': 'Category', 'screen': CategoryScreen()},
    {'name': 'Faviourit', 'screen': FaviouritScreen()},
  ];
  int selectedPageIndex = 1;
  void _selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }
  selectPopUpItom(int signal ,BuildContext context)
  {
    if(signal==0)
      {
        Navigator.of(context).pushNamed(ThemeSettingScreen.routName);
      }
  }
  AppBar simpalAppBar()
  {
    return AppBar(
      title: Text(_pages[selectedPageIndex]['name'] as String),
      actions: [
        if(selectedPageIndex == 1)
          IconButton(onPressed: ()
              {
                selectSearch(context);
              }, icon: Icon(Icons.search_sharp,color: Colors.white,)),

        PopupMenuButton(
          onSelected: (value){selectPopUpItom(value as int, context);},
          itemBuilder: (context) {
            return [

              PopupMenuItem(
                  value: 0,
                  child: Text('Theme Setting')),
            ];
          },)
      ],
    );
  }
  selectSearch(BuildContext context) {
    Navigator.of(context).pushNamed(SearchBar.routName);
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar:simpalAppBar(),
        body: _pages[selectedPageIndex]['screen'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Theme.of(context).primaryColor,
            unselectedItemColor: Theme.of(context).primaryColorLight,
            selectedItemColor: Colors.white,
            onTap: (index) {
              _selectPage(index);
            },
            currentIndex: selectedPageIndex,
            type: BottomNavigationBarType.shifting,
            items: [
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).accentColor,
                icon: Icon(Icons.restore),
                label: 'resent',
              ),
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).accentColor,
                icon: Icon(Icons.category),
                label: 'Category',
              ),
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).accentColor,
                icon: Icon(Icons.favorite),
                label: 'favorite',
              ),
            ]));
  }
}
