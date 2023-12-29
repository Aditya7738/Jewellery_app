import 'package:flutter/material.dart';

import '../../model/category_model.dart';

class CategoryGridItem extends StatelessWidget {
  final CategoryModel categoryModel;

  const CategoryGridItem({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.circular(18.0),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade200,
              offset: Offset(0.0, 1.0),
              blurRadius: 1.0,
              spreadRadius: 2.0
            )]),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: 6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),

            ),

            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Image.asset(
                categoryModel.imagePath,
                width: 40.0,
                height: 40.0,
                fit: BoxFit.fill,
              ),
            ),
          ),

          Expanded(
            child: Text(
                categoryModel.title,
              style: TextStyle(fontSize: 10.0),
            ),
          ),

          Container(
            alignment: Alignment.centerRight,
              child: Icon(
                  Icons.chevron_right,
                color: Colors.grey,
              )
          ),
        ],


      ),

      //   return Card(
      // elevation: 8.0,
      // child: ListTile(
      //   leading: Card(
      //   elevation: 0.0,
      //   color: Colors.greenAccent,
      // child: Image.asset(categoryModel.imagePath, width: 40.0, height: 40.0,),
      // ),
      // title: Text(categoryModel.title),
      // trailing: Icon(Icons.chevron_right),
      // ),
    );
  }
}
