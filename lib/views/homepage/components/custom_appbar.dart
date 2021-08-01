import 'package:flutter/material.dart';
import 'package:pyari_desh/main.dart';
import 'package:pyari_desh/views/favoritePage/favorites_page.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      margin: const EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                      text: "$title",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w900)),
                ),
                RichText(
                  text: TextSpan(
                      text: "Countries with flags",
                      style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.white70,
                          fontWeight: FontWeight.w400)),
                ),
              ],
            ),
          ),
          //favorite icon button made from gesture detector
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed('/favorites'),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white70,
                      blurRadius: 10.0,
                      spreadRadius: 1.0,
                    )
                  ]),
              child: Icon(
                Icons.favorite,
                color: Colors.lime,
              ),
            ),
          )
        ],
      ),
    );
  }
}
