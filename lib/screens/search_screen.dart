import 'package:flutter/material.dart';
import 'package:wallpapers/DUMMI%20DETA/dummi_data_wallpepar.dart';
import '../models/wallpepars.dart';
import 'selected_wallpepar_screen.dart';
import '../DUMMI DETA/dummi_data_wallpepar.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);
  static const routName = '/search-bar';

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController serch = new TextEditingController();
  List<Wallpaper> searchWallpaper = [];

  selectedWallpepar(BuildContext context, wallpepar) {
    Navigator.of(context)
        .pushNamed(SelectedWallpeparScreen.routName, arguments: wallpepar);
  }

  refreshSuggetions() {
    setState(() {
      searchWallpaper = DUMMI_WALLPEPAR.where((element) {
        return element.name.toLowerCase().contains(serch.text.toLowerCase());
      }).toList();
      searchWallpaper.sort(
        (a, b) {
          return a.name
              .toLowerCase()
              .indexOf(serch.text.toLowerCase())
              .compareTo(b.name.indexOf(serch.text.toLowerCase()));
        },
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    serch.addListener(() {
      refreshSuggetions();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: serch,
          decoration: InputDecoration.collapsed(hintText: 'Search',
          border: InputBorder.none),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              serch.clear();
            },
          )
        ],
      ),
      body: (searchWallpaper.isNotEmpty) &&
              (searchWallpaper.length != DUMMI_WALLPEPAR.length)
          ? ListView.builder(
              itemBuilder: (context, index) => ListTile(
                title: Text(searchWallpaper[index].name),
                onTap: () {
                  selectedWallpepar(context, searchWallpaper[index]);
                },
              ),
              itemCount: searchWallpaper.length,
            )
          : Center(
              child: Text('search'),
            ),
    );
  }
}
