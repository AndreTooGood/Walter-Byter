import 'package:app/screens/dash_screen.dart';
import 'package:app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:app/screens/home_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{
  await Supabase.initialize(
      url: 'https://slsawibejlqwmtepsvrb.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNsc2F3aWJlamxxd210ZXBzdnJiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDgzNTg5MDMsImV4cCI6MjAyMzkzNDkwM30.oo2H5-tC13Xb8MEYzrCRA85AT0anxh5HKhsFbL6GVcQ'
  );
  runApp(const MyApp());
}
final supabase = Supabase.instance.client;


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  SplashScreen(),

    );
  }
}

