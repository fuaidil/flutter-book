import 'package:flutter/material.dart';

class HomeTest extends StatefulWidget {
  HomeTest({super.key});

  @override
  State<HomeTest> createState() => _HomeTestState();
}

class _HomeTestState extends State<HomeTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //app bar
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/images/fuad.jpeg"),
                  ),
                  SizedBox(width: 15),
                  RichText(
                    text: TextSpan(
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
              //search section
              SizedBox(height: 35),
              Material(
                borderRadius: BorderRadius.circular(100),
                elevation: 5,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Search books",
                              prefixIcon: Icon(Icons.search),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        CircleAvatar(
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
              //category
              SizedBox(height: 30),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Category",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Divider(
                height: 7,
                color: Colors.black.withAlpha(35),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      child: Material(
                        elevation: 5.0, // Tingkat elevasi
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(50.0), // Bentuk bulat
                        ),
                        child: Container(
                          width: 170.0,
                          height: 55.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                  radius: 25.0,
                                  backgroundImage: AssetImage(
                                      "assets/images/avatar.jpg") // Ganti dengan gambar avatar yang diinginkan
                                  ),
                              SizedBox(width: 10.0),
                              Text(
                                'Your Text',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // Container(
              //   child: ListView(
              //     scrollDirection: Axis.horizontal,
              //     children: [
              //       Row(
              //         children: [
              //           Container(
              //             child: ClipRRect(
              //               borderRadius: BorderRadius.circular(50),
              //               child: Container(
              //                 width: 170,
              //                 height: 55,
              //                 color: Colors.blue,
              //               ),
              //             ),
              //           )
              //         ],
              //       )
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      )),
    );
  }
}
