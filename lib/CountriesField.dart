import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CountriesField extends StatefulWidget
{
  @override
  _CountriesFieldState createState() => _CountriesFieldState();
}

class _CountriesFieldState extends State<CountriesField>
{
  final FocusNode _focusNode = FocusNode();

  OverlayEntry? _overlayEntry;

  final LayerLink _layerLink = LayerLink();

  @override
  void initState()
  {
    _focusNode.addListener(()
    {
      if (_focusNode.hasFocus)
      {
        this._overlayEntry = this._createOverlayEntry();
        Overlay.of(context)!.insert(this._overlayEntry!);
      }
      else
      {
        this._overlayEntry!.remove();
      }
    });
  }

  OverlayEntry _createOverlayEntry()
  {
    var renderBox = context.findRenderObject() as RenderBox;

    var size = renderBox.size;

    return OverlayEntry
             (
        builder: (context) => Positioned
            (
              width: size.width,
              //height: size.height,
              child: CompositedTransformFollower
              (
                link: this._layerLink,
                showWhenUnlinked: false,
                offset: Offset(0.0, 20), //size.height + 5.0),
                child: Material
                (
                  elevation: 4.0,
                  child: ListView
                  (
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    children: <Widget>
                    [
                      ListTile
                      (
                        title: Text('Syria'),
                        onTap: ()
                        {
                          print('Syria Tapped');
                        },
                      ),
                      ListTile
                      (
                        title: Text('Lebanon'),
                        onTap: ()
                        {
                          print('Lebanon Tapped');
                        },
                      )
                    ],
                  ),
                ),
              ),
            ));
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
        body: Form
          (
            child: ListView(children:
        [
          CompositedTransformTarget
          (
            link: this._layerLink,
            child: TextFormField
            (
              focusNode: this._focusNode,
              decoration: InputDecoration(labelText: 'Country'),
            ),
          ),
          Text('---- Textik ---')
        ])));
  }
}