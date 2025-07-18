import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  double _buttonradius = 100;

  final Tween<double> _backgroundScale = Tween<double>(begin: 0, end: 3.2);
  AnimationController? _starIconAnimationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _starIconAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );
    _starIconAnimationController!.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            _pagebackground(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _circularAnimationbtn(),
                _starIconAnimation()
              ],
            ),
          ],
        ));
  }

  Widget _pagebackground() {
    return TweenAnimationBuilder(
      tween: _backgroundScale,
      duration: Duration(seconds: 2),
      builder: (context, scale,child){
      return Transform.rotate(angle: scale,child: child,);
    },
      child: Container(
      color: Colors.green,
    ),);
  }

  Widget _starIconAnimation() {
    return AnimatedBuilder(
      animation: _starIconAnimationController!,
      builder: (_buildContext, _child) {
        return Transform.rotate(
          angle: _starIconAnimationController!.value * 2 * 3.1416,
          child: _child,
        );
      },
      child: Icon(
        Icons.star,
        size: 100,
        color: Colors.white,
      ),
    );
  }


  Widget _circularAnimationbtn() {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _buttonradius = _buttonradius == 100 ? 200 : 100;
          });
        },
        child: AnimatedContainer(
          curve: Curves.bounceIn,
          duration: Duration(seconds: 3),
          height: _buttonradius,
          width: _buttonradius,
          decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(_buttonradius)),
          child: Center(child: Text('Hellow')),
        ),
      ),
    );
  }
}
