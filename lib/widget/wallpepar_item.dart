import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wallpapers/DUMMI%20DETA/dummi_resent_wall_id.dart';
import 'package:wallpapers/models/wallpepars.dart';
import 'package:wallpapers/screens/selected_wallpepar_screen.dart';

import 'progress_bar.dart';

class WallpeparItom extends StatefulWidget {
  const WallpeparItom({required this.wallpepar, Key? key}) : super(key: key);
  final Wallpaper wallpepar;

  @override
  State<WallpeparItom> createState() => _WallpeparItomState();
}

class _WallpeparItomState extends State<WallpeparItom> {
  selectedWallpepar(BuildContext context) {
    Navigator.of(context).pushNamed(SelectedWallpeparScreen.routName,
        arguments: widget.wallpepar).then((value) {
          setState(() {

          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 11,
          child: InkWell(
            splashColor: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(15),
            onTap: () {
              selectedWallpepar(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: GridTile(
                    footer: GridTileBar(
                      title: Text(
                        widget.wallpepar.name,
                        textScaleFactor: 1.5,
                      ),
                      backgroundColor: Colors.black54,
                      trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            widget.wallpepar.Like();
                          });
                        },
                        icon: Icon(widget.wallpepar.like
                            ? Icons.favorite
                            : Icons.favorite_border),
                      ),
                    ),
                    child: Image.network(
                      widget.wallpepar.ingUrl,
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
          ),
        ),
        Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description:',
                    textScaleFactor: 1.5,
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(widget.wallpepar.discription,),
                ],
              ),
            ))
      ],
    );
  }
}
