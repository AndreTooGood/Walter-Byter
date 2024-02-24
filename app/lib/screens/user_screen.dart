import 'package:app/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../main.dart';

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
        title: Text('ACC'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            child: Text(
              'Logout',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins-SemiBold',
                fontSize: 22,
              ),
            ),
            style: ElevatedButton.styleFrom(
                primary: Colors.red[600], fixedSize: Size(150, 53)),
            onPressed: () async{
              try{
                await supabase.auth.signOut();
                if(mounted){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Signed out'),),);
                  print("mmmmmmmmmmmdkkdddddddddd");
                }
              } on AuthException catch(error){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(error.message),
                    backgroundColor: Theme.of(context).colorScheme.error,),);
              }catch(error){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Error occured, please retry'),
                    backgroundColor: Theme.of(context).colorScheme.error,),);
              }
            },
          ),
        ],
      ),
    );
  }
}
