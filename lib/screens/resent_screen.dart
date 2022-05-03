import 'package:flutter/material.dart';
import '../DUMMI DETA/dummi_data_wallpepar.dart';
import '../widget/resent_itom.dart';

class ResentScreen extends StatefulWidget {
  const ResentScreen({Key? key}) : super(key: key);

  @override
  State<ResentScreen> createState() => _ResentScreenState();
}

class _ResentScreenState extends State<ResentScreen> {
  @override
  Widget build(BuildContext context) {
    final _resentWallpepar = DUMMI_WALLPEPAR.where((element) {
      if(element.viewTime==null)
        {
          return false;
        }
      return element.viewTime!.isBefore(DateTime.now());

    }).toList();
    _resentWallpepar.sort((a, b) => b.viewTime!.compareTo(a.viewTime!),);
    return _resentWallpepar.isEmpty
        ? Center(
      child: Text(
        'You Have No Resent Wallpepar',
        textScaleFactor: 1.5,
      ),
    )
        : GridView.builder(
      itemBuilder: (context, index) {
        return ResentItom(
          wallpaper: _resentWallpepar[index],
          forSetState: () {
            setState(() {});
          },
        );
      },
      itemCount: _resentWallpepar.length,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        childAspectRatio: 3 / 2,
        maxCrossAxisExtent: MediaQuery
            .of(context)
            .size
            .width / 2,
        mainAxisExtent: MediaQuery
            .of(context)
            .size
            .height / 3,
      ),
    );
  }
}
