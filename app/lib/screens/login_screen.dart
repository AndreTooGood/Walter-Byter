

import 'package:app/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();

  get password => null;
  
  @override
  void dispose(){
    _emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 360,
              width: 360,
              decoration: BoxDecoration(
                  color: Colors.red[400],
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(350),
                  )),
              child: Center(
                child: Text(
                  'Log In    ',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins-Black',
                    fontSize: 64,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 125,
            ),
            SizedBox(
              width: 380,
              height: 65,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 0, top: 0, bottom: 0),
                child: TextField(
                  controller: _emailController,
                  style: TextStyle(
                    color: Colors.red[800],
                    fontFamily: 'Poppins',
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.red[900],
                      ),
                      filled: true,
                      fillColor: Colors.red[200],
                      labelText: 'Username/Email',
                      labelStyle: TextStyle(color: Colors.red[900]),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50))),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 380,
              height: 65,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 0, top: 0, bottom: 0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.red[800],
                    fontFamily: 'Poppins',
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.key,
                        color: Colors.red[900],
                      ),
                      filled: true,
                      fillColor: Colors.red[200],
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.red[900]),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50))),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: ElevatedButton(
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins-SemiBold',
                    fontSize: 22,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.red[600], fixedSize: Size(150, 53)),
                onPressed: () async {
                  try {
                    final email = _emailController.text.trim();
                    await supabase.auth.signInWithPassword(
                        email: email,
                        password: password);
                    await supabase.auth.signInWithOtp(
                      email: email,
                      emailRedirectTo:
                          "io.supabase.flutterquickstart://login-callback/",
                    );
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Check your Inbox'),
                        ),
                      );
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 152,
                ),
                Text('Don\'t have an account?'),
                TextButton(
                  child: Text(
                    'Register Now',
                    style: TextStyle(color: Colors.red[600]),
                  ),
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
            )
          ],
        ),
      ),
    );
  }
}
