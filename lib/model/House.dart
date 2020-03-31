
class House {

  int id;
  int numbersOfBeds;
  int numbersOfBathrooms;
  double price;
  double houseSize;
  String location;
  String imageUrl;

  House({this.id, this.numbersOfBeds, this.numbersOfBathrooms,
      this.price, this.houseSize, this.location, this.imageUrl});


  int get Id => id;
  int get NumbersOfBeds => numbersOfBeds;
  int get NumbersOfBathrooms => numbersOfBathrooms;
  double get HouseSize => houseSize;
  double get Price => price;
  String get Location => location;
  String get ImageUrl => imageUrl;


  set Id(int value) => id = value;
  set NumbersOfBeds(int value) => numbersOfBeds = value;
  set NumbersOfBathrooms(int value) => numbersOfBathrooms = value;
  set HouseSize(double value) => houseSize = value;
  set Price(double value) => price = value;
  set Location(String value) => location = value;
  set ImageUrl(String value) => imageUrl = value;



  factory House.fromJson(Map<String, dynamic> json) {
    return House(
        id: json["id"],
        numbersOfBeds: json["numbersOfBeds"],
        numbersOfBathrooms: json["numbersOfBathrooms"],
        houseSize: json["houseSize"],
        price: json["price"],
        location: json["location"],
        imageUrl: json["imageUrl"]);


  }

}
