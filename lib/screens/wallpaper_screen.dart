import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wallpapers/DUMMI%20DETA/dummi_data_wallpepar.dart';

import '../DUMMI DETA/dummi_resent_wall_id.dart';
import '../widget/wallpepar_item.dart';
class WallpeparScreen extends StatelessWidget {
  const WallpeparScreen({Key? key}) : super(key: key);
  static const routName='/wallpepar-screen';


  @override
  Widget build(BuildContext context) {
    final routArgs=ModalRoute.of(context)?.settings.arguments as Map<String,String>;
    final String subCategoryId=routArgs['id']!;
    final String subCategoryName=routArgs['name']!;
    final Wallpepar=DUMMI_WALLPEPAR.where((element) {
      return element.subCategoryes.contains(subCategoryId);}).toList();
    var appBar=AppBar(
      title: Text(subCategoryName),
    );
    return Scaffold(
      appBar: appBar,
      body: GridView.builder(itemBuilder: (context, index) {
        return WallpeparItom (wallpepar: Wallpepar[index]);


      },
        itemCount: Wallpepar.length,
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(

          childAspectRatio: (MediaQuery.of(context).size.width/ (MediaQuery.of(context).size.height-appBar.preferredSize.height-MediaQuery.of(context).padding.top)),

          maxCrossAxisExtent: MediaQuery.of(context).size.height-appBar.preferredSize.height-MediaQuery.of(context).padding.top,
          mainAxisExtent: MediaQuery.of(context).size.width-20,
        ),),
    );
  }
}
