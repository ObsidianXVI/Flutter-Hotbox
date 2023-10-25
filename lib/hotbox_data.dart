part of hotbox;

class HotboxData<T> {
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
