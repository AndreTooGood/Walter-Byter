import 'package:app/widgets/top_container.dart';
import 'package:flutter/material.dart';
class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 30),
      child: Column(
        children: [
          TopContainer(title: "Hi, ArunSanyal", searchBarTitle: 'Search')
        ],
      ) ,
    );
  }
}
