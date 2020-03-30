import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:houses_app/model/house.dart';

class HousesListPage extends StatefulWidget {
  HousesListPage({Key key}) : super(key: key);

  @override
  _HousesListPageState createState() => _HousesListPageState();
}

class _HousesListPageState extends State<HousesListPage> {
  List<House> _houses;

  @override
  void initState() {
    super.initState();

    if (_houses == null) {
      _houses = List<House>();
      fillHousesWithDummyData();
    }
  }

  void fillHousesWithDummyData() {
    setState(() {
      int j = 1;
      for (int i = 1; i <= 8; i++) {
        j *= i * 10;
        _houses.add(new House.name(
            i, 3, 4, i.toDouble() * j, i.toDouble() * 1000, "Riyadh"));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(_houses.length, (index) {
          return _buildProductItem(context, index);
        }),
      ),
    );
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return Container(
      child: Card(
        child: getHouseInfo(index),
      ),
    );
  }

  getHouseInfo(index) {
    return Container(
      child: Column(
        children: <Widget>[
          getHouseBasicInfo(index),
          Expanded(
            child: getHouseImage(),
          ),
        ],
      ),
    );
  }

  getHouseBasicInfo(index) {
    return Row(
      children: <Widget>[
        getHouseSize(_houses[index].price),
        Column(
          children: <Widget>[
            getHouseLocationInfo(index),
            getHouseSizeInfo(index),
          ],
        ),
        Expanded(
          child: getHouseRoomsInfo(index),
        ),
      ],
    );
  }

  getHouseLocationInfo(index) {
    return Text(_houses[index].location);
  }

  getHouseSizeInfo(index) {
    return Text(
      _houses[index].houseSize.toString() + " sqft",
      style: TextStyle(fontSize: 10),
    );
  }

  getHouseRoomsInfo(index) {
    return Container(
      margin: EdgeInsets.only(left: 50),
      child: Column(
        children: <Widget>[
          getBedroomsInfo(index),
          getBathroomsInfo(index),
        ],
      ),
    );
  }

  getBedroomsInfo(index) {
    return Row(children: <Widget>[
      Icon(
        Icons.airline_seat_individual_suite,
        color: Colors.grey,
        size: 20,
      ),
      Container(
        margin: EdgeInsets.only(left: 4),
        child: Text(
          _houses[index].numbersOfBeds.toString(),
          style: TextStyle(
            fontSize: 14,
          ),
        ),
      ),
    ]);
  }

  getBathroomsInfo(index) {
    return Row(children: <Widget>[
      Icon(
        Icons.home,
        color: Colors.grey,
        size: 20,
      ),
      Container(
        margin: EdgeInsets.only(left: 4),
        child: Text(
          _houses[index].numbersOfBathrooms.toString(),
          style: TextStyle(fontSize: 14),
        ),
      ),
    ]);
  }

  getHouseImage() {
    return Container(
      padding: EdgeInsets.all(8),
      child: Image.network(
        "https://si.wsj.net/public/resources/images/B3-DM067_RIGHTS_IM_20190319162958.jpg",
      ),
    );
  }

  getHouseSize(housePrice) {
    var housePriceFormated = NumberFormat.compact().format(housePrice);
    var priceUnits = housePriceFormated[housePriceFormated.length - 1];

    return Container(
      margin: EdgeInsets.all(8),
      child: CircleAvatar(
        maxRadius: 20,
        backgroundColor: getPriceSizeAvatarColor(priceUnits),
        child: Text(
          "\$$housePriceFormated",
          style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  getPriceSizeAvatarColor(priceUnits) {
    switch (priceUnits) {
      case 'k':
        return Colors.lightBlue[100];
      case 'M':
        return Colors.lightBlue[300];
      case 'B':
        return Colors.lightBlue[600];
      case 'T':
        return Colors.blue[900];
      default:
        return Colors.lightBlue[50];
    }
  }
}
