import 'package:flutter/material.dart';
import 'package:palomaps_project/data/product_model.dart';
import 'package:palomaps_project/extensions/text_extensions.dart';
import 'package:palomaps_project/extensions/theme_extensions.dart';
import 'package:palomaps_project/extensions/widget_extensions.dart';

class OrderItem extends StatefulWidget {
  OrderItem({super.key, required this.productModel, required this.value});

  ProductModel productModel;
  ValueChanged<int> value;

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  int count = 1;

  @override
  void initState() {
    count = widget.productModel.cost ~/ 12;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16, left: 16, right: 16),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            children: [
              "${count}"
                  .s(12)
                  .w(400)
                  .c(context.colors.lightBlue),
              16.kw,
              widget.productModel.name.s(18).w(400).c(context.colors.black),
              Spacer(),
              "${12 * count} \$"
                  .s(16)
                  .c(context.colors.lightBlue)
                  .w(400),
            ],
          ),
          16.kw,
          Row(
            children: [
              InkWell(
                overlayColor: WidgetStatePropertyAll(Colors.transparent),
                onTap: () {
                  setState(() {
                    if (count > 1) {
                      setState(() {
                        count--;
                      });
                      widget.value(count);
                    }
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      border: Border.all(color: context.colors.display)),
                  child: "-".s(12).w(400).c(context.colors.black),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    border: Border.all(color: context.colors.display)),
                child: "$count".s(12).w(400).c(context.colors.black),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    count++;
                  });
                  widget.value(count);
                },
                overlayColor: WidgetStatePropertyAll(Colors.transparent),
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      border: Border.all(color: context.colors.display)),
                  child: "+".s(12).w(400).c(context.colors.black),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
