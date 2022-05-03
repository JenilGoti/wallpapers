import 'package:flutter/material.dart';
import '../DUMMI DETA/dummi_deta_subcategory.dart';
import '../widget/sub_category_item.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({Key? key}) : super(key: key);
  static const routName='/sub-category';

  @override
  Widget build(BuildContext context) {
    final routArgs=ModalRoute.of(context)?.settings.arguments as Map<String,String>;
    final String categoryId=routArgs['id']!;
    final String categoryName=routArgs['name']!;
    final subCatofCategory=DUMMI_SUBCATEGORY.where((element) => element.Categoryes==categoryId ).toList();

    var appBar=AppBar(
      title: Text(categoryName),
    );
    return Scaffold(
      appBar: appBar,
      body: GridView.builder(itemBuilder: (context, index) {
        return SubCategoryItem(subCategoryItem: subCatofCategory[index]);

      },
      itemCount: subCatofCategory.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 6/5,
          maxCrossAxisExtent: 450,
          mainAxisExtent: (MediaQuery.of(context).size.height-appBar.preferredSize.height-MediaQuery.of(context).padding.top)/2,
        ),),
    );
  }
}
