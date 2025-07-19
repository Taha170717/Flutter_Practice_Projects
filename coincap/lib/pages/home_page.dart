import 'dart:convert';

import 'package:coincap/pages/detail_page.dart';
import 'package:coincap/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  late final AnimationController _controller;
  String? _selectedCoin = "bitcoin";
  double? _deviceHeight,_deviceWidth;
  HttpService? _http;
  @override
  void initState() {
    super.initState();
    _http = GetIt.instance.get<HttpService>();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }
  @override
  Widget build(BuildContext context) {
    _deviceHeight=  MediaQuery.of(context).size.height;
    _deviceWidth= MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coin Cap' ,style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: SafeArea(child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _selectCoin(),
            _dataWidget(),
          ],
        ),
      )),
    );
  }
  Widget _selectCoin(){
    List<String> _coins = ["bitcoin", "ethereum", "litecoin", "ripple", "cardano", "polkadot", "chainlink", "stellar", "dogecoin", "solana", "avalanche"];
    List<DropdownMenuItem<String>> _items = _coins.map((String item) {
      return DropdownMenuItem<String>(
        value: item,
        child: Text(item, style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w300,
        ),),
      );
    }).toList();
    return DropdownButton(
      value:_selectedCoin,
        items: _items,
        onChanged: (dynamic _value){
        setState(() {
          _selectedCoin =_value;
        });
        },
    dropdownColor: Colors.orange,
      iconSize: 30,
      icon: Icon(
        Icons.arrow_drop_down_circle_outlined,
        color: Colors.white,
      ),
      underline:
      Container(
        height: 2,
        color: Colors.white,
      ),
    );
  }

  Widget _dataWidget (){
    return FutureBuilder(
        future: _http!.get("/coins/$_selectedCoin"),
        builder: (BuildContext _Context, AsyncSnapshot _snapshot){
          if (_snapshot.hasData){
            Map _data= jsonDecode(_snapshot.data.toString());
            num _usdPrint = _data["market_data"]["current_price"]["usd"];
            num _change = _data["market_data"]["price_change_percentage_24h"];
            String _imgURL = _data["image"]["large"];
            String _description = _data["description"]["en"];
            Map _marketData = _data["market_data"]["current_price"];

            return Column(

            children: [
              GestureDetector(child: _coinImage(_imgURL),
              onDoubleTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(Rates: _marketData)));


            }
              ),
              _currentprice(_usdPrint),
              _percentageChange(_change),
              _decriptioncoin(_description)
              
            ],

            );
          }

            else{
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.orange,
                  strokeWidth: 2.0,
                ),
              );
          }

          }

    );
  }
  Widget _currentprice (num _price){
    return Text("${_price.toStringAsFixed(2)} USD",
      style: TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.w300,
      ),);
  }

  Widget _percentageChange(num _change){
    return Text("${_change.toString()}%",
      style: TextStyle(
        color: _change < 0 ? Colors.red : Colors.green,
        fontSize: 15,
        fontWeight: FontWeight.w300,
      ),);
  }
  Widget _coinImage(String _imgURL) {
    return SizedBox(
      height: _deviceHeight! * 0.15,
      width: _deviceWidth! * 0.15,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.rotate(
            angle: _controller.value * 2 * 3.1415926535,
            child: child,
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: _deviceHeight! * 0.02),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(_imgURL),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
  Widget _decriptioncoin (String _description) {
    return SingleChildScrollView(

      child: Container(
        height: _deviceHeight! * 0.45,
        width: _deviceWidth! * 0.9,
        margin: EdgeInsets.symmetric(vertical: _deviceHeight! * 0.05),
        padding: EdgeInsets.symmetric(vertical: _deviceHeight! * 0.01,
        horizontal: _deviceWidth! * 0.05),
        color: Colors.orange,
        child: Text(
          _description,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w300,
          ),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}

