library hotbox;

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part './hotbox_indexing.dart';
part './hotbox_area.dart';
part './hotbox_data.dart';
part './pie.dart';

abstract class Hotbox<T> extends StatelessWidget {
  final HotboxData<T> hotboxData;
  final double width;
  final double height;
  final HotboxStyle style;

  const Hotbox({
    required this.hotboxData,
    required this.width,
    required this.height,
    required this.style,
    super.key,
  });

  @override
  Widget build(BuildContext context);
}

class HotboxStyle {
  final Color backgroundColor;
  final Color pieColor;

  const HotboxStyle({
    required this.backgroundColor,
    required this.pieColor,
  });
}

class DefaultHotbox<T> extends Hotbox<T> {
  const DefaultHotbox({
    required super.hotboxData,
    required super.width,
    required super.height,
    required super.style,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Positioned.fill(
            child: Center(
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: style.pieColor,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: style.backgroundColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Left
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: width - 80,
              height: height,
              child: Align(
                alignment: Alignment.centerRight,
                child: hotboxData.leftSector,
              ),
            ),
          ),
          // Right
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              width: width - 80,
              height: height,
              child: Align(
                alignment: Alignment.centerLeft,
                child: hotboxData.rightSector,
              ),
            ),
          ),
          // Lower
          Positioned(
            left: 0,
            bottom: 0,
            child: Container(
              width: width,
              height: height - 80,
              child: Align(
                alignment: Alignment.topCenter,
                child: hotboxData.lowerSector,
              ),
            ),
          ),
          // Upper
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: width,
              height: height - 80,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
