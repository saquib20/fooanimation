import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

void main() {
  runApp(CrossFade());
}

class CrossFade extends StatefulWidget {
  @override
  State<CrossFade> createState() => _CrossFadeState();
}

class _CrossFadeState extends State<CrossFade> {
  bool isFirst = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Timer(Duration(seconds: 4), () {
    //   reload();
    // });
  }

  void reload() {
    setState(() {
      if (isFirst) {
        isFirst = false;
      } else {
        isFirst = true;
      }
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Cross Fade Animation"),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedCrossFade(
                duration: Duration(seconds: 2),
                firstChild: Container(
                  width: 200,
                  height: 200,
                  color: Colors.grey.shade400,
                ),
                secondChild: Image.network(
                  "https://image.api.playstation.com/vulcan/ap/rnd/202106/1704/JzL1NLQvok7Pghe9W5PP2XNV.png",
                  width: 400,
                  height: 400,
                ),
                sizeCurve: Curves.fastOutSlowIn,
                firstCurve: Curves.bounceInOut,
                crossFadeState: isFirst
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
              ),
              ElevatedButton(
                  onPressed: () {
                    reload();
                  },
                  child: Text("Show"))
            ],
          ),
        ),
      ),
    );
  }
}
