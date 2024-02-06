import 'package:flutter/material.dart';
import 'package:gmail_settimgs_page_ui/controller/general_tabview_controller.dart';
import 'package:gmail_settimgs_page_ui/widgets/custom_language_dropdown.dart';
import 'package:get/get.dart';
import 'package:gmail_settimgs_page_ui/widgets/custom_number_dropdown.dart';
import 'package:gmail_settimgs_page_ui/widgets/custom_signature_page.dart';
import 'package:gmail_settimgs_page_ui/widgets/custom_stars_page.dart';
import 'package:gmail_settimgs_page_ui/widgets/default_text_style.dart';

class GeneralTabPage extends StatelessWidget {
  const GeneralTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GeneralTabViewController controller =
        Get.put(GeneralTabViewController());

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Obx(() => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildRow(
                    'Language',
                    customText("Gmail display language: "),
                    CustomLanguageDropdownField(
                      options: controller.languages.toList(),
                      selectedOption: controller.selectedLanguage.value,
                      onChanged: (String? value) {
                        controller.setSelectedLanguage(value!);
                      },
                    ),
                    context,
                  ),
                  _buildSeparator(),
                  _buildRow(
                      'Phone Numbers',
                      customText("Default country code: "),
                      CustomNumberDropdownField(
                        options: controller.languages.toList(),
                        selectedOption: controller.selectedCountryCode.value,
                        onChanged: (String? value) {
                          controller.setSelectedCountryCode(value!);
                        },
                      ),
                      context),
                  _buildSeparator(),
                  _buildRow(
                    'Default text style',
                    const SizedBox(),
                    const CustomDefaultTextStyle(),
                    context,
                  ),
                  _buildSeparator(),
                  _buildRow(
                      'Stars',
                      customText("Drag the stars between the lists. "),
                      const CustomStarsPage(),
                      context),
                  _buildSeparator(),
                  _buildRow('Signature', customText("Signature: "),
                      const SignatureContainer(), context),
                ],
              )),
        ),
      ),
    );
  }

  Widget customText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );
  }

  Widget _buildRow(
      String text, Widget child1, Widget child2, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.25,
          child: customText(text),
        ),
        child1,
        child2,
      ],
    );
  }

  Widget _buildSeparator() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      height: 0.3,
      color: Colors.grey,
    );
  }
}
