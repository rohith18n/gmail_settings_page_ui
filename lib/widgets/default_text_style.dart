import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmail_settimgs_page_ui/controller/textstyle_controller.dart';

class CustomDefaultTextStyle extends StatelessWidget {
  final CustomTextStyleController controller =
      Get.put(CustomTextStyleController());

  CustomDefaultTextStyle({super.key});

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
                  controller.showTextStyleSelectionDialog(context);
                },
                child: SizedBox(
                  height: 20,
                  child: Center(
                    child: Row(
                      children: [
                        GetBuilder<CustomTextStyleController>(
                          builder: (controller) => Text(controller.textString),
                        ),
                        const SizedBox(width: 15),
                        const Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.showFontSizeSelectionDialog(context);
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
                  controller.showFontFamilySelectionDialog(context);
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
                  controller.clearTextStyle();
                },
                child: const SizedBox(
                  height: 20,
                  child: Center(child: Icon(Icons.format_clear)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          GetBuilder<CustomTextStyleController>(
            builder: (controller) => Text(
              'This is what your body text will look like.',
              style: controller.selectedTextStyle.copyWith(
                fontSize: controller.selectedFontSize,
                color: controller.selectedColor,
                fontFamily: controller.selectedFontFamily,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
