
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

  const MediaQueryExp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = const MediaQueryData();
    Size size;
    double height, width, textScale;
    debugPrint("----------------build---------------");
    // getting the size of the window
    mediaQueryData = MediaQuery.of(context);
    size = mediaQueryData.size;
    height = size.height;
    width = size.width;
    textScale = mediaQueryData.textScaleFactor;

    debugPrint("height::$height width::$width textScale::$textScale");

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
    final  x;
    x = 10;
    debugPrint("-------------build---------------$x");
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

class AspectRatioExp extends StatelessWidget {
  const AspectRatioExp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.blue,
      padding: const EdgeInsets.all(8.0),
      child: AspectRatio(
        aspectRatio: 6 / 9,
        child: Container(
          color: Colors.green,
        ),
      ),
    );
  }
}

class FittedBoxExp extends StatelessWidget {
  const FittedBoxExp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fitted Box Exp"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 200,
                width: 500,
                color: Colors.red,
                child: FittedBox(
                  alignment: Alignment.center,
                  fit: BoxFit.fill,
                  child: Image.network(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                ),
              ),

              /// if we add fitted box it will ignore the size of text and try to fit in the parent size
              /// if smaller text size is placed inside a bigger container it will be scale up and ignore the text size
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  width: 300,
                  height: 100,
                  color: Colors.amber,
                  padding: const EdgeInsets.all(8.0),
                  child: const FittedBox(
                    fit:BoxFit.scaleDown,
                    child: Text(
                      "Very Long Text.............",
                      style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class FractionallySizedBoxExp extends StatelessWidget {
  const FractionallySizedBoxExp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fractionally SizedBox Exp"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FractionallySizedBox(
              widthFactor: 0.3,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Press me"),
              ),
            ),
            Container(
              height: 300,
              width: 300,
              color: Colors.amber,
              child: FractionallySizedBox(
                widthFactor: 0.8,
                heightFactor: 0.1,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Click me"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

