import 'dart:async';

import 'package:uas_prakmobile/category_card.dart';
import 'package:uas_prakmobile/category_page.dart';
import 'package:uas_prakmobile/detail_screen.dart';
import 'package:uas_prakmobile/koneksi.dart';
import 'package:uas_prakmobile/model.dart';
import 'package:flutter/material.dart';
import 'package:uas_prakmobile/popular.dart';
import 'package:uas_prakmobile/recommended.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Model>? posts;
  var isLoaded = false;

  getData() async {
    posts = await ApiService().getProfiles();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  FutureOr onGoBack() {
    getData();
  }

  // void navigateAddProfile() {
  //   Route route = MaterialPageRoute(builder: (context) => addUser());
  //   Navigator.push(context, route).then((value) => onGoBack());
  // }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Users Data')),
      body: Visibility(
        visible: isLoaded,
        child: FutureBuilder(
          future: ApiService().getProfiles(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Model>?> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                    "Something wrong with message: ${snapshot.error.toString()} "),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              List<Model>? profiles = snapshot.data;
              return _buildListView(profiles!);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildListView(List<Model> profiles) {
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
                      backgroundImage: AssetImage("assets/images/welcome.jpeg"),
                    ),
                    const SizedBox(width: 15),
                    RichText(
                      text: const TextSpan(
                        text: "Hello",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                        children: [
                          TextSpan(
                            text: ", Guest",
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
                const Divider(
                  height: 10,
                  color: Color.fromARGB(255, 158, 154, 154),
                ),
                const SizedBox(height: 10),
                // ignore: sized_box_for_whitespace
                Container(
                  height: 70,
                  child: ListView.builder(
                    itemCount: 1,
                    scrollDirection:
                        Axis.horizontal, // Sesuaikan dengan jumlah kategori
                    itemBuilder: (context, index) {
                      // Model profile = profiles[index];
                      return Row(
                        children: [
                          CategoryCard(
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CategoryPage(category: 'Novel'),
                                ),
                              );
                            },
                            image: "assets/images/novel.jpg",
                            title: "Novel",
                          ),
                          CategoryCard(
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CategoryPage(category: 'Fiksi'),
                                ),
                              );
                            },
                            image: "assets/images/fiksi.jpg",
                            title: "Fiksi",
                          ),
                          CategoryCard(
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CategoryPage(category: 'Politik'),
                                ),
                              );
                            },
                            image: "assets/images/politik.jpg",
                            title: "Politik",
                          ),
                          CategoryCard(
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CategoryPage(category: 'Sains'),
                                ),
                              );
                            },
                            image: "assets/images/sains.jpg",
                            title: "Sains",
                          ),
                        ],
                      );
                    },
                  ),
                ),

                const SizedBox(height: 10),
                const Divider(
                  height: 10,
                  color: Color.fromARGB(255, 158, 154, 154),
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
                    itemCount: profiles.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      Model profile = profiles[index];
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            Recommended(
                              image: profile.image,
                              title: profile.name,
                              loc: profile.location,
                              rate: profile.rate,
                              pressr: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Detail(
                                      image: profile.image,
                                      title: profile.name,
                                      description: profile.desc,
                                      category: profile.category,
                                      rate: profile.rate,
                                      loc: profile.location,
                                    ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(width: 20),
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

                // listview bulder popular
                // Container(
                //   height: 270,
                //   child: ListView.builder(
                //     scrollDirection: Axis.vertical,
                //     itemBuilder: (context, index) {
                //       Model profile = profiles[index];
                //       return Padding(
                //         padding: const EdgeInsets.only(top: 8.0),
                //         child: Popularr(
                //           image: profile.image,
                //           title: profile.name,
                //           loc: profile.location,
                //           rate: profile.rate,
                //           press: () {
                //             Navigator.push(
                //                 context,
                //                 MaterialPageRoute(
                //                   builder: (context) => Detail(
                //                       image: profile.image,
                //                       title: profile.name,
                //                       description: profile.desc),
                //                 ));
                //           },
                //         ),
                //       );
                //     },
                //     itemCount: profiles.length,
                //   ),
                // ),

                // listview popular
                SizedBox(
                  height: 270,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: profiles.map((profile) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Popularr(
                          image: profile.image,
                          title: profile.name,
                          loc: profile.location,
                          rate: profile.rate,
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Detail(
                                    image: profile.image,
                                    title: profile.name,
                                    description: profile.desc,
                                    category: profile.category,
                                    rate: profile.rate,
                                    loc: profile.location),
                              ),
                            );
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
