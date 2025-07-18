import 'package:flutter/material.dart';

import '../widgets/custom_dropdown.dart';

class HomePage extends StatelessWidget {
  late double _devheight, _devwidth;

  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    _devheight = MediaQuery.of(context).size.height;
    _devwidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
            child: Container(
      height: _devheight,
      width: _devwidth,
      padding: EdgeInsets.symmetric(horizontal: _devheight * 0.05),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _pagetitle(),
              _bookrideWidget()
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: _astroImage(),
          )
        ],
      )
    )));
  }

  Widget _pagetitle() {
    return Text(
      "#GoMoon",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 70,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  Widget _astroImage() {
    return Container(
      height: _devheight *0.6,
      width: _devwidth*0.65,

      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/images/astro_moon.png"),
        fit: BoxFit.fill,
      )),
    );
  }

  Widget _bookrideWidget(){
    return  Container(
      height: _devheight * 0.25,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _dropDown(),
          _travellersInformation(),
          _bookButton()
        ],
      ),

    );
  }
  Widget _dropDown() {
    return CustomDropDownButtonClass(
      values: const [
        'James Webb Station',
        'Preneure Station',
      ],
      width: _devwidth,
    );
  }

  Widget _travellersInformation (){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomDropDownButtonClass(values: ['1','2','3','4','5'] ,width: _devwidth*0.45),
     CustomDropDownButtonClass(values: [
    'Economy',
    'AC',
    'Business'
    ] ,width: _devwidth*0.40),
      ],
    );
  }
  Widget _bookButton(){
    return Container(
      padding: EdgeInsets.all(10),
      width: _devwidth*0.5,
      child: MaterialButton(onPressed: (){},
        color: Colors.white,
      child: Text("Book Ride",style: TextStyle(
        color: Colors.black
      ),),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          
      ),
      ),

    );
  }


}
