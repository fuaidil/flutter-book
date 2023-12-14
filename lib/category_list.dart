// category_list_page.dart

import 'package:flutter/material.dart';
import 'package:uas_prakmobile/category_card_nav.dart';
import 'package:uas_prakmobile/category_page.dart';

class CategoryListPage extends StatelessWidget {
  const CategoryListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Category List'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: ListView(
          children: [
            // search
            const SizedBox(height: 10),
            Material(
              borderRadius: BorderRadius.circular(100),
              elevation: 5,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Search Category",
                            prefixIcon: Icon(Icons.search),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      const CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.orange,
                        child: Icon(
                          Icons.sort_by_alpha_sharp,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            // list
            SizedBox(height: 10),
            CategoryCardNav(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryPage(category: 'Novel'),
                  ),
                );
              },
              image: "assets/images/novel.jpg",
              title: "Novel",
            ),
            CategoryCardNav(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryPage(category: 'Fiksi'),
                  ),
                );
              },
              image: "assets/images/fiksi.jpg",
              title: "Fiksi",
            ),
            CategoryCardNav(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryPage(category: 'Politik'),
                  ),
                );
              },
              image: "assets/images/politik.jpg",
              title: "Politik",
            ),
            CategoryCardNav(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryPage(category: 'Sains'),
                  ),
                );
              },
              image: "assets/images/sains.jpg",
              title: "Sains",
            ),
          ],
        ),
      ),
    );
  }
}
