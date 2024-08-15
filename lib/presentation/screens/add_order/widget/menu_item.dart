import 'package:flutter/material.dart';
import 'package:palomaps_project/extensions/text_extensions.dart';
import 'package:palomaps_project/extensions/theme_extensions.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({super.key, required this.onPressed, required this.title});

  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: WidgetStatePropertyAll(Colors.transparent),
      onTap: () {
        onPressed.call();
      },
      child: Container(
        margin: EdgeInsets.only(right: 10, bottom: 10, top: 10),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
            color: context.colors.onPrimary,
            border: Border.all(color: context.colors.display, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Center(
          child: title.s(12).w(400).c(context.colors.black),
        ),
      ),
    );
  }
}
