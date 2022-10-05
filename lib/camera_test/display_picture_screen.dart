//1.先設定screen
//2.設定controller取得即時畫面以及操作相機
//3.建立camera隨時回饋
//4.拍照並建立一個路徑來儲存照片
//5.顯示
import 'dart:io';
import 'package:flutter/material.dart';

class DisplayPictureSreen extends StatelessWidget {
  final String imagePath;
  const DisplayPictureSreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display the Picture')),
      body: Image.file(File(imagePath)),
    );
  }
}
