import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  return runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(
        'https://youtu.be/tkIASyEV3jQ');
    _videoPlayerController.initialize().then((_) {
      setState() {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Video Demo'),
        ),
        body: AspectRatio(
            aspectRatio: 1280 / 720,
            child: Stack(
              children: <Widget>[
                VideoPlayer(_videoPlayerController),
                Positioned(
                  bottom: 0,
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        child: Icon(Icons.play_arrow,
                            size: 20.0, color: Colors.white),
                        onTap: () {
                          setState(() {
                            _videoPlayerController.play();
                          });
                        },
                      ),
                      GestureDetector(
                        child: Icon(Icons.pause,
                            size: 20.0, color: Colors.white),
                        onTap: () {
                          setState(() {
                            _videoPlayerController.pause();
                          });
                        },
                      )
                    ],
                  ),
                )
              ],
            )));
  }
}
