part of hotbox;

mixin HotboxIndexing<T> on Widget {
  final List<T> content = [];

  void contribute(T item) => content.add(item);
  void contributeAll(List<T> items) => content.addAll(items);
}
