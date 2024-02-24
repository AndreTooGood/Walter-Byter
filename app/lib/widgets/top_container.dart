import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TopContainer extends StatelessWidget {
  final String title;
  final String searchBarTitle;
  const TopContainer(
      {super.key, required this.title, required this.searchBarTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 27,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            Container(
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red[200],
              ),
              child: Stack(
                children: [
                  Icon(
                    FontAwesomeIcons.bell,
                    color: Colors.red[800],
                    size: 23,
                  ),

                ],
              ),
            ),

          ],
        ),
        SizedBox(
          height: 30,
        ),

        SizedBox(
          height: 60,
          child: TextField(
            style: TextStyle(
              color: Colors.grey[600],
              fontFamily: 'Poppins-Regular',
              fontSize: 18,
            ),
            decoration: InputDecoration(
                prefixIcon: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: Colors.grey,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(50))),
          ),
        )
      ],
    );
  }
}
