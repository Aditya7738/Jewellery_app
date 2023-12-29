import 'package:flutter/material.dart';
import 'package:jwelery_app/views/widgets/app_bar.dart';
import 'package:jwelery_app/views/widgets/category_grid_item.dart';

import '../../model/category_model.dart';

class SlideDrawer extends StatelessWidget {
  const SlideDrawer({super.key});

  @override
  Widget build(BuildContext context) {

    //print(MediaQuery.of(context).size.width);
    List<CategoryModel> listOfCategoryModel = <CategoryModel>[];
    listOfCategoryModel
        .add(new CategoryModel("Rings", "assets/images/wedding_ring.png"));
    listOfCategoryModel
        .add(new CategoryModel("Earrings", "assets/images/wedding_ring.png"));
    listOfCategoryModel.add(new CategoryModel(
        "Braceles & Bangles", "assets/images/wedding_ring.png"));
    listOfCategoryModel
        .add(new CategoryModel("Necklaces", "assets/images/wedding_ring.png"));
    listOfCategoryModel
        .add(new CategoryModel("Earrongs", "assets/images/wedding_ring.png"));
    listOfCategoryModel
        .add(new CategoryModel("Solitaires", "assets/images/wedding_ring.png"));
    listOfCategoryModel
        .add(new CategoryModel("Magalsutra", "assets/images/wedding_ring.png"));

    return Padding(
              padding: const EdgeInsets.all(18.0),
              child: GridView.builder(
                  itemCount: listOfCategoryModel.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 3.1,
                      crossAxisCount:
                          MediaQuery.of(context).size.width > 600 ? 4 : 2,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 14.0),
                  itemBuilder: (BuildContext context, int index) {
                    return CategoryGridItem(
                        categoryModel: listOfCategoryModel[index]);
                  }),

    );
  }
}
