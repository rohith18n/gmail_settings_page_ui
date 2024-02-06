import 'package:flutter/material.dart';

class AppConstants {
  static String gmailUrl =
      "https://imgs.search.brave.com/TpXgSE-SrnuL9SP9nYena0Qr9GmSlSOuVfPJRrYQ9sI/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9jZG4t/aWNvbnMtcG5nLmZy/ZWVwaWsuY29tLzI1/Ni81OTY4LzU5Njg1/MzQucG5n";
  static String emptyUser =
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png";

  // Calculate responsive SizedBox based on screen width
  static SizedBox responsiveSizedBoxWidth(BuildContext context, double width) {
    return SizedBox(width: MediaQuery.of(context).size.width * width);
  }

  static SizedBox sizedh16() {
    return const SizedBox(height: 16);
  }

  // Calculate responsive SizedBox based on screen height
  static SizedBox responsiveSizedBoxHeight(
      BuildContext context, double height) {
    return SizedBox(height: MediaQuery.of(context).size.height * height);
  }
}
