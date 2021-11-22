import 'dart:async';

class CounterBLoc {
  int _counter = 0;
  final _streamController = StreamController<int>();

  Stream<int> get stream_counter => _streamController.stream;

  void addCount() {
    _streamController.sink.add(++_counter);
  }
  void dispose() {
    _streamController.close();
  }
}