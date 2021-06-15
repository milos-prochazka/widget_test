import 'package:flutter/material.dart';

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
        '/screen2': (BuildContext context) => new Screen2(),
        '/screen3': (BuildContext context) => new Screen2(),
        '/screen4': (BuildContext context) => new Screen2()
      },
    );
  }
}


class Screen1 extends StatelessWidget 
{
  const Screen1({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) 
  {
    return DefaultTextStyle
    (
      style: Theme.of(context).textTheme.headline4!,
      child: GestureDetector
      (
        onTap: () 
        {
          // This moves from the personal info page to the credentials page,
          // replacing this page with that one.
          //Navigator.of(context).pushReplacementNamed('/screen2');
          Navigator.of(context).pushNamed('/screen2',arguments: 'SCREEN II');
        },
        child: Container
        (
          color: Colors.lightBlue,
          alignment: Alignment.center,
          child: const Text('Screen 1'),
        ),
      ),
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


