import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // 確保外掛程式服務已初始化，以便“availableCameras()”
  // can be called before `runApp()`
  // 可以在“runApp（）”之前調用
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  // 獲取設備上可用相機的清單。
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  // 從可用攝像機清單中獲取特定攝像機。
  final firstCamera = cameras.first;

  runApp(
    MaterialApp(
      theme: ThemeData.dark(),//底板風格為黑
      home: TakePictureScreen(
        // Pass the appropriate camera to the TakePictureScreen widget.
        // 將相應的相機傳遞到「拍攝圖片螢幕」微件。
        camera: firstCamera,
      ),
    ),
  );
}

// A screen that allows users to take a picture using a given camera.
// 允許使用者使用給定相機拍照的螢幕。
class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({super.key, required this.camera,});

  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // 要顯示相機的當前輸出，
    // create a CameraController.
    // 創建CameraController
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      // 從可用攝像機清單中獲取特定攝像機。
      widget.camera,
      // Define the resolution to use.
      // 定義要使用的解析度。
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    // 接下來，初始化控制器。這就返回了一個"Future"。
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    // 在釋放小部件時釋放控制器。
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Take a picture')),
      // You must wait until the controller is initialized before displaying the
      // 您必須等到控制器初始化後再顯示
      // camera preview. Use a FutureBuilder to display a loading spinner until the
      // 相機預覽。使用 FutureBuilder 顯示載入微調器，直到
      // controller has finished initializing.
      // controller(控制器)已完成初始化。
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            // 如果「Future」已完成，則顯示預覽。
            return CameraPreview(_controller);
          } else {
            // Otherwise, display a loading indicator.
            // 否則，顯示載入指示器。
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        // Provide an onPressed callback.
        // 提供 onPressed 回傳。
        onPressed: () async {
          // Take the Picture in a try / catch block. If anything goes wrong,
          // 在嘗試/捕獲塊中拍攝圖片。如果出現任何問題，
          // catch the error.
          try {
            // Ensure that the camera is initialized.
            // 確保相機已初始化。
            await _initializeControllerFuture;

            // Attempt to take a picture and get the file `image`
            // 嘗試拍照並獲取檔“image”
            // where it was saved.
            // 保存位置。
            final image = await _controller.takePicture();

            if (!mounted) return;

            // If the picture was taken, display it on a new screen.
            // 如果照片已拍攝，請將其顯示在新螢幕上。
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(
                  // Pass the automatically generated path to
                  // 將自動生成的路徑傳遞給
                  // the DisplayPictureScreen widget.
                  // 顯示 DisplayPictureScreen 「構件」。
                  imagePath: image.path,
                ),
              ),
            );
          } catch (e) {
            // If an error occurs, log the error to the console.
            // 假如有錯誤就顯示出來
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

// A widget that displays the picture taken by the user.
// 顯示用戶拍攝的照片的小部件。
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // 圖像作為檔案存儲在設備上。使用"Image.file"`。
      // constructor with the given path to display the image.
      // 具有給定路徑以顯示圖像的建構子。
      body: Image.file(File(imagePath)),
    );
  }
}