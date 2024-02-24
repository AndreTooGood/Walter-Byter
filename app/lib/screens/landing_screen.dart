import 'package:app/widgets/top_container.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int selectedValue=0;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController =TabController(length: 4, vsync: this, initialIndex: 0);
  }
  @override
  void dispose(){
    super.dispose();
    tabController.dispose();
  }
  List<Widget> carouselItems = [
    Image.asset('assets/image1.png'),
    Image.asset('assets/image2.png'),
    Image.asset('assets/image3.png'),
    Image.asset('assets/image4.png'),

  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(


      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
            child: TopContainer(title: "Hi, ArunSanyal", searchBarTitle: 'Search'),
          ),


          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 15),
            child: CarouselSlider(
              items: carouselItems,
              options: CarouselOptions(
                // Set the desired options for the carousel
                height: 200, // Set the height of the carousel
                autoPlay: false, // Enable auto-play
                autoPlayCurve: Curves.easeInOut, // Set the auto-play curve
                autoPlayAnimationDuration: Duration(milliseconds: 500), // Set the auto-play animation duration
                aspectRatio: 4/3, // Set the aspect ratio of each item
                // You can also customize other options such as enlargeCenterPage, enableInfiniteScroll, etc.
              ),
            ),
          ),


          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: TabBar(
              controller: tabController ,
              indicatorColor: Colors.transparent,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.red[400],
              indicatorSize: TabBarIndicatorSize.label,
              onTap: (value){
                setState(() {
                  selectedValue =value;
                });
                tabController.animateTo(value);
              },
              tabs: [
                Container(
                  width: double.infinity,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                      color: selectedValue == 0
                          ? Colors.red[400]
                          : Colors.grey[200],
                          boxShadow: selectedValue == 0?[
                            BoxShadow(
                              color: Colors.red,
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: Offset(0,1),
                            )
                          ] :null
                  ),
                  child: Text('Grocery'),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: selectedValue == 1
                          ? Colors.red[400]
                          : Colors.grey[200],
                    boxShadow: selectedValue == 1?[
                  BoxShadow(
                  color: Colors.red,
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: Offset(0,1),
                  )
                    ] :null
                ),
                  child: Text('Household'),
                  ),
              ],
            ),
          )
        ],
      ) ,
    );
  }
}
