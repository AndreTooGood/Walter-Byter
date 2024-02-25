import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidingScreen extends StatefulWidget {
  const SlidingScreen({super.key});

  @override
  State<SlidingScreen> createState() => _SlidingScreenState();
}

class _SlidingScreenState extends State<SlidingScreen> {
  final itemList =[
    {
      'title': 'Prices Dropped',
      'desc' : 'All products 100 % off. Get all your stuff today',
    },
    {
      'title': 'Screws In market',
      'desc' : 'All products 100 % off.Get all your stuff today',
    },
    {
      'title': 'Fruits Free',
      'desc' : 'All products 100 % off.Get all your stuff today',
    },
    {
      'title': 'Free',
      'desc' : 'All products 100 % off.Get all your stuff today',
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: itemList.length,
          itemBuilder: (context ,index){
            final item = itemList[index];
            return Padding(
              padding: (index == 0)
                  ?EdgeInsets.symmetric(vertical:10 )
                  : EdgeInsets.only(bottom: 24 ),
              child: Container(
                height: 130,
                width: 220,
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                  boxShadow:
                    [
                      BoxShadow(
                        blurRadius: 1.0,
                        spreadRadius: 1.0,
                        color: Colors.grey[200]!,
                      )
                    ]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item['title']!,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 27,
                      color: Colors.black,
                    ),),
                    SizedBox(
                      height:10 ,
                    ),
                    Text(item['desc']!,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w100,
                        fontSize: 15,
                        color: Colors.grey,
                      ),),
                  ],
                )
              ),
            );
          }),
    );
  }
}

// key: Key('$item'),
// endActionPane: ActionPane(motion: ScrollMotion(),
// children: [
// SlidableAction(onPressed:(context){},
// backgroundColor: Colors.red,
// icon: Icons.delete,
// ),
// ],),
