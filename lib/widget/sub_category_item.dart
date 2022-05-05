import 'package:flutter/material.dart';
import 'package:wallpapers/models/subcategory.dart';
import 'package:wallpapers/screens/wallpaper_screen.dart';

import 'progress_bar.dart';

class SubCategoryItem extends StatelessWidget {
  const SubCategoryItem({required this.subCategoryItem, Key? key})
      : super(key: key);
  final SubCategory subCategoryItem;

  selectSubCategory(BuildContext context) {
    Navigator.of(context).pushNamed(WallpeparScreen.routName,
        arguments: {'id': subCategoryItem.id, 'name': subCategoryItem.name});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        return selectSubCategory(context);
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
                title: Text(subCategoryItem.name,textScaleFactor: 1.5,),
                backgroundColor: Colors.black54,
              ),
              child: Image.network(
                subCategoryItem.imgUrl,
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
