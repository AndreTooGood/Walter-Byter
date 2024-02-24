import 'package:app/screens/dash_screen.dart';
import 'package:flutter/material.dart';
import 'package:app/screens/home_screen.dart';

import '../main.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin{
  @override
  void initState() {
    super.initState();
    _redirect();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => HomeScreen(),
      ));
    }
    );
  }
  Future<void> _redirect() async{
    await Future.delayed(Duration(seconds: 3));
    final session = supabase.auth.currentSession;
    if(!mounted) return;
    if(session !=null){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => DashScreen(),
      ));
    }else{
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => HomeScreen(),
      ));
    }
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red, Colors.white],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [0.54,1],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
                Icons.shopping_cart_outlined,
              size: 100,
              color: Colors.white,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Wizbuy',
              style: TextStyle(
                fontFamily: 'Popppins',
                color: Colors.white,
                fontSize: 50,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),

    );
  }
}
