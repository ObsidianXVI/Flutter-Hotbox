import 'package:flutter/material.dart';

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
              hotboxData: HotboxData<DataX>(
                indexableContent: data,
                rightSectorItems: [],
                lowerSectorItems: [],
                leftSectorItems: [],
              ),
              width: 800,
              height: 500,
              style: const HotboxStyle(backgroundColor: Colors.black),
            ),
            child: const SizedBox(
              width: 900,
              height: 600,
              child: Row(
                children: [
                  WidgetX(data: [
                    DataX('foo1', 1),
                    DataX('foo2', 2),
                    DataX('foo3', 3)
                  ]),
                  SizedBox(width: 20),
                  WidgetX(data: [
                    DataX('A foo', 4),
                    DataX('B foo', 5),
                    DataX('C foo', 6)
                  ]),
                ],
              ),
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

class WidgetX extends StatelessWidget with HotboxIndexable<DataX> {
  final List<DataX> data;

  const WidgetX({
    required this.data,
    super.key,
  });

  @override
  List<DataX> contributions() => data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 200,
        color: Colors.amber,
        child: ListView(
          children: List<Widget>.generate(
            data.length,
            (i) => Container(
              width: 100,
              height: 100,
              child: Center(
                child: Text(data[i].foo),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomHotbox extends Hotbox<DataX> {
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
                      child: Text(hotboxData.indexableContent[i].foo),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
