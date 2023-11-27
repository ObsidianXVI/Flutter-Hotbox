part of hotbox;

class HotboxData<T> {
  /// The content, required to be of the same type, that the [HotboxArea] has
  /// access to.
  final List<T> indexableContent;
  final Widget rightSector;
  final Widget lowerSector;
  final Widget leftSector;

  const HotboxData({
    required this.indexableContent,
    required this.rightSector,
    required this.lowerSector,
    required this.leftSector,
  });
}
