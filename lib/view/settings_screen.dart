import 'package:flutter/material.dart';
import 'package:gmail_settimgs_page_ui/view/general_tab.dart';
import 'package:gmail_settimgs_page_ui/widgets/custom_appbar.dart';
import 'package:gmail_settimgs_page_ui/widgets/resizeable_container.dart';

class GmailSettingsScreen extends StatelessWidget {
  const GmailSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> tabNames = [
      'General',
      'Labels',
      'Inbox',
      'Accounts and Import',
      'Filters and blocked addresses',
      'Forwarding and POP/IMAP',
      'Add-ons',
      'Chat and Meet',
      'Advanced',
      'Offline',
      'Themes'
    ];

    bool isScreenHalved = MediaQuery.of(context).size.width < 800;

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Row(
          children: [
            const MyResizableContainer(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ),
                  DefaultTabController(
                    length: 11,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (isScreenHalved)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  for (int i = 0; i < 6; i++)
                                    Expanded(
                                      child: Tab(
                                        text: tabNames[i],
                                      ),
                                    ),
                                ],
                              ),
                              Row(
                                children: [
                                  for (int i = 6; i < 11; i++)
                                    Expanded(
                                      child: Tab(
                                        text: tabNames[i],
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          )
                        else
                          TabBar(
                            isScrollable: true,
                            labelColor: Colors.lightBlue[800],
                            unselectedLabelColor: Colors.black,
                            indicatorColor: Colors.lightBlue[800],
                            indicatorSize: TabBarIndicatorSize.label,
                            tabs: [
                              for (int i = 0; i < 11; i++)
                                Tab(
                                  text: tabNames[i],
                                ),
                            ],
                          ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.7,
                          child: TabBarView(
                            children: [
                              for (int i = 0; i < 11; i++)
                                tabNames[i] == 'General'
                                    ? const GeneralTabPage()
                                    : _buildRegularTabView(
                                        context, tabNames[i]),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRegularTabView(BuildContext context, String tabName) {
    return Center(
      child: Text(
        'Content of $tabName',
      ),
    );
  }
}
