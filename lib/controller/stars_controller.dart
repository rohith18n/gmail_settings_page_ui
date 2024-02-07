import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StarsController extends GetxController {
  RxList<Icon> inUseIcons = [const Icon(Icons.star)].obs;
  RxList<Icon> notInUseIcons =
      List.generate(6, (index) => const Icon(Icons.star)).obs;
  RxBool isBlue = false.obs;

  void oneStars() {
    inUseIcons.value = const [Icon(Icons.star)];
    notInUseIcons.value = List.generate(6, (index) => const Icon(Icons.star));
    isBlue.value = true;
    log("oneStars");
  }

  void fourStars() {
    inUseIcons.value = List.generate(4, (index) => const Icon(Icons.star));
    notInUseIcons.value = List.generate(4, (index) => const Icon(Icons.star));
    isBlue.value = true;

    log("fourstars");
  }

  void allStars() {
    inUseIcons.value = List.generate(7, (index) => const Icon(Icons.star));
    isBlue.value = true;
    notInUseIcons.value = [];
    log("allstars");
  }

  bool isSelected(String text) {
    return (text == "1 star" && inUseIcons.length == 1) ||
        (text == "4 stars" && inUseIcons.length == 4) ||
        (text == "All stars" && inUseIcons.length == 7);
  }

  Color? textColor(String text, bool isSelected) {
    return isSelected ? Colors.black : (text == "1 star" ? Colors.blue : null);
  }
}
