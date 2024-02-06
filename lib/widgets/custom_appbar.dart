import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gmail_settimgs_page_ui/utils/colors.dart';
import 'package:gmail_settimgs_page_ui/utils/constants.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.menu),
            color: AppColor.secondaryColor,
            onPressed: () {},
          ),
          const SizedBox(width: 16),
          Image.network(
            AppConstants.gmailUrl,
            width: 24,
          ),
          const SizedBox(width: 16),
          const Text(
            'Gmail',
            style: TextStyle(
              color: AppColor.secondaryColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 40),
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.4,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CupertinoSearchTextField(
              backgroundColor: Colors.grey.shade200,
              placeholder: 'Search mail',
              placeholderStyle: const TextStyle(
                fontSize: 12,
                color: AppColor.textSecondary,
              ),
              style: const TextStyle(fontSize: 12),
              onChanged: (String value) {},
              onSubmitted: (String value) {},
              prefixIcon: const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Icon(Icons.search),
              ),
              suffixIcon: const Icon(Icons.menu),
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.contact_support_outlined),
            color: AppColor.secondaryColor,
            onPressed: () {},
          ),
          const SizedBox(width: 16),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            color: AppColor.secondaryColor,
            onPressed: () {},
          ),
          const SizedBox(width: 16),
          IconButton(
            icon: const Icon(Icons.apps_rounded),
            color: AppColor.secondaryColor,
            onPressed: () {},
          ),
          const SizedBox(width: 16),
          CircleAvatar(
            radius: 14,
            backgroundColor: Colors.white,
            child: Image.network(
              AppConstants.emptyUser,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
              colorBlendMode: BlendMode.srcIn,
              color: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
