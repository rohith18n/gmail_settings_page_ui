import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';

class CustomTextStyleController extends GetxController {
  TextStyle selectedTextStyle = const TextStyle();
  double selectedFontSize = 16.0;
  Color selectedColor = Colors.black;
  String selectedFontFamily = 'Sans Serif';

  final TextStyle initialTextStyle = const TextStyle();
  final double initialFontSize = 16.0;
  final Color initialColor = Colors.black;
  String textString = "Normal";

  void clearTextStyle() {
    selectedTextStyle = initialTextStyle;
    selectedFontSize = initialFontSize;
    selectedColor = initialColor;
    selectedFontFamily = 'Sans Serif';
    update();
  }

  void setTextStyle(TextStyle style, String text) {
    selectedTextStyle = style;
    textString = text;
    update();
  }

  void setFontSize(double size) {
    selectedFontSize = size;
    update();
  }

  void setColor(Color color) {
    selectedColor = color;
    update();
  }

  void setFontFamily(String fontFamily) {
    selectedFontFamily = fontFamily;
    update();
  }

  void showTextStyleSelectionDialog(BuildContext context) {
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
                    setTextStyle(const TextStyle(), 'Normal');
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: const Text('Bold'),
                  onTap: () {
                    setTextStyle(
                        const TextStyle(fontWeight: FontWeight.bold), 'Bold');
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: const Text('Italic'),
                  onTap: () {
                    setTextStyle(
                        const TextStyle(fontStyle: FontStyle.italic), 'Italic');
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

  void showFontFamilySelectionDialog(BuildContext context) {
    Color selectedColor = this.selectedColor;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          title: const Text('Select Text Color'),
          content: BlockPicker(
            pickerColor: selectedColor,
            onColorChanged: (Color color) {
              setColor(color);
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void showFontSizeSelectionDialog(BuildContext context) {
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
                  setFontSize(14.0);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: const Text('Normal'),
                onTap: () {
                  setFontSize(16.0);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: const Text('Large'),
                onTap: () {
                  setFontSize(18.0);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: const Text('Huge'),
                onTap: () {
                  setFontSize(20.0);
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
