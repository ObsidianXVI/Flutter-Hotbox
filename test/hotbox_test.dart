import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:hotbox/hotbox.dart';

void main() {
  runApp(SomeApp());
}

class SomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        width: 900,
        height: 600,
        color: Colors.blue,
        child: Align(
          alignment: Alignment.topLeft,
          child: HotboxArea<DataX>(
            hotbox: (data) => CustomHotbox(
              hotboxData: HotboxData(
                indexableContent: data,
                rightSectorItems: [],
                lowerSectorItems: [],
                leftSectorItems: [],
              ),
              width: 800,
              height: 500,
              style: const HotboxStyle(backgroundColor: Colors.black),
            ),
            child: const Row(
              children: [
                WidgetX(data: []),
                WidgetX(data: []),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DataX {
  final String foo;
  final int bar;

  const DataX(this.foo, this.bar);
}

class WidgetX extends StatelessWidget {
  final List<DataX> data;

  const WidgetX({
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 400,
      color: Colors.amber,
      child: Column(
        children: List<Widget>.generate(
          10,
          (i) => Container(
            width: 60,
            height: 30,
            child: Center(
              child: Text(data[i].foo),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomHotbox extends Hotbox {
  const CustomHotbox({
    required super.hotboxData,
    required super.width,
    required super.height,
    required super.style,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width,
        height: height,
        color: style.backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: List<Widget>.generate(
                hotboxData.indexableContent.length,
                (i) => Center(
                      child: Container(
                        width: 200,
                        height: 60,
                        color: Colors.amber,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(hotboxData.indexableContent[i]),
                          ),
                        ),
                      ),
                    )),
          ),
        ),
      ),
    );
  }
}
