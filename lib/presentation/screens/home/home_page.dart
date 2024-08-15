import 'package:flutter/material.dart';
import 'package:palomaps_project/extensions/text_extensions.dart';
import 'package:palomaps_project/extensions/theme_extensions.dart';
import 'package:palomaps_project/presentation/screens/add_order/add_order_page.dart';
import 'package:palomaps_project/presentation/screens/home/widget/app_menu.dart';
import 'package:palomaps_project/presentation/screens/home/widget/order_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isExpanded = false;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 1,
      child: Scaffold(
        key: _key,
        drawer: AppNavigationDrawer(),
        appBar: AppBar(
          title: "Table service".s(20).w(400).c(context.colors.black),
          backgroundColor: context.colors.onPrimary,
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                _key.currentState!.openDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: context.colors.black,
              )),
          elevation: 0,
          bottom: TabBar(
            dividerColor: context.colors.display,
            indicatorColor: context.colors.primary2,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 72),
            tabs: const <Widget>[
              Tab(text: "Default Room"),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 8),
          child: TabBarView(
            children: [
              GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, childAspectRatio: 1),
                  itemCount: 18,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return OrderWidget(
                      index: index + 1,
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddOrderPage(
                                    type: "T ${index + 1}",
                                  ))),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
