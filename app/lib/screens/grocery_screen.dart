import 'package:app/screens/category_screen.dart';
import 'package:flutter/material.dart';

class GroceyScreen extends StatefulWidget {
  const GroceyScreen({super.key});

  @override
  State<GroceyScreen> createState() => _GroceyScreenState();
}

class _GroceyScreenState extends State<GroceyScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 180,
               width: 180,
                child: IconButton(
                  onPressed: () {},
                  icon: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/bakery.png',
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
                          child: Center(
                            child: Text(
                              'Bakery',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins-Black',
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 180,
                width: 180,
                child: IconButton(
                  onPressed: () {},
                  icon: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/fruits.png',
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
                          child: Center(
                            child: Text(
                              'Fruits',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins-Black',
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 180,
              width: 180,
              child: IconButton(
                onPressed: () {},
                icon: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/vegetables.png',
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
                        child: Center(
                          child: Text(
                            'Veg',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Poppins-Black',
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 180,
              width: 180,
              child: IconButton(
                onPressed: () {},
                icon: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/Diary.png',
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
                        child: Center(
                          child: Text(
                            'Diary',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Poppins-Black',
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],),
        // TextButton(onPressed: (){
        //   Navigator.of(context).pushReplacement(MaterialPageRoute(
        //       builder: (_) => CategoryScreen(),
        //   ));
        // },
        //     child: Text('View all'))
      ],
    );
  }
}
