
void main() {
  cleanRoom().then((value) => print("rooms are cleaned"),);
  washClothes().then((value) => print("clothes are washed"),);
  washDishes().then((value) => print("dishes are washed"),);
  print("main function is finished");
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
