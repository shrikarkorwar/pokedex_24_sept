import 'package:flutter/material.dart';

class RotatingImageWidget extends StatefulWidget {
  const RotatingImageWidget({super.key});

  @override
  State<RotatingImageWidget> createState() => _RotatingImageWidgetState();
}

class _RotatingImageWidgetState extends State<RotatingImageWidget> with SingleTickerProviderStateMixin {
   late AnimationController _controller;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this,duration: const Duration(seconds: 3))..repeat();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: _controller, builder: (context, child) {
      return Transform.rotate(angle: _controller.value*2*3.14,child: Image.asset('images/pokeball.png',width: 250,));
    },);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
    
  }
}