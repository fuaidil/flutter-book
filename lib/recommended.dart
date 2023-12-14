import 'package:flutter/material.dart';

class Recommended extends StatelessWidget {
  // final PlaceInfo placeInfor;
  final String title, image, loc, rate;
  final VoidCallback pressr;
  const Recommended({
    // super.key,
    Key? key,
    // required this.placeInfor,
    required this.pressr,
    required this.title,
    required this.image,
    required this.loc,
    required this.rate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pressr,
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 250,
          width: 200,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(image),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    const Icon(
                      Icons.price_change,
                      color: Colors.orange,
                    ),
                    Text(
                      loc,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
