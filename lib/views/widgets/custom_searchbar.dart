import 'package:flutter/material.dart';
import 'package:jwelery_app/views/pages/search_page.dart';

class CustomSearchBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 10.0
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Color(0xFFE4B2FF),
        ),

        padding: EdgeInsets.all(10.0),
        child: Row(
          children: const [
            Icon(
                Icons.search_rounded,
            size: 20.0,),
            SizedBox(width: 10.0,),
            Text(
                "Search by category, product & more...",
            style: TextStyle(
              fontSize: 12.0
            ),)
          ],

        ),
      ),

      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SearchPage()))
    );

      }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  }



