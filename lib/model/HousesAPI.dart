import 'dart:async';
import 'dart:convert';
import 'package:houses_app/model/House.dart';
import 'package:houses_app/utility/Network.dart';

const String housesAPIURL =  "http://463565af-5a55-4afb-87aa-6435c76e3c4e.mock.pstmn.io/getHouses";

class HousesAPI {

  Future<List<House>> getHouses() async {

    List<House> list;

    Network network = Network(housesAPIURL);
    var catData = await network.getData();

    var data = json.decode(catData);
    var rest = data["houses"] as List;
    print(rest);
    list = rest.map<House>((json) => House.fromJson(json)).toList();
    return list;
  }



}