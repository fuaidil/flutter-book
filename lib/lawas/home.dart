import 'package:flutter/material.dart';
import 'package:uas_prakmobile/category_card.dart';
import 'package:uas_prakmobile/category_page.dart';
import 'package:uas_prakmobile/detail_screen.dart';
import 'package:uas_prakmobile/lawas/place_model.dart';
import 'package:uas_prakmobile/lawas/popular_card.dart';
import 'package:uas_prakmobile/lawas/place_model.dart';
import 'package:uas_prakmobile/lawas/recommended_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // late int moviesCount;
  // late List movies;
  // late HttpService service;
  // final String imgPath = 'https://image.tmdb.org/t/p/w500';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // app bar
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("assets/images/fuad.jpeg"),
                    ),
                    const SizedBox(width: 15),
                    RichText(
                      text: const TextSpan(
                        text: "Hello",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                        children: [
                          TextSpan(
                            text: ", Fuaidil Ikhrom",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // search section
                const SizedBox(height: 15),
                const SizedBox(height: 20),
                Material(
                  borderRadius: BorderRadius.circular(100),
                  elevation: 5,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: "Search books",
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

                // Category
                const SizedBox(height: 30),
                const Row(
                  children: [
                    Text(
                      "Category",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Divider(
                  height: 10,
                  color: const Color.fromARGB(255, 158, 154, 154),
                ),
                const SizedBox(height: 10),
                // ignore: sized_box_for_whitespace
                Container(
                  height: 70,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Row(
                        children: [
                          CategoryCard(
                            press: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) =>
                              //         CategoryPage(category: 'Novel'),
                              //   ),
                              // );
                            },
                            image: "assets/images/novel.jpg",
                            title: "Novel",
                          ),
                          CategoryCard(
                            press: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) =>
                              //         CategoryPage(category: 'Fiksi'),
                              //   ),
                              // );
                            },
                            image: "assets/images/fiksi.jpg",
                            title: "Fiksi",
                          ),
                          CategoryCard(
                            press: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) =>
                              //         CategoryPage(category: 'Politik'),
                              //   ),
                              // );
                            },
                            image: "assets/images/politik.jpg",
                            title: "Politik",
                          ),
                          CategoryCard(
                            press: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) =>
                              //         CategoryPage(category: 'Sains'),
                              //   ),
                              // );
                            },
                            image: "assets/images/sains.jpg",
                            title: "Sains",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Divider(
                  height: 10,
                  color: const Color.fromARGB(255, 158, 154, 154),
                ),

                // Recommended
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Text(
                      "Recommended",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // ignore: sized_box_for_whitespace
                Container(
                  height: 270,
                  child: ListView.builder(
                    itemCount: places.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 5, right: 10),
                        child: Row(
                          children: [
                            RecommendedCard(
                              placeInfor: places[index],
                              pressr: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) =>
                                //         Detail(placeInfo: places[index]),
                                //   ),
                                // );
                              },
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),

                // popular
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Text(
                      "List Books",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // ignore: sized_box_for_whitespace
                Container(
                  height: 270,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: places.map((place) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Popular(
                          placeInfo: place,
                          press: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => Detail(placeInfo: place),
                            //   ),
                            // );
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
