import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../DUMMI DETA/dummi_data_category.dart';
import '../widget/category_itom.dart';
import 'package:wallpapers/models/category.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return GridView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(25),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          crossAxisSpacing: 20,
          childAspectRatio: 4/3,
          mainAxisSpacing: 20,
          maxCrossAxisExtent: 200,
        ),
        children: [
          ...DUMMI_CATEGORY.map((e) => CategoryItem(category: e,)).toList()

        ],
      );
  }
}
