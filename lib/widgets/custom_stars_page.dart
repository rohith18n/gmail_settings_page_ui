import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmail_settimgs_page_ui/controller/stars_controller.dart';

class CustomStarsPage extends StatelessWidget {
  final StarsController controller = Get.put(StarsController());

  CustomStarsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildContainerWithText("Presets: ", false, false, () {}, true),
              const SizedBox(
                height: 9,
              ),
              buildContainerWithText("In use: ", true, false, () {}, true),
              const SizedBox(
                height: 9,
              ),
              buildContainerWithText("Not in use: ", true, false, () {}, true),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Row(
                  children: [
                    buildContainerWithText(
                      "1 star",
                      false,
                      controller.isBlue.value,
                      controller.oneStars,
                      controller.isSelected("1 star"),
                    ),
                    buildContainerWithText(
                      "4 stars",
                      false,
                      controller.isBlue.value,
                      controller.fourStars,
                      controller.isSelected("4 stars"),
                    ),
                    buildContainerWithText(
                      "All stars",
                      false,
                      controller.isBlue.value,
                      controller.allStars,
                      controller.isSelected("All stars"),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Obx(() => Row(
                        children: controller.inUseIcons.isEmpty
                            ? [
                                const SizedBox(height: 40),
                              ]
                            : [
                                for (final icon in controller.inUseIcons)
                                  DragTarget<Icon>(
                                    onAccept: (star) {
                                      if (controller.notInUseIcons
                                          .contains(star)) {
                                        controller.inUseIcons.add(star);
                                        controller.notInUseIcons.remove(star);
                                      }
                                    },
                                    builder:
                                        (context, candidateData, rejectedData) {
                                      return Draggable<Icon>(
                                        data: icon,
                                        feedback: Material(
                                          color: Colors.transparent,
                                          child: icon,
                                        ),
                                        childWhenDragging: Container(),
                                        child: Container(
                                          padding: const EdgeInsets.all(8.0),
                                          child: icon,
                                        ),
                                      );
                                    },
                                  ),
                              ],
                      )),
                ],
              ),
              Row(
                children: [
                  Obx(() => Row(
                        children: controller.notInUseIcons.isEmpty
                            ? [
                                const SizedBox(height: 40),
                              ]
                            : [
                                for (final icon in controller.notInUseIcons)
                                  DragTarget<Icon>(
                                    onAccept: (star) {
                                      if (controller.inUseIcons
                                          .contains(star)) {
                                        controller.notInUseIcons.add(star);
                                        controller.inUseIcons.remove(star);
                                      }
                                    },
                                    builder:
                                        (context, candidateData, rejectedData) {
                                      return Draggable<Icon>(
                                        data: icon,
                                        feedback: Material(
                                          color: Colors.transparent,
                                          child: icon,
                                        ),
                                        childWhenDragging: Container(),
                                        child: Container(
                                          padding: const EdgeInsets.all(8.0),
                                          child: icon,
                                        ),
                                      );
                                    },
                                  ),
                              ],
                      )),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container buildContainerWithText(
    String text,
    bool makeBold,
    bool isBlue,
    Function() onTap,
    bool isSelected,
  ) {
    return Container(
      padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 20),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: makeBold ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? Colors.black : (isBlue ? Colors.blue : null),
          ),
        ),
      ),
    );
  }
}
