import 'dart:async';

import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'dash_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool passwordVisible = false;
  final _emailController = TextEditingController();
  late final StreamSubscription<AuthState> _authSubcription;

  @override
  void dispose() {
    _emailController.dispose();
    _authSubcription.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
    _authSubcription = supabase.auth.onAuthStateChange.listen((event) {
      final session = event.session;
      if (session != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => DashScreen(),
          ),
        );
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 360,
                width: 360,
                decoration: BoxDecoration(
                  color: Colors.red[400],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(350),
                  ),
                ),
                child: Center(
                  child: Text(
                    '    Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins-Black',
                      fontSize: 64,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
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
                    left: 20, right: 15, top: 0, bottom: 0),
                child: TextField(
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
                    labelText: 'Username',
                    labelStyle: TextStyle(color: Colors.red[900]),
                    suffixIcon: IconButton(
                      icon: Icon(passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        passwordVisible = !passwordVisible;
                      },
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    alignLabelWithHint: false,
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              width: 380,
              height: 65,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 15, top: 0, bottom: 0),
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
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.red[900]),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50))),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              width: 380,
              height: 65,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 15, top: 0, bottom: 0),
                child: TextField(
                  obscureText: passwordVisible,
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
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.red[900]),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50))),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              width: 380,
              height: 65,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 15, top: 0, bottom: 0),
                child: TextField(
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
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(color: Colors.red[900]),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50))),
                ),
              ),
            ),
            SizedBox(
              height: 25,
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
                    await supabase.auth.signInWithOtp(
                        email: email,
                        emailRedirectTo:
                            "io.supabase.flutterquickstart://login-callback/");
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
                  height: 88,
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
