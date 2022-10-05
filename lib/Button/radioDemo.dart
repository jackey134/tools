import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(TestFulState());

class TestFulState extends StatefulWidget {
  @override
  _TestFulState createState() => _TestFulState();
}

class _TestFulState extends State<TestFulState> {
  var _groupValue = "num";
  var _groupValue2 = "aaa";
  var _selectedIndex = 0;

  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.network('https://youtu.be/tkIASyEV3jQ');
    _videoPlayerController.initialize().then((_) {
      setState() {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("KIM量表檢測")),
        body: Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AspectRatio(
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
                    )),
                Text(
                  "Test1",
                  style: TextStyle(fontSize: 20),
                ),
                Row(
                  children: [
                    Expanded(
                        child: RadioListTile(
                      contentPadding: EdgeInsets.all(0.0),
                      value: "a100",
                      groupValue: _groupValue,
                      tileColor: Colors.deepPurple.shade50,
                      title: Text("N0.1"),
                      onChanged: (value) {
                        setState(() {
                          _groupValue = value!;
                        });
                      },
                    )),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                        child: RadioListTile(
                      contentPadding: EdgeInsets.all(0.0),
                      value: "a200",
                      groupValue: _groupValue,
                      tileColor: Colors.deepPurple.shade50,
                      title: Text("N0.2"),
                      onChanged: (value) {
                        setState(() {
                          _groupValue = value!;
                        });
                      },
                    )),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                        child: RadioListTile(
                      contentPadding: EdgeInsets.all(0.0),
                      value: "a300",
                      groupValue: _groupValue,
                      tileColor: Colors.deepPurple.shade50,
                      title: Text("N0.3"),
                      onChanged: (value) {
                        setState(() {
                          _groupValue = value!;
                        });
                      },
                    ))
                  ],
                ),
                Text(
                  "Test2",
                  style: TextStyle(fontSize: 20),
                ),
                Row(
                  children: [
                    Expanded(
                        child: RadioListTile(
                      contentPadding: EdgeInsets.all(0.0),
                      value: "a",
                      groupValue: _groupValue2,
                      tileColor: Colors.deepPurple.shade50,
                      title: Text("N0.1"),
                      onChanged: (value) {
                        setState(() {
                          _groupValue2 = value!;
                        });
                      },
                    )),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                        child: RadioListTile(
                      contentPadding: EdgeInsets.all(0.0),
                      value: "b",
                      groupValue: _groupValue2,
                      tileColor: Colors.deepPurple.shade50,
                      title: Text("N0.2"),
                      onChanged: (value) {
                        setState(() {
                          _groupValue2 = value!;
                        });
                      },
                    )),
                  ],
                )
              ]),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.face), label: 'Me'),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_taxi), label: 'Taxi'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          ],
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
