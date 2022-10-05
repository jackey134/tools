import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String title = "hello my world";
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
          title,
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 50,
            color: Colors.green,
            fontStyle: FontStyle.italic,
          ),
        ),
        Directionality(
            textDirection: TextDirection.ltr,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shadowColor: Colors.amber,
              ),
              child: Icon(Icons.wb_sunny),
              onPressed: (){
                setState(() {
                  title = "Good moring";
                });
              },
            )
          )
        ],
      ),
     );
  }
}