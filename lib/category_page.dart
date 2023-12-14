// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:uas_prakmobile/detail_screen.dart';
import 'package:uas_prakmobile/model.dart';
import 'package:uas_prakmobile/koneksi.dart';

class CategoryPage extends StatelessWidget {
  final String category;

  CategoryPage({required this.category});

  @override
  Widget build(BuildContext context) {
    // Filter data sesuai dengan kategori
    // List filteredPlaces =
    //     places.where((place) => place.category == category).toList();

    // List filteredBook;

    return Scaffold(
        appBar: AppBar(
          title: Text('Category $category'),
          backgroundColor: Colors.orange,
        ),
        body: FutureBuilder(
          future: ApiService().getBooksByCategory(category),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              if (snapshot.data != null) {
                List<Model>? profile = snapshot.data;
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 5,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Detail(
                                category: profile[index].category,
                                title: snapshot.data![index].name,
                                image: snapshot.data![index].image,
                                description: snapshot.data![index].desc,
                                rate: snapshot.data![index].rate,
                                loc: snapshot.data![index].location,
                              ),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              profile![index].image,
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                title: Text(
                                  profile[index].name,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Row(
                                  children: [
                                    const Icon(
                                      Icons.price_change,
                                      color: Colors.orange,
                                      size: 18,
                                    ),
                                    Text(
                                      profile[index].location,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const Spacer(),
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    Text(
                                      profile[index].rate,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Text("Failed To Fetch");
              }
            }
          },
        )

        // ListView.builder(
        //   itemCount: filteredPlaces.length,
        //   itemBuilder: (context, index) {
        //     return Card(
        //       elevation: 5,
        //       margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        //       child: InkWell(
        //         onTap: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //               builder: (context) => Detail(
        //                 category: filteredPlaces[index],
        //                 title: filteredPlaces[index],
        //                 image: filteredPlaces[index],
        //                 description: filteredPlaces[index],
        //               ),
        //             ),
        //           );
        //         },
        //         child: Column(
        //           children: [
        //             Image.asset(
        //               filteredPlaces[index].image,
        //               width: double.infinity,
        //               height: 200,
        //               fit: BoxFit.cover,
        //             ),
        //             Padding(
        //               padding: const EdgeInsets.all(8.0),
        //               child: ListTile(
        //                 title: Text(
        //                   filteredPlaces[index].name,
        //                   style: TextStyle(
        //                       fontSize: 18, fontWeight: FontWeight.bold),
        //                 ),
        //                 subtitle: Row(
        //                   children: [
        //                     Icon(
        //                       Icons.price_change,
        //                       color: Colors.orange,
        //                       size: 18,
        //                     ),
        //                     Text(
        //                       filteredPlaces[index].location,
        //                       style: TextStyle(
        //                         color: Colors.grey,
        //                         fontSize: 15,
        //                       ),
        //                     ),
        //                     Spacer(),
        //                     Icon(
        //                       Icons.star,
        //                       color: Colors.amber,
        //                     ),
        //                     Text(
        //                       filteredPlaces[index].rate,
        //                       style: TextStyle(
        //                         color: Colors.black,
        //                         fontSize: 16,
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     );
        //   },
        // ),

        );
  }
}
