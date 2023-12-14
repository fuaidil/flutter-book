import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  final String image, title, description, category, rate, loc;
  Detail(
      {required this.title,
      required this.image,
      required this.description,
      required this.category,
      required this.rate,
      required this.loc});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset(
            widget.image,
            width: double.infinity,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.5,
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(100),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                color: Colors.orange,
                                shape: BoxShape.circle,
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.arrow_back_ios_sharp,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(100),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.bookmark_add_rounded,
                                color: Colors.orange,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  widget.title,
                                  style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Text(
                                  widget.rate,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                const Icon(
                                  Icons.price_change,
                                  color: Colors.orange,
                                  size: 18,
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  widget.loc,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 20),
                            Text(
                              widget.description,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 5),
                            const SizedBox(height: 20),
                            MaterialButton(
                              color: Colors.orange,
                              minWidth: double.infinity,
                              height: 60,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Buy Now",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
