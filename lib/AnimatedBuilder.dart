import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedBuilderExample extends StatefulWidget
{
  @override
  _AnimatedBuilderExampleState createState() => _AnimatedBuilderExampleState();
}

class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample> with TickerProviderStateMixin
{
  AnimationController? _animationController;

  @override
  void initState()
  {
    //Initialize animation controller
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 3))..repeat();
    super.initState();
  }

  @override
  void dispose()
  {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
    //Tween animation
    final animation = Tween(begin: 0, end: 2 * pi).animate(_animationController!);
    return Scaffold
    (
      appBar: AppBar
      (
        title: Text
        (
          "AnimatedBuilder",
        ),
        centerTitle: true,
      ),
      body: Column
      (
        children:
        [
          //This is example widget
          AnimatedBuilder
          (
            animation: animation,
            child: FlutterLogo
            (
              size: 200,
            ),
            builder: (context, child)
            {
              return Transform.rotate
              (
                angle: animation.value.toDouble(),
                child: child,
              );
            },
          )
        ],
      ),
    );
  }
}