import 'package:app/screens/login_screen.dart';
import 'package:app/screens/register_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.red[400],
      body: Column(
        children: [
          SizedBox(
            height: 130,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Hello,',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 60,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Welcome to the solution to all your shopping problems',
                style: TextStyle(
                  fontFamily: 'Poppins-Regular',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 180,
          ),
          Column(
            children: [
              Icon(
                Icons.shopping_cart_outlined,
                size: 100,
                color: Colors.white,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.329,
                  width: 900,
                  decoration: BoxDecoration(
                    color: Colors.red[200],
                    borderRadius: BorderRadius.vertical(
                      top: Radius.elliptical(
                          MediaQuery.of(context).size.width, 280),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins-SemiBold',
                            fontSize: 22,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red[400], fixedSize: Size(181, 60)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.red[400],
                            fontFamily: 'Poppins-SemiBold',
                            fontSize: 22,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white, fixedSize: Size(181, 60)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
