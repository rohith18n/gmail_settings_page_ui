import 'package:get/get.dart';

class GeneralTabViewController extends GetxController {
  RxList<String> languages = <String>[].obs;

  RxString selectedLanguage = "English".obs;
  RxString selectedCountryCode = "India (IN) [+91]".obs;

  void setSelectedLanguage(String value) {
    selectedLanguage.value = value;
  }

  void setSelectedCountryCode(String value) {
    selectedCountryCode.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    fetchLanguages();
  }

  Future<void> fetchLanguages() async {}
}
