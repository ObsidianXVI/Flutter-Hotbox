library hotbox;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part './hotbox_indexing.dart';
part './hotbox_area.dart';
part './hotbox_data.dart';

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

  const HotboxStyle({
    required this.backgroundColor,
  });
}
