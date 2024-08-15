import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:palomaps_project/extensions/theme_extensions.dart';
import 'package:palomaps_project/presentation/screens/home/home_page.dart';
import 'package:palomaps_project/presentation/screens/order_list/order_list_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
              icon: InkWell(
                onTap: () => setState(() {
                  index = 0;
                }),
                child: Icon(
                  Icons.exit_to_app,
                  color: context.colors.black,
                ),
              ),
              label: "Exit"),
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                setState(() {
                  index = 1;
                });
              },
              child: Icon(
                Icons.list_alt,
                color: context.colors.black,
              ),
            ),
            label: "Order list",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book_rounded,
              color: context.colors.black,
            ),
            label: "To Go",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.delete,
                color: context.colors.black,
              ),
              label: "Quick order"),
        ],
      ),
      body: index == 0 ? HomePage() : OrderListPage(),
    );
  }
}
