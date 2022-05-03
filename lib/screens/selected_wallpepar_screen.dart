import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:wallpapers/models/wallpepars.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';

class SelectedWallpeparScreen extends StatefulWidget {
  const SelectedWallpeparScreen({Key? key}) : super(key: key);
  static const routName = '/selected-wallpepar-screen';

  @override
  State<SelectedWallpeparScreen> createState() =>
      _SelectedWallpeparScreenState();
}

class _SelectedWallpeparScreenState extends State<SelectedWallpeparScreen> {
  bool _fullScreen = false;

  setFullScreen() {
    if (_fullScreen) {
      _fullScreen = false;
    } else {
      _fullScreen = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedWallpepar =
        (ModalRoute.of(context)?.settings.arguments as Wallpaper);
    selectedWallpepar.viewTime = DateTime.now();
    _downloadWallpaper()  {
      try {
        // Saved with this method.
        setState(() {
          selectedWallpepar.img = ImageDownloader.downloadImage(
              selectedWallpepar.ingUrl,
              destination: AndroidDestinationType.directoryDownloads,
              outputMimeType: 'jpg');
        });
      } on PlatformException catch (error) {
        Fluttertoast.showToast(msg: error as String);
      }
    }
    _finalWallpaper(location)
    async {

      try {
        var cachedimage = await DefaultCacheManager().getSingleFile(selectedWallpepar.ingUrl);  //image file


        WallpaperManagerFlutter().setwallpaperfromFile(cachedimage, location);
      } on PlatformException catch (error) {
        Fluttertoast.showToast(msg: error as String);
      }
    }
    _setFinalWallpaper()
    {
      return showModalBottomSheet(context: context, builder: (context){

        return Column(
          children: [
            ListTile(
              title: Text('set as home screen'),
              onTap: ()
              {
                _finalWallpaper(WallpaperManagerFlutter.HOME_SCREEN);
                Navigator.of(context).pop();
              },
            ),ListTile(
              title: Text('set as lock screen'),
              onTap: ()
              {
                _finalWallpaper(WallpaperManagerFlutter.LOCK_SCREEN);
                Navigator.of(context).pop();
              },
            ),ListTile(
              title: Text('set as both'),
              onTap: ()
              {
                _finalWallpaper(WallpaperManagerFlutter.BOTH_SCREENS);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
    }

    _setWallpaper() {
      if (selectedWallpepar.img == null) {
        return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Image Is Not Downloaded'),
                content:
                    Text('for set image as wall paper firstly download it!'),
                actions: [
                  ElevatedButton(
                    onPressed: (){
                      _downloadWallpaper();
                      Navigator.of(context).pop();
                      _setFinalWallpaper();

                      },
                    child: Text('Download'),
                  ),
                ],
              );
            });
      }
      else {
        _setFinalWallpaper();
      }

    }


    AppBar _appBar = AppBar(
      title: Text(selectedWallpepar.name),
    );
    return Scaffold(
      appBar: !_fullScreen ? _appBar : null,
      body: GestureDetector(
        onTap: () => setState(() {
          setFullScreen();
        }),
        child: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.network(
                selectedWallpepar.ingUrl,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: FlatButton(
                    onPressed: () {
                      _setWallpaper();
                    },
                    child: Text(
                      '  Apply  ',
                      textScaleFactor: 1.2,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: FittedBox(
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          selectedWallpepar.Like();
                        });
                      },
                      icon: Icon(selectedWallpepar.like
                          ? Icons.favorite
                          : Icons.favorite_border),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            if (selectedWallpepar.img == null)
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: FittedBox(
                      child: IconButton(
                        onPressed: (){
                            _downloadWallpaper();

                          },
                        icon: Icon(Icons.download_rounded),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
