void main() async {
  cleanRoom().then((value) => print("rooms are cleaned"),);
  await washClothes();
  print("clothes are washed");
  await washDishes();
  print("dishes are washed");
}

Future<void> cleanRoom() {
  print("clean the room");
  return Future.delayed(Duration(seconds: 3));
}

Future<void> washClothes() {
  print("wash the clothes");
  return Future.delayed(Duration(seconds: 2));
}

Future<void> washDishes() {
  print("wash the dishes");
  return Future.delayed(Duration(seconds: 4));
}
