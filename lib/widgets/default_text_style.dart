import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class CustomDefaultTextStyle extends StatefulWidget {
  const CustomDefaultTextStyle({Key? key}) : super(key: key);

  @override
  CustomDefaultTextStyleState createState() => CustomDefaultTextStyleState();
}

class CustomDefaultTextStyleState extends State<CustomDefaultTextStyle> {
  TextStyle _selectedTextStyle = const TextStyle();
  double _selectedFontSize = 16.0;
  Color _selectedColor = Colors.black;
  String _selectedFontFamily = 'Sans Serif';

  final TextStyle _initialTextStyle = const TextStyle();
  final double _initialFontSize = 16.0;
  final Color _initialColor = Colors.black;
  String _textString = "Normal";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 0.1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  _showTextStyleSelectionDialog(context);
                },
                child: SizedBox(
                  height: 20,
                  child: Center(
                    child: Row(
                      children: [
                        Text(_textString),
                        const SizedBox(
                          width: 15,
                        ),
                        const Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _showFontSizeSelectionDialog(context);
                },
                child: const SizedBox(
                  height: 20,
                  child: Center(
                    child: Row(
                      children: [
                        Icon(Icons.format_size_outlined),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _showFontFamilySelectionDialog(context);
                },
                child: const SizedBox(
                  height: 20,
                  child: Center(
                    child: Row(
                      children: [
                        Icon(Icons.text_format_rounded),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedTextStyle = _initialTextStyle;
                    _selectedFontSize = _initialFontSize;
                    _selectedColor = _initialColor;
                    _selectedFontFamily = 'Sans Serif';
                  });
                },
                child: const SizedBox(
                  height: 20,
                  child: Center(child: Icon(Icons.format_clear)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Text(
            'This is what your body text will look like.',
            style: _selectedTextStyle.copyWith(
                fontSize: _selectedFontSize,
                color: _selectedColor,
                fontFamily: _selectedFontFamily),
          ),
        ],
      ),
    );
  }

  void _showTextStyleSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Text Style'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text('Normal'),
                  onTap: () {
                    setState(() {
                      _selectedTextStyle = const TextStyle();
                      _textString = 'Normal';
                    });
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: const Text('Bold'),
                  onTap: () {
                    setState(() {
                      _selectedTextStyle =
                          const TextStyle(fontWeight: FontWeight.bold);
                      _textString = 'Bold';
                    });
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: const Text('Italic'),
                  onTap: () {
                    setState(() {
                      _selectedTextStyle =
                          const TextStyle(fontStyle: FontStyle.italic);
                      _textString = 'Italic';
                    });
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showFontFamilySelectionDialog(BuildContext context) {
    Color selectedColor = _selectedColor;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          title: const Text('Select Text Color'),
          content: BlockPicker(
            pickerColor: selectedColor,
            onColorChanged: (Color color) {
              setState(() {
                selectedColor = color;
              });
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  _selectedColor = selectedColor;
                });
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showFontSizeSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Font Size'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Small'),
                onTap: () {
                  setState(() {
                    _selectedFontSize = 14.0;
                  });
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: const Text('Normal'),
                onTap: () {
                  setState(() {
                    _selectedFontSize = 16.0;
                  });
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: const Text('Large'),
                onTap: () {
                  setState(() {
                    _selectedFontSize = 18.0;
                  });
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: const Text('Huge'),
                onTap: () {
                  setState(() {
                    _selectedFontSize = 20.0;
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
