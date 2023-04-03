import 'package:flutter/material.dart';

class DemoUI extends StatelessWidget {
  const DemoUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Title..."),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          color: Colors.amber,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          RowWiseData(title: "Name of the employee",subTitle: "Mandar",),
                          RowWiseData(title: "Date of Birth",subTitle: "00/00/0000",),
                          RowWiseData(title: "Pan No.",subTitle: "ERPS123123",),
                          RowWiseData(title: "Aadhar No. ",subTitle: "QWDasda12w123",),
                          RowWiseData(title: "Address",subTitle: "Mandar wdwd wefwskfhjwe wefxjkwgmf Mandar wdwd wefwskfhjwe wefxjkwgmf Mandar wdwd wefwskfhjwe wefxjkwgmf Mandar wdwd wefwskfhjwe wefxjkwgmf",),
                        ],
                      ),
                    ),
                    Container(
                      height: height * 0.3,
                      width: height * 0.3,
                      color: Colors.blue,
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class RowWiseData extends StatelessWidget {
  final String title;
  final String subTitle;
  const RowWiseData({Key? key, required this.title, required this.subTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Expanded(
                flex: 1,
                child: Text(title)),
            const Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Text(":"),
            ),
            Expanded(
                flex: 4,
                child: Text(subTitle)),
          ],
        ),
      ),
    );
  }
}
