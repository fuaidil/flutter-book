import 'package:flutter/material.dart';

class Popularr extends StatelessWidget {
  // final PlaceInfo placeInfo;
  final String title, image, loc, rate;
  final VoidCallback press;
  const Popularr(
      {Key? key,
      required this.press,
      required this.title,
      required this.image,
      required this.loc,
      required this.rate});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Card(
        elevation: 3, // Tingkat elevasi untuk memberi efek bayangan
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
              child: Image.asset(
                image,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          Icons.price_change,
                          color: Colors.orange,
                          size: 18,
                        ),
                        Text(
                          loc,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Text(
                          rate,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
