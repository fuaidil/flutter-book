import 'package:flutter/material.dart';

class CategoryCardNav extends StatelessWidget {
  final String title, image;
  final VoidCallback press;

  const CategoryCardNav({
    Key? key,
    required this.title,
    required this.image,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, top: 5),
      child: InkWell(
        onTap: press,
        child: Material(
          elevation: 7,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 90,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 8.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Image.asset(
                      image,
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.format_list_bulleted,
                    size: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
