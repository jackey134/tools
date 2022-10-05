//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final title = "hello scaffold";

  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Scaffold Demo",
            style: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
          ),
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.add_circle),
                onPressed: (){},
            ),
            IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: (){},
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: const <Widget>[
              DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
               child: Text(
                 "Drawer Header",
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 24,
                 ),
               ),
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text("Message"),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text("Profile"),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          //這邊網路上全部都文字寫成title，已經改成label了
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.face),label: "Me"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_taxi),label: "Taxi"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.home),label: "Home"
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        body: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 50,
              color: Colors.orange,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.thumb_up),
          label: const Text("Like"),
          backgroundColor: Colors.orange,
          onPressed: (){},
        ),
      ),//Container是容器的意思
    );

  }
}
