import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TableExample extends StatefulWidget
{
  @override
  _TableExampleState createState() => _TableExampleState();
}

class _TableExampleState extends State<TableExample>
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
          "Table",
        ),
        centerTitle: true,
      ),
      body: Column
      (
        children:
        [
          //This is example widget
          Padding
          (
            padding: const EdgeInsets.all(16),
            child: Table
            (
              border: TableBorder.all(),
              defaultColumnWidth: IntrinsicColumnWidth(),
              children:
              [
                TableRow(
                    decoration: BoxDecoration(color: Colors.blue),
                    children: [Center(child: Text("No")), Center(child: Text("Name"))]),
                TableRow(children:
                [
                  Align(alignment: Alignment.bottomRight, child: Center(child: Text("1"))),
                  Center(child: Text("David je absolutní jednička"))
                ]),
                TableRow(children: [Center(child: Text("2")), Center(child: Text("Lorra je totální dvojka"))])
              ],
            ),
          )
        ],
      ),
    );
  }
}