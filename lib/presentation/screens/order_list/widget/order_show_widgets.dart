import 'package:flutter/material.dart';
import 'package:palomaps_project/data/total_model.dart';
import 'package:palomaps_project/extensions/text_extensions.dart';
import 'package:palomaps_project/extensions/theme_extensions.dart';
import 'package:palomaps_project/extensions/widget_extensions.dart';

class OrderShowWidgets extends StatelessWidget {
  const OrderShowWidgets({super.key, required this.productModel});

  final TotalModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              "# ${productModel.products[0].id} dine in"
                  .s(14)
                  .w(600)
                  .c(context.colors.black),
              "# ${productModel.roomType}"
                  .s(14)
                  .w(600)
                  .c(context.colors.lightBlue),
            ],
          ),
          8.kh,
          "Any client".s(12).w(600),
          8.kh,
          "Left to pay ${productModel.cost} \$ of total ${productModel.cost} \$"
              .s(12)
              .w(600),
          8.kh,
          "09:13".s(12).w(600),
          16.kw,
          for (int i = 0; i < productModel.products.length; i++)
            Row(
              children: [
                "${productModel.products[i].cost ~/ 12}".s(12).w(600),
                8.kw,
                Badge(
                  backgroundColor: context.colors.black,
                ),
                8.kw,
                productModel.products[i].name.toUpperCase().s(14).w(400),
              ],
            ),
          16.kw,
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 8),
                width: 100,
                height: 35,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: context.colors.greenHeadline, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Center(
                  child: "Info".s(12).c(context.colors.greenHeadline),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 8),
                width: 100,
                height: 35,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: context.colors.greenHeadline, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Center(
                  child: "Info".s(12).c(context.colors.greenHeadline),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 8),
                width: 100,
                height: 35,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: context.colors.greenHeadline, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Center(
                  child: "Info".s(12).c(context.colors.greenHeadline),
                ),
              ),

            ],
          ),
          Divider()
        ],
      ),
    );
  }
}
