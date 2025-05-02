import 'dart:async';

void main() async {
  final Stream<int> stream = numerCreator();

  // listener method one
  await for (final event in stream) {
    print(event);
  }
  // listener method two
  stream.listen((event) {
    print(event);
  });

  // listener method three
  final Stream<int> stream2 = NumberCreator().streamController.stream.where((event) => event % 2 == 0);
  await for (final event in stream2) {
    print(event);
  }
} 

// streamer one
Stream<int> numerCreator() async* {
  int value = 1;
  while (true) {
    yield value++;
    await Future.delayed(const Duration(seconds: 1));
  }
}

// streamer two
class NumberCreator {
  final StreamController<int> streamController = StreamController();
  Stream<int> get stream => streamController.stream;
  int value = 1;
  NumberCreator() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (value < 5) {
        streamController.add(value++);
      } else {
        streamController.close();
        timer.cancel();
        return;
      }
      streamController.add(value++);
    });
  }
}
