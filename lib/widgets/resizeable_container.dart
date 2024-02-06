import 'package:flutter/material.dart';
import 'package:gmail_settimgs_page_ui/utils/colors.dart';
import 'package:gmail_settimgs_page_ui/utils/constants.dart';

class MyResizableContainer extends StatefulWidget {
  const MyResizableContainer({Key? key}) : super(key: key);

  @override
  MyResizableContainerState createState() => MyResizableContainerState();
}

class MyResizableContainerState extends State<MyResizableContainer> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: isHovered
            ? MediaQuery.of(context).size.width * 0.15
            : MediaQuery.of(context).size.width * 0.075,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: isHovered
                ? [
                    const SizedBox(
                      height: 20,
                    ),
                    onHovered(
                        str: "Compose", icon: Icons.edit, isContainer: true),
                    AppConstants.sizedh16(),
                    onHovered(str: "Inbox", icon: Icons.inbox_outlined),
                    AppConstants.sizedh16(),
                    onHovered(str: "Starred", icon: Icons.star_border),
                    AppConstants.sizedh16(),
                    onHovered(str: "Snoozed", icon: Icons.access_time),
                    AppConstants.sizedh16(),
                    onHovered(str: "Send", icon: Icons.send_outlined),
                    AppConstants.sizedh16(),
                    onHovered(str: "Drafts", icon: Icons.contact_page_outlined),
                    AppConstants.sizedh16(),
                    onHovered(
                        str: "More", icon: Icons.keyboard_arrow_down_rounded),
                    AppConstants.sizedh16(),
                  ]
                : [
                    const SizedBox(
                      height: 20,
                    ),
                    const Icon(Icons.edit),
                    AppConstants.sizedh16(),
                    const Icon(Icons.inbox_outlined),
                    AppConstants.sizedh16(),
                    const Icon(Icons.star_border),
                    AppConstants.sizedh16(),
                    const Icon(Icons.access_time),
                    AppConstants.sizedh16(),
                    const Icon(Icons.send_outlined),
                    AppConstants.sizedh16(),
                    const Icon(Icons.contact_page_outlined),
                    AppConstants.sizedh16(),
                    const Icon(Icons.keyboard_arrow_down_rounded),
                    AppConstants.sizedh16(),
                  ]),
      ),
    );
  }
}

Widget onHovered({
  required String str,
  required IconData icon,
  bool isContainer = false,
}) {
  if (isContainer) {
    return Container(
      width: 120,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.lightBlue.shade100,
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 15),
          Text(
            str,
            style: const TextStyle(color: AppColor.secondaryColor),
          ),
        ],
      ),
    );
  } else {
    return SizedBox(
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 15),
          Text(
            str,
            style: const TextStyle(color: AppColor.secondaryColor),
          ),
        ],
      ),
    );
  }
}
