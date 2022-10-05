//1.先設定screen
//2.設定controller取得即時畫面以及操作相機
//3.建立camera隨時回饋
//4.拍照並建立一個路徑來儲存照片
//5.顯示
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:new_fliutter/camera_test/display_picture_screen.dart';

class TakePictureScreen extends StatefulWidget {
  final CameraDescription camera;

  const TakePictureScreen({
    super.key,
    required this.camera,
  });

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuter;

  @override
  void initState(){
    super.initState();
    _controller = CameraController(
        widget.camera,
        ResolutionPreset.medium);
    _initializeControllerFuter = _controller.initialize();//初始化
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Take a picture'),),
      body: FutureBuilder<void>(
        future: _initializeControllerFuter,
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.done){
            return CameraPreview(_controller);
          }else{
            return Center(child: CircularProgressIndicator());
          }
        },
      ),


      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),
        onPressed: () async{
          try{
            await _initializeControllerFuter;

            final path = join(
                (await getTemporaryDirectory()).path,
              '${DateTime.now()}.png',
            );
            await _controller.takePicture();

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DisplayPictureSreen(imagePath: path),
                ),
            );
          }catch(e){
            print(e);
          }
        },
      ),
    );
  }
}












