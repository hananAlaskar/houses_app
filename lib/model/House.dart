class House{

  int _id;
  int _numbersOfBeds;
  int _numbersOfBathrooms;
  double _price;
  double _houseSize;
  String _location;

  House.name(this._id, this._numbersOfBeds, this._numbersOfBathrooms,
      this._price, this._houseSize, this._location);

  String get location => _location;

  set location(String value)  => _location = value;


  double get houseSize => _houseSize;

  set houseSize(double value) => _houseSize = value;


  double get price => _price;

  set price(double value) => _price = value;


  int get numbersOfBathrooms => _numbersOfBathrooms;

  set numbersOfBathrooms(int value) => _numbersOfBathrooms = value;


  int get numbersOfBeds => _numbersOfBeds;

  set numbersOfBeds(int value) =>_numbersOfBeds = value;


  int get id => _id;

  set id(int value) =>_id = value;



}