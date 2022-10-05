//image_picker==>這個插件可以拿來"拍照"功能 https://pub.dev/packages/image_picker
//camera ==>使用鏡頭來做不只拍照功能的插件(QRcode) https://pub.dev/packages/camera
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Camera Image Picker",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => new MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  File? image;

  Future getImage() async {
    var picture = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      image = File(picture!.path);
      //這裡的意思是30行定義image為File型態
      // 可是32行的picture為XFile?型態
      // 所以要在30給?後 再34寫成"假如不是XFile型態的話"
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Take a Picture"),
      ),
      drawer: Text("this is the drawer"),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: "Pick Image",
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
