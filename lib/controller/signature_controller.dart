import 'package:get/get.dart';

class SignatureController extends GetxController {
  RxList<String> signatures = <String>[].obs;

  void addSignature(String signature) {
    if (!signatures.contains(signature)) {
      signatures.add(signature);
    }
  }

  void editSignature(int index, String newValue) {
    signatures[index] = newValue;
  }

  void deleteSignature(int index) {
    signatures.removeAt(index);
  }
}
