part of hotbox;

class HotboxData<T> {
  /// The content, required to be of the same type, that the [HotboxArea] has
  /// access to.
  final List<T> indexableContent;
  final List<Widget> rightSectorItems;
  final List<Widget> lowerSectorItems;
  final List<Widget> leftSectorItems;

  const HotboxData({
    required this.indexableContent,
    required this.rightSectorItems,
    required this.lowerSectorItems,
    required this.leftSectorItems,
  });
}
