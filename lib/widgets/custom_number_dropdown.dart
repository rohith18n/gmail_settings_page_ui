import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class CustomNumberDropdownField extends StatefulWidget {
  final List<String> options;
  final String selectedOption;
  final ValueChanged<String>? onChanged;

  const CustomNumberDropdownField({
    Key? key,
    required this.options,
    required this.selectedOption,
    this.onChanged,
  }) : super(key: key);

  @override
  CustomNumberDropdownFieldState createState() =>
      CustomNumberDropdownFieldState();
}

class CustomNumberDropdownFieldState extends State<CustomNumberDropdownField> {
  late String _selectedOption;

  @override
  void initState() {
    super.initState();
    _selectedOption = widget.selectedOption;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showCountryPicker(
        context: context,
        showPhoneCode: true,
        onSelect: (Country country) {
          setState(() {
            _selectedOption = country.displayName;
          });
          if (widget.onChanged != null) {
            widget.onChanged!(_selectedOption);
          }
        },
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.03,
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
}
