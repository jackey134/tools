//1.先設定screen
//2.設定controller取得即時畫面以及操作相機
//3.建立camera隨時回饋
//4.拍照並建立一個路徑來儲存照片
//5.顯示
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:new_fliutter/camera_test/take_picture_ctroller.dart';

void main(){
  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: Screen(),
    ),
  );
}
class Screen extends StatelessWidget {
  void pushToCamera(BuildContext context) async{
    final cameras = await availableCameras();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TakePictureScreen(camera: cameras.first),
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("camera test"),
      ),
        floatingActionButton: FloatingActionButton(
          child: Text("Take a picture."),
          onPressed: (){
            this.pushToCamera(context);
          }
        ),
    );
  }
}
