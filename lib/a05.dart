import 'package:flutter/material.dart';
import 'package:new_fliutter/main.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("我是第一個程式!"),
        ),
        body: HomePage(), //body這邊盡量都劃分出去多寫個class 主要的畫面寫在 body
      )
    );
  }
}
class HomePage extends StatelessWidget {
  //const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("hi!"),
    );
  }
}


