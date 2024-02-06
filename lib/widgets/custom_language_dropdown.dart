import 'package:flutter/material.dart';
import 'package:language_picker/language_picker_dialog.dart';
import 'package:language_picker/languages.dart';

class CustomLanguageDropdownField extends StatefulWidget {
  final List<String> options;
  final String selectedOption;
  final ValueChanged<String>? onChanged;

  const CustomLanguageDropdownField({
    Key? key,
    required this.options,
    required this.selectedOption,
    this.onChanged,
  }) : super(key: key);

  @override
  CustomLanguageDropdownFieldState createState() =>
      CustomLanguageDropdownFieldState();
}

class CustomLanguageDropdownFieldState
    extends State<CustomLanguageDropdownField> {
  late String _selectedOption;

  @override
  void initState() {
    super.initState();
    _selectedOption = widget.selectedOption;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showLanguagePicker,
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.03,
        padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 3),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _selectedOption,
              style: const TextStyle(fontSize: 13.0),
            ),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }

  void _showLanguagePicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return LanguagePickerDialog(
          titlePadding: const EdgeInsets.all(8.0),
          isSearchable: true,
          title: const Text('Select a language'),
          onValuePicked: (Language language) {
            setState(() {
              _selectedOption = language.name;
            });
            Navigator.pop(context);
            widget.onChanged?.call(language.isoCode);
          },
          itemBuilder: (Language language) {
            return ListTile(
              title: Text(language.name),
              onTap: () {
                _selectedOption = language.name;
                Navigator.pop(context);
                widget.onChanged?.call(language.isoCode);
              },
            );
          },
        );
      },
    );
  }
}
