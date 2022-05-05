import 'package:flutter/material.dart';
import 'package:wallpapers/models/wallpepars.dart';

import '../screens/selected_wallpepar_screen.dart';
import 'progress_bar.dart';
class FaviouritItom extends StatelessWidget {
  const FaviouritItom({Key? key, required this.wallpaper, wallpepar, required this.forSetState}) : super(key: key);
  final Wallpaper wallpaper;
  final Function forSetState;
  selectedWallpepar(BuildContext context) {
    Navigator.of(context).pushNamed(SelectedWallpeparScreen.routName,
        arguments: wallpaper).then((value) {forSetState();});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      onTap:()=>selectedWallpepar(context),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 3,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: GridTile(
              footer: GridTileBar(
                title: Text(wallpaper.name,textScaleFactor: 1.5,),
                backgroundColor: Colors.black54,
              ),
              child: Image.network(
                wallpaper.ingUrl,
                fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    return CirProgBar(context, child, loadingProgress);
                  }
              ),
            ),
          ),
        ),
      ),
    );
  }
}
