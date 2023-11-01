part of hotbox;

class HotboxArea<T> extends StatelessWidget {
  final FocusNode focusNode = FocusNode();

  /// A function that generates a [Hotbox] with the data given by the [HotboxArea]
  final Hotbox Function(List<T> data) hotbox;
  final Widget child;

  HotboxArea({
    required this.hotbox,
    required this.child,
    super.key,
  });

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
  void showHotbox(BuildContext context) {
    final List<T> data = collectHotboxData(context);
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.7),
      builder: (_) => hotbox(data),
    );
  }

  /// A helper function which recursively traverses all the children, and
  /// if they are [HotboxIndexable] for the same type of content, extracts their
  /// content as well. This content can then be encapsulated in a [HotboxData]
  /// object before being passed to the actual [Hotbox] widget.
  List<T> collectHotboxData(BuildContext context) {
    final List<T> content = [];
    void collectData(Element element) {
      final Widget elemWidget = element.widget;
      if (elemWidget is HotboxIndexable<T>) {
        content.addAll(elemWidget.contributions());
      }
      element.visitChildElements(collectData);
    }

    context.visitChildElements(collectData);

    return content;
  }
}
