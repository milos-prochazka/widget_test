import 'package:flutter/material.dart';
import 'AnimatedBuilder.dart';
import 'CountriesField.dart';
import 'SafeAreaExample.dart';
import 'ExpandedExample.dart';
import 'TableExample.dart';

// ...

void main() => runApp(const MyApp());

// ...

class MyApp extends StatelessWidget
{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return new MaterialApp
    (
      home: new Screen1(),
      routes: <String, WidgetBuilder>
      {
        '/screen1': (BuildContext context) => new Screen1(),
        '/screen2': (BuildContext context) => new SafeAreaExample(),
        '/screen3': (BuildContext context) => new ExpandedExample(),
        '/screen4': (BuildContext context) => new TableExample(),
        '/screen5': (BuildContext context) => new CountriesField(),
        '/screen6': (BuildContext context) => new AnimatedBuilderExample(),
      },
    );
  }
}

class Screen1 extends StatelessWidget
{
  //const Screen1({Key? key}) : super(key: key);

//#if true
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: AppBar
        (
          title: Text
          (
            "Safe Area",
          ),
          centerTitle: true,
        ),
        body: DefaultTextStyle
                       (
            style: Theme.of(context).textTheme.headline4!,
            child: SafeArea
                      (
                child: Align
                     (
                    alignment: Alignment.center,
                    child: Column
                    (
                      children:
                      [
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: ElevatedButton(
                                onPressed: ()
                                {
                                  Navigator.of(context).pushNamed('/screen2');
                                },
                                child: Text("SafeArea"))),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: ElevatedButton(
                                onPressed: ()
                                {
                                  Navigator.of(context).pushNamed('/screen3');
                                },
                                child: Text("Expanded"))),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: ElevatedButton(
                                onPressed: ()
                                {
                                  Navigator.of(context).pushNamed('/screen4');
                                },
                                child: Text("Table"))),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: ElevatedButton(
                                onPressed: () async
                                {
                                  await _showMyDialog(context);
                                },
                                child: Text("Dialog"))),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: ElevatedButton(
                                onPressed: () async
                                {
                                  Navigator.of(context).pushNamed('/screen5');
                                },
                                child: Text("Overlay"))),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: ElevatedButton(
                                onPressed: () async
                                {
                                  Navigator.of(context).pushNamed('/screen6');
                                },
                                child: Text("AnimationBuilder"))),
                      ],
                    )))));
  }
//#end if line:34

//#if false
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.headline4!,
      child: GestureDetector(
        onTap: () {
          // This moves from the personal info page to the credentials page,
          // replacing this page with that one.
          //Navigator.of(context).pushReplacementNamed('/screen2');
          Navigator.of(context).pushNamed('/screen2', arguments: 'SCREEN II');
        },
        child: Container(
          color: Colors.lightBlue,
          alignment: Alignment.center,
          child: const Text('Screen 1'),
        ),
      ),
    );
  }
//#end if line:89

  Future<void> _showMyDialog(BuildContext context) async
  {
    return showDialog<void>
    (
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context)
      {
        return AlertDialog
        (
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView
          (
            child: ListBody
            (
              children: <Widget>
              [
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
                ElevatedButton(onPressed: () {}, child: const Text('P??idan?? tla????tko'))
              ],
            ),
          ),
          actions: <Widget>
          [
            TextButton
            (
              child: const Text('Approve'),
              onPressed: ()
              {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class Screen2 extends StatelessWidget
{
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    final title = ModalRoute.of(context)?.settings.arguments as String? ?? "Invalid title";

    return DefaultTextStyle
    (
      style: Theme.of(context).textTheme.headline4!,
      child: GestureDetector
      (
        onTap: ()
        {
          // This moves from the personal info page to the credentials page,
          // replacing this page with that one.
          //Navigator.of(context).pushReplacementNamed('/screen1');
          Navigator.of(context).pop();
        },
        child: Container
        (
          color: Colors.amberAccent,
          alignment: Alignment.center,
          child: Text(title),
        ),
      ),
    );
  }
}