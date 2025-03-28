void main() async {
  String fullname = await getDataFromServer();
  print("data is $fullname");
}

Future<String> getDataFromServer() {
  return Future.delayed(Duration(seconds: 2)).then((value) => "Reza Tahmasbi");
}
