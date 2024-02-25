import 'package:app/screens/dash_screen.dart';
import 'package:app/screens/home_screen.dart';
import 'package:app/screens/landing_screen.dart';
import 'package:app/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../main.dart';
import '../widgets/menu_widget.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => DashScreen()),
                (route) => false);
          },
          icon: Icon(FontAwesomeIcons.angleLeft),
        ),
        title: Center(
          child: Text(
            'Profile      ',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 27,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              SizedBox(
                height: 150,
                width: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(150),
                  child: Image.asset(
                    'assets/per.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Arun Sanyal',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'arunsanyals@gmail.com',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: 150,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[200],
                      side: BorderSide.none,
                      shape: StadiumBorder()),
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(color: Colors.red[900]),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              MenuWidget(
                title: 'Settings',
                icon: FontAwesomeIcons.cog,
                onPress: () {},
              ),
              SizedBox(
                height: 10,
              ),
              MenuWidget(
                title: 'Billing Details',
                icon: FontAwesomeIcons.wallet,
                onPress: () {},
              ),
              SizedBox(
                height: 10,
              ),
              MenuWidget(
                title: 'Order History',
                icon: FontAwesomeIcons.cartShopping,
                onPress: () {},
              ),
              SizedBox(
                height: 10,
              ),
              MenuWidget(
                title: 'Information',
                icon: FontAwesomeIcons.info,
                onPress: () {},
              ),
              SizedBox(
                height: 10,
              ),
              MenuWidget(
                title: 'Sign Out',
                icon: FontAwesomeIcons.signOut,
                textColor: Colors.red,
                endIcon: false,
                onPress: () async {
                  try {
                    await supabase.auth.signOut();
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Signed out'),
                        ),
                      );
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                          (route) => false);
                    }
                  } on AuthException catch (error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(error.message),
                        backgroundColor: Theme.of(context).colorScheme.error,
                      ),
                    );
                  } catch (error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Error occured, please retry'),
                        backgroundColor: Theme.of(context).colorScheme.error,
                      ),
                    );
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


