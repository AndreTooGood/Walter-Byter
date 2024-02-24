import 'package:app/screens/cart_screen.dart';
import 'package:app/screens/category_screen.dart';
import 'package:app/screens/landing_screen.dart';
import 'package:app/screens/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({super.key});

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  int currentIndex = 0;

  final pageController = PageController(initialPage: 0);
  final tabBarIcons = [
    FontAwesomeIcons.house,
    FontAwesomeIcons.compass,
    FontAwesomeIcons.cartShopping,
    FontAwesomeIcons.user,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      bottom: false,
      child: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            children: const [
              LandingScreen(),
              CategoryScreen(),
              CartScreen(),
              UserScreen()
            ],
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Container(
              alignment: Alignment.center,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...tabBarIcons.map(
                    (icon) => IconButton(
                      onPressed: () {
                        if (icon == FontAwesomeIcons.house) {
                          pageController.jumpToPage(0);
                        } else {
                          if (icon == FontAwesomeIcons.compass) {
                            pageController.jumpToPage(1);
                          } else {
                            if (icon == FontAwesomeIcons.cartShopping) {
                              pageController.jumpToPage(2);
                            } else {
                              if (icon == FontAwesomeIcons.user) {
                                pageController.jumpToPage(3);
                              }
                            }
                          }
                        }

                      },
                      icon: Icon(
                        icon,
                        color: Colors.red[600],
                        size: 27,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
