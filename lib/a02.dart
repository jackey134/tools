//import 'package:flutter/material.dart';

void main(){
  var V = new Video('Dart Tutorial', 'Happy coding', '2019/9/14', 'https://123', 'https://456');
  print(V.title);
}
class Video {
  late String title; //標題  //因為變數不能為空，所以要補個問號或是late
  String? description; //影片資訊
  var publishTime; //上傳時間
  var thumbnail; //縮圖網址
  var url; //影片網址

  Video(String title, String description, String publishTime, String thumbnail, String url) {
    this.title = title;
    this.description = description;
    this.publishTime = publishTime;
    this.thumbnail = thumbnail;
    this.url = url;
  }

}