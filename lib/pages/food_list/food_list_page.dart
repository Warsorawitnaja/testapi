import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testapi/models/api_result.dart';
import 'package:testapi/models/food_item.dart';
import 'package:testapi/services/api.dart';

class FoodListPage extends StatefulWidget {
  const FoodListPage({Key? key}) : super(key: key);

  @override
  _FoodListPageState createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  List<FoodItem>? _foodList;
  var _isLoading = false;
  String? _errMessage;

  @override
  void initState() {
    super.initState();
    _fetchFoodData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FOOD LIST')),
      body: Column(
        children: [
          /*
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _handleClickButton,
              child: const Text('GET FOOD DATA'),
            ),
          ),
           */
          Expanded(
            child: Stack(
              children: [
                if (_foodList != null)
                  ListView.builder(
                    itemBuilder: _buildListItem,
                    itemCount: _foodList!.length,
                  ),
                if (_isLoading)
                  const Center(child: CircularProgressIndicator()),
                if(_errMessage != null && !_isLoading)
                  Center(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.all(24.0),
                        child: Text(_errMessage!),),
                      ElevatedButton(
                        onPressed: () {
                          _fetchFoodData();
                        },
                        child: Text("RETRY"),),
                    ],
                  )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _fetchFoodData() async {
    setState(() {
      //_foodList = null;
      _isLoading = true;
    });
   try{
     var data = await Api().fetch('foods');
     setState(() {
       _foodList = data.map<FoodItem>((item) => FoodItem.fromJson(item)).toList();
       _isLoading = false;
     });
   }
   catch(e){
     setState(() {
       _errMessage = e.toString();
       _isLoading = false;
     });
   }
  }

  Widget _buildListItem(BuildContext context, int index) {
    var foodItem = _foodList![index];

    return Card(
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Image.network(
              foodItem.image,
              width: 80.0,
              height: 80.0,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 8.0),
            Text(foodItem.name),
          ],
        ),
      ),
    );
  }
}