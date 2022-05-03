import 'package:flutter/material.dart';
import '../DUMMI DETA/dummi_data_wallpepar.dart';
import '../widget/faviourit_itom.dart';

class FaviouritScreen extends StatefulWidget {
  const FaviouritScreen({Key? key}) : super(key: key);

  @override
  State<FaviouritScreen> createState() => _FaviouritScreenState();
}

class _FaviouritScreenState extends State<FaviouritScreen> {
  @override
  Widget build(BuildContext context) {
    final _faviouritWallpepar = DUMMI_WALLPEPAR.where((element) {
      return element.like == true;
    }).toList();
    return _faviouritWallpepar.isEmpty
        ? Center(
            child: Text(
              'You Have No Faviourit Wallpepar',
              textScaleFactor: 1.5,
            ),
          )
        : GridView.builder(
            itemBuilder: (context, index) {
              return FaviouritItom(
                wallpaper: _faviouritWallpepar[index],
                forSetState: () {
                  setState(() {});
                },
              );
            },
            itemCount: _faviouritWallpepar.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 4/3,
              maxCrossAxisExtent:MediaQuery.of(context).size.width / 2,
              mainAxisExtent: MediaQuery.of(context).size.height / 3,
            ),
          );
  }
}
