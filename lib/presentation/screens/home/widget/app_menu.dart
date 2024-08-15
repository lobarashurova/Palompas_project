import 'package:flutter/material.dart';
import 'package:palomaps_project/extensions/text_extensions.dart';
import 'package:palomaps_project/extensions/theme_extensions.dart';
import 'package:palomaps_project/extensions/widget_extensions.dart';

class AppNavigationDrawer extends StatelessWidget {
  const AppNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 3 / 4,
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(30))),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            32.kh,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                "Syliva Do".s(16).w(600).c(context.colors.black),
                Icon(Icons.arrow_back_ios_new)
              ],
            ),
            16.kh,
            Divider(),
            16.kh,
            buildListTile(
                context,
                "Table service",
                Icon(
                  Icons.food_bank,
                  color: context.colors.black,
                )),
            buildListTile(
                context,
                "Quick order",
                Icon(
                  Icons.border_outer_outlined,
                  color: context.colors.black,
                )),
            buildListTile(
                context,
                "Delivery",
                Icon(
                  Icons.delivery_dining,
                  color: context.colors.black,
                )),
            buildListTile(
                context,
                "Table service",
                Icon(
                  Icons.food_bank,
                  color: context.colors.black,
                )),
            buildListTile(
                context,
                "Quick order",
                Icon(
                  Icons.border_outer_outlined,
                  color: context.colors.black,
                )),
            buildListTile(
                context,
                "Delivery",
                Icon(
                  Icons.delivery_dining,
                  color: context.colors.black,
                )),
          ],
        ),
      ),
    );
  }

  ListTile buildListTile(BuildContext context, String title, Widget leading) {
    return ListTile(
      horizontalTitleGap: 0,
      leading: leading,
      title: title.s(15).w(500).c(context.colors.black),
    );
  }
}
