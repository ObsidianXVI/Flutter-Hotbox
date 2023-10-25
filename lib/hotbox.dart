library hotbox;

import 'package:flutter/material.dart';

part './hotbox_indexing.dart';
part './hotbox_area.dart';
part './hotbox_data.dart';

class Hotbox extends StatelessWidget {
  final HotboxData hotboxData;

  const Hotbox({
    required this.hotboxData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 352,
        height: 352,
        color: Colors.red,
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
