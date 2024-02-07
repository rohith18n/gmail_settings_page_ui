import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmail_settimgs_page_ui/controller/signature_controller.dart';

class SignatureContainer extends StatelessWidget {
  final SignatureController signatureController =
      Get.put(SignatureController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SignatureContainer({super.key}); // Added GlobalKey

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            signatureController.signatures.isEmpty
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
                        children: signatureController.signatures
                            .asMap()
                            .entries
                            .map(
                              (MapEntry<int, String> entry) => Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      margin:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: Text(entry.value),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _editSignature(
                                          context, entry.key, entry.value);
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
                border:
                    Border.all(color: Colors.lightBlue.shade900, width: 0.2),
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
        ));
  }

  void _addSignature() {
    TextEditingController nameController = TextEditingController();

    Get.defaultDialog(
      title: 'Name new signature',
      content: Form(
        key: formKey, // Added formKey here
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
            } else if (signatureController.signatures.contains(value)) {
              return 'This signature already exists';
            }
            return null;
          },
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  signatureController.addSignature(nameController.text);
                  nameController.clear();
                  Get.back();
                }
              },
              child: const Text('Create'),
            ),
          ],
        ),
      ],
    );
  }

  void _editSignature(BuildContext context, int index, String initialValue) {
    TextEditingController nameController =
        TextEditingController(text: initialValue);

    Get.defaultDialog(
      title: 'Edit Signature',
      content: Form(
        key: formKey, // Added formKey here
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
            } else if (signatureController.signatures.contains(value)) {
              return 'This signature already exists';
            }
            return null;
          },
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  signatureController.editSignature(index, nameController.text);
                  Get.back();
                }
              },
              child: const Text('Update'),
            ),
          ],
        ),
      ],
    );
  }

  void _deleteSignature(int index) {
    signatureController.deleteSignature(index);
  }
}
