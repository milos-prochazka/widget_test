import 'package:flutter/material.dart';

class ExpandedExample extends StatefulWidget
{
  @override
  _ExpandedExampleState createState() => _ExpandedExampleState();
}

class _ExpandedExampleState extends State<ExpandedExample>
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
          "Expanded",
        ),
        centerTitle: true,
      ),
      body: Column
      (
        children:
        [
          //This is example widget
          Expanded
               (
              flex: 1,
              child: Container
              (
                color: Colors.blue,
              )),
          Expanded
               (
              flex: 2,
              child: Container
              (
                color: Colors.yellow,
              )),
          Expanded
               (
              flex: 3,
              child: Container
              (
                color: Colors.deepOrange,
              ))
        ],
      ),
    );
  }
}