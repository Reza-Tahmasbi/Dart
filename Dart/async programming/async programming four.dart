void main() async {
  getDataFromServer()
      .then((fullname) => print("data is $fullname"))
      .catchError((e) {
    print("error is thrown: $e");
  });
}

Future<String> getDataFromServer() {
  return Future.delayed(Duration(seconds: 2))
      .then((value) => throw Exception("async test"));
}
