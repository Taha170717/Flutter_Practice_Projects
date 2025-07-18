import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:friviaa/providers/gamepageproviders.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget{
  late final double _deviceheight;
  late final double _devicewidth;
gamepageprovider? _pageProvider;
  @override
  Widget build(BuildContext context) {
     _deviceheight = MediaQuery.of(context).size.height;
    _devicewidth = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(create: (_context)=> gamepageprovider(context: context) ,
      child: _buildUI(),

    );
  }
  Widget _buildUI(){
    return Builder(
      builder:(_context) {
        _pageProvider = _context.watch<gamepageprovider>();
      if (_pageProvider?.questions != null){
        return Scaffold(
          body: SafeArea(child: Container(
            padding: EdgeInsets.symmetric(horizontal: _deviceheight! * 0.05),
            child: _gameui(),
          )),
        );
      }
      else {

      return const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      );

      }
      }

    );
  }

  Widget _gameui(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _questiontext(),
        Column(
          children: [
            _truebutton(),
            SizedBox(height: 10,),
            _falsebutton()
          ],
        )
      ],
    );

  }
  Widget _questiontext (){
    return Text(_pageProvider!.GetCurrentUqestionText()
      ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),);
  }
  Widget _truebutton(){
    return MaterialButton(onPressed: (){},color: Colors.green,minWidth: _devicewidth!*0.8,
    height: _deviceheight!*0.10,
    child: const Text('True',style:
      TextStyle(color: Colors.white,fontSize: 25),

    ),
    );
  }
  Widget _falsebutton(){
    return MaterialButton(onPressed: (){},color: Colors.red,minWidth: _devicewidth!*0.80,
      height: _deviceheight!*0.10,
      child: const Text('False',style:
      TextStyle(color: Colors.white,fontSize: 25),

      ),
    );
  }

}

