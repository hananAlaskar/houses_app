import 'package:flutter/material.dart';
import 'package:houses_app/model/house.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<House> _houses ;

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
        for (int i = 0 ; i < 40 ; i++) {
          _houses.add(new House.name(
              i, 3, 4, i.toDouble() * 1000, i.toDouble() * 99, "Riyadh"));
        }
      });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("House App"),
      ),
      body:
      ListView.builder(
        itemCount: _houses.length,
        itemBuilder: _buildProductItem,
      ),
    );
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: getHouseSize(_houses[index].houseSize),
            trailing: Image.network("https://si.wsj.net/public/resources/images/B3-DM067_RIGHTS_IM_20190319162958.jpg"),
            title: Text(_houses[index].location),
            subtitle:Text(_houses[index].price.toString()),

          )
        ],
      ),
    );
  }

  getHouseSize(houseSize){

    return CircleAvatar(
      backgroundColor: Colors.purple.shade800,
      child: Text(houseSize.toString(), style: TextStyle(fontSize: 8),),

    );
  }

}
