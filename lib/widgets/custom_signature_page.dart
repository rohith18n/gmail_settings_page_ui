import 'package:flutter/material.dart';

class SignatureContainer extends StatefulWidget {
  const SignatureContainer({Key? key}) : super(key: key);

  @override
  SignatureContainerState createState() => SignatureContainerState();
}

class SignatureContainerState extends State<SignatureContainer> {
  List<String> signatures = [];

  void _addSignature() {
    TextEditingController nameController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Name new signature'),
          content: GestureDetector(
            onTap: () {},
            child: Form(
              key: formKey,
              child: TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Signature name',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(8.0),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a signature name';
                  } else if (signatures.contains(value)) {
                    return 'This signature already exists';
                  }
                  return null;
                },
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  setState(() {
                    signatures.add(nameController.text);
                    nameController.clear();
                  });
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Create'),
            ),
          ],
        );
      },
    );
  }

  void _editSignature(int index, String initialValue) {
    TextEditingController nameController =
        TextEditingController(text: initialValue);
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Signature'),
          content: GestureDetector(
            onTap: () {},
            child: Form(
              key: formKey,
              child: TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Signature name',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(8.0),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a signature name';
                  }
                  return null;
                },
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  setState(() {
                    signatures[index] = nameController.text;
                  });
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  }

  void _deleteSignature(int index) {
    setState(() {
      signatures.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        signatures.isEmpty
            ? const Padding(
                padding: EdgeInsets.only(bottom: 15.0),
                child: SizedBox(child: Text('No signatures')),
              )
            : Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 0.4),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: signatures
                        .asMap()
                        .entries
                        .map(
                          (MapEntry<int, String> entry) => Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  margin: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(entry.value),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _editSignature(entry.key, entry.value);
                                },
                                child: const Icon(
                                  Icons.edit,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(width: 8),
                              GestureDetector(
                                onTap: () {
                                  _deleteSignature(entry.key);
                                },
                                child: const Icon(
                                  Icons.delete_outline,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
        Container(
          width: MediaQuery.of(context).size.width * 0.2,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.lightBlue.shade900, width: 0.2),
          ),
          child: GestureDetector(
            onTap: _addSignature,
            child: Row(
              children: [
                Icon(Icons.add, color: Colors.lightBlue.shade900),
                const SizedBox(width: 8),
                Text('Create New',
                    style: TextStyle(color: Colors.lightBlue.shade900)),
              ],
            ),
          ),
        )
      ],
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: SignatureContainer(),
    ),
  ));
}
