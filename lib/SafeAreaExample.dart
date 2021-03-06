import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SafeAreaExample extends StatefulWidget
{
  @override
  _SafeAreaExampleState createState() => _SafeAreaExampleState();
}

class _SafeAreaExampleState extends State<SafeAreaExample>
{
  @override
  void initState()
  {
    super.initState();
  }

  @override
  void dispose()
  {
    super.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: Text
        (
          "Safe Area",
        ),
        centerTitle: true,
      ),

      //This is example widget
      body: SafeArea
      (
        child: ListView
        (
          children: List.generate(100, (index) => Text("This is $index index")),
        ),
      ),
      /////////////////////////
    );
  }
}