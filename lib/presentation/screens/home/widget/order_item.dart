import 'package:flutter/material.dart';
import 'package:palomaps_project/extensions/text_extensions.dart';
import 'package:palomaps_project/extensions/theme_extensions.dart';

class OrderWidget extends StatelessWidget {
  OrderWidget({super.key, required this.onPressed, required this.index});

  Function onPressed;
  int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed.call(),
      child: Container(
        margin: EdgeInsets.only(right: 8, bottom: 8),
        width: MediaQuery.of(context).size.width / 3,
        decoration: BoxDecoration(
            color: context.colors.onPrimary,
            borderRadius: BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: context.colors.display, width: 2)),
        child: Column(
          children: [
            Spacer(),
            "T $index".s(18).w(600).c(context.colors.black),
            Spacer(),
            "Jessics hshs".s(15).w(500).c(context.colors.black),
            Spacer(),
            Container(
              height: 16,
              decoration: BoxDecoration(
                  color: context.colors.greenHeadline,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(6))),
            )
          ],
        ),
      ),
    );
  }
}
