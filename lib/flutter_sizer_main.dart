import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
            title: 'Flutter Sizer Example',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const Home());
      },
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: Adaptive.h(12.5), // or 12.5.h
                width: 50.w, // or Adaptive.w(50)
                color: Colors.blue,
              ),
              Text(
                "Resolution is -> ${100.0.w}x${100.0.h}",
              ),
              Text(
                "This text is responsive 12dp -> ${12.0.dp}",
                style: TextStyle(fontSize: 12.0.dp), // or Adaptive.sp(12)
              ),
              Text(
                "This text is responsive 24dp -> ${24.0.dp}",
                style: TextStyle(fontSize: 24.0.dp), // or Adaptive.sp(12)
              ),
              Device.orientation == Orientation.portrait
                  ? const Text("My Orientation is Portrait")
                  : const Text("My Orientation is Landscape"),
              Device.screenType == ScreenType.tablet
                  ? const Text("My Screen's Type is a Tablet")
                  : const Text("My Screen's Type is a Phone")
            ],
          )),
    );
  }
}