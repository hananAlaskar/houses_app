import 'package:flutter/material.dart';
import 'package:houses_app/model/House.dart';
import 'package:houses_app/model/HousesAPI.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';


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
      getHousesData();
    }
  }

  void getHousesData() async {
    List<House> houses = await HousesAPI().getHouses();
    print(houses.length);
    setState(() {
    _houses = houses;
    });
    print(_houses.length);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      GridView.count(
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
            child: getHouseImage(index),
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
    var houseSizeFormated = NumberFormat.compact().format( _houses[index].houseSize);
    return Text(
      houseSizeFormated + " sqft",
      style: TextStyle(fontSize: 10),
    );
  }

  getHouseRoomsInfo(index) {
    return Container(
      margin: EdgeInsets.only(left: 18),
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
      Container(
        height: 20,
        width: 20,
        child:
      SvgPicture.asset("icons/bathroom_ic.svg", color: Colors.grey,),),
      Container(
        margin: EdgeInsets.only(left: 4),
        child: Text(
          _houses[index].numbersOfBathrooms.toString(),
          style: TextStyle(fontSize: 14),
        ),
      ),
    ]);
  }

  getHouseImage(index) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Image.network(
      _houses[index].imageUrl,
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
