import 'package:flutter/material.dart';

class CustomStarsPage extends StatefulWidget {
  const CustomStarsPage({Key? key}) : super(key: key);

  @override
  State<CustomStarsPage> createState() => _CustomStarsPageState();
}

class _CustomStarsPageState extends State<CustomStarsPage> {
  List<Widget> inUseIcons = [const Icon(Icons.star)];
  List<Widget> notInUseIcons =
      List.generate(6, (index) => const Icon(Icons.star));

  void oneStars() {
    setState(() {
      inUseIcons = const [Icon(Icons.star)];
      notInUseIcons = List.generate(6, (index) => const Icon(Icons.star));
    });
  }

  void fourStars() {
    setState(() {
      inUseIcons = List.generate(4, (index) => const Icon(Icons.star));
      notInUseIcons = List.generate(4, (index) => const Icon(Icons.star));
    });
  }

  void allStars() {
    setState(() {
      inUseIcons = List.generate(7, (index) => const Icon(Icons.star));
      notInUseIcons = [];
    });
  }

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
              Row(
                children: [
                  buildContainerWithText(
                    "1 star",
                    false,
                    true,
                    oneStars,
                    isSelected("1 star"),
                  ),
                  buildContainerWithText(
                    "4 stars",
                    false,
                    true,
                    fourStars,
                    isSelected("4 stars"),
                  ),
                  buildContainerWithText(
                    "All stars",
                    false,
                    true,
                    allStars,
                    isSelected("All stars"),
                  ),
                ],
              ),
              Row(
                children: inUseIcons.isEmpty
                    ? [
                        const SizedBox(height: 40),
                      ]
                    : [
                        for (final icon in inUseIcons)
                          DragTarget<Widget>(
                            onAccept: (star) {
                              setState(() {
                                if (notInUseIcons.contains(star)) {
                                  inUseIcons.add(star);
                                  notInUseIcons.remove(star);
                                }
                              });
                            },
                            builder: (context, candidateData, rejectedData) {
                              return Draggable<Widget>(
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
              ),
              Row(
                children: notInUseIcons.isEmpty
                    ? [
                        const SizedBox(height: 40),
                      ]
                    : [
                        for (final icon in notInUseIcons)
                          DragTarget<Widget>(
                            onAccept: (star) {
                              setState(() {
                                if (inUseIcons.contains(star)) {
                                  notInUseIcons.add(star);
                                  inUseIcons.remove(star);
                                }
                              });
                            },
                            builder: (context, candidateData, rejectedData) {
                              return Draggable<Widget>(
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
              ),
            ],
          ),
        ],
      ),
    );
  }

  bool isSelected(String text) {
    return (text == "1 star" && inUseIcons.length == 1) ||
        (text == "4 stars" && inUseIcons.length == 4) ||
        (text == "All stars" && inUseIcons.length == 7);
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
