import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpapers/screens/subcategory_screen.dart';
import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.category}) : super(key: key);
  final Category category;

  selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(SubCategoryScreen.routName,arguments:{'id':category.id,'name': category.name});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        return selectCategory(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomRight,
                colors: [category.color.withOpacity(0.6), category.color])),
        child: Text(category.name,textScaleFactor: 1.5,),
      ),
    );
  }
}
