import 'dart:ui';

import 'package:flutter/material.dart';

class LayoutBuilderExp extends StatelessWidget {
  const LayoutBuilderExp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("-------------build---------------");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Layout Builder Exp"),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          debugPrint("-------------layout builder---------------");
          debugPrint(
              "height::${constraints.maxHeight} width::${constraints.maxWidth}");
          if (constraints.maxWidth >= 550) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  alignment: Alignment.center,
                  height: constraints.maxHeight * 0.3,
                  margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: const Text(
                    'Left Wide Screen',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  alignment: Alignment.center,
                  height: constraints.maxHeight * 0.3,
                  margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: const Text(
                    'Right Wide Screen',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            );

            // If screen size is < 480
          } else {
            return Container(
              alignment: Alignment.center,
              height: constraints.maxHeight * 0.3,
              margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              decoration: const BoxDecoration(
                color: Colors.cyan,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: const Text(
                'Normal Screen',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class MediaQueryExp extends StatelessWidget {
  var size, height, width, textScale;
  MediaQueryData mediaQueryData = const MediaQueryData();

  MediaQueryExp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("----------------build---------------");
    // getting the size of the window
    mediaQueryData = MediaQuery.of(context);
    size = mediaQueryData.size;
    height = size.height;
    width = size.width;
    textScale = mediaQueryData.textScaleFactor;

    debugPrint("height::$height width::$width");

    debugPrint("${MediaQuery.of(context).textScaleFactor}");

    return Scaffold(
      appBar: AppBar(
        title: const Text("MediaQuery Exp"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        color: Colors.yellow,
        height: height / 2, //half of the height size
        width: width / 2, //half of the width size
        child: Text(
          "Media Query",
          style: TextStyle(fontSize: width * 0.05, color: Colors.black),
        ),
      ),
    );
  }
}

class OrientationBuilderExp extends StatelessWidget {
  const OrientationBuilderExp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("-------------build---------------");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orientation Builder Exp"),
      ),
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          debugPrint("-------------orientation builder---------------");
          return Text(orientation.name);
        },
      ),
    );
  }
}
