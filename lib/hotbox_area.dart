part of hotbox;

class HotboxArea<T> extends StatelessWidget {
  final FocusNode focusNode = FocusNode();
  final Widget child;

  HotboxArea({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      autofocus: true,
      focusNode: focusNode,
      onKeyEvent: (KeyEvent event) {
        if (event is KeyDownEvent) {
          if (event.logicalKey == LogicalKeyboardKey.space) {
            showHotbox(context);
          }
        }
      },
      child: child,
    );
  }

  /// An out-of-the-box (no pun intended) function to display a [Hotbox]
  ///
  /// Override this function in the subclass to display in your own style instead.
  void showHotbox(
    BuildContext context, {
    List<Widget> rightSectorItems = const [],
    List<Widget> lowerSectorItems = const [],
    List<Widget> leftSectorItems = const [],
  }) {
    showDialog(
        context: context,
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.7),
        builder: (buildContext) {
          return Hotbox(
            hotboxData: HotboxData<T>(
              indexableContent: collectHotboxData(context),
              rightSectorItems: rightSectorItems,
              lowerSectorItems: lowerSectorItems,
              leftSectorItems: leftSectorItems,
            ),
          );
        });
  }

  /// A helper function which recursively traverses all the children, and
  /// if they have [HotboxIndexing] for the same type of content, extracts their
  /// content as well. This content can then be encapsulated in a [HotboxData]
  /// object before being passed to the actual [Hotbox] widget.
  List<T> collectHotboxData<T>(BuildContext context) {
    final List<T> content = [];
    void collectData(Element element) {
      final Widget elemWidget = element.widget;
      if (elemWidget is HotboxIndexing<T>) {
        content.addAll(elemWidget.content);
        element.visitChildElements(collectData);
      }
    }

    context.visitChildElements(collectData);

    return content;
  }
}
