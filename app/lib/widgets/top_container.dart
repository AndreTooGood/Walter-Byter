import 'package:flutter/material.dart';

class TopContainer extends StatelessWidget {
  final String title;
  final String searchBarTitle;
  const TopContainer({super.key, required this.title, required this.searchBarTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          Text(
              title,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.black,
            ),
          ),
        const Spacer(),
        Container(
          height: 40,
          width: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape; BoxShape
          ),
        )

      ],
    );
  }
}
