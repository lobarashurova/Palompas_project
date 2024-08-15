import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palomaps_project/data/product_model.dart';
import 'package:palomaps_project/extensions/text_extensions.dart';
import 'package:palomaps_project/extensions/theme_extensions.dart';
import 'package:palomaps_project/extensions/widget_extensions.dart';
import 'package:palomaps_project/presentation/screens/add_order/bloc/add_order_bloc.dart';
import 'package:palomaps_project/presentation/screens/add_order/widget/menu_item.dart';
import 'package:palomaps_project/presentation/screens/add_order/widget/order_item.dart';
import 'package:palomaps_project/presentation/screens/add_order/widget/product_item.dart';

class AddOrderPage extends StatefulWidget {
  const AddOrderPage({super.key, required this.type});

  final String type;

  @override
  State<AddOrderPage> createState() => _AddOrderPageState();
}

class _AddOrderPageState extends State<AddOrderPage> {
  final List<String> menuList = [
    "Bento Box",
    "Checkkgae series",
    "Desserts",
    "Extras",
    "Fruit Tea",
    "Jam Milky",
    "Bento Box",
    "Checkkgae series",
    "Desserts",
    "Extras",
    "Fruit Tea",
    "Jam Milky",
  ];
  final List<String> productList = [
    "Maxito",
    "Redbull",
    "Aice tea",
    "Lipton tea",
    "Fruit Tea",
    "Milky tea",
    "Juice tra",
    "Chickbox",
    "Desserts",
    "Extras",
    "Fruit Tea",
    "Jam Milky",
  ];
  final bloc = AddOrderBloc();

  @override
  void initState() {
    bloc.add(GetOrdersByType(widget.type));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: BlocProvider.value(
        value: bloc,
        child: BlocConsumer<AddOrderBloc, AddOrderState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Scaffold(
              backgroundColor: context.colors.onPrimary,
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back,
                    color: context.colors.black,
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widget.type.s(15).w(600).c(context.colors.black),
                    8.kw,
                    "\$ ${state.totalCost ?? 0}"
                        .s(15)
                        .w(600)
                        .c(context.colors.lightBlue)
                  ],
                ),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.menu_open,
                        color: context.colors.black,
                      ))
                ],
                bottom: TabBar(
                  dividerColor: context.colors.display,
                  indicatorColor: context.colors.lightBlue,
                  tabs: <Widget>[
                    Column(
                      children: [
                        "1".s(10).c(context.colors.display),
                        "\$ ${state.totalCost ?? 0}".s(12).c(context.colors.lightBlue),
                      ],
                    ),
                    Container(
                      child: Icon(
                        Icons.add,
                        color: context.colors.black,
                      ),
                    ),
                    Container(
                      child: Icon(
                        Icons.insert_drive_file_outlined,
                        color: context.colors.black,
                      ),
                    ),
                    Container(
                      child: Icon(Icons.credit_card),
                    ),
                  ],
                ),
              ),
              body: Column(
                children: [
                  Flexible(
                      child: ListView.builder(
                    itemBuilder: (context, index) {
                      return OrderItem(
                        productModel: (state.products ?? [])[index],
                        value: (value) {
                          bloc.add(UpdateProductModel(
                              (state.products ?? [])[index].id ?? 0,
                              value * 12,
                              (state.products ?? [])[index]));
                        },
                      );
                    },
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.products?.length ?? 0,
                  )),
                  Divider(),
                  Flexible(
                      child: Container(
                    padding: EdgeInsets.all(16),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.menu,
                                color: context.colors.black,
                              ),
                              16.kw,
                              Icon(
                                Icons.home_filled,
                                color: context.colors.black,
                              ),
                              8.kw,
                              "Menu".s(14).w(600).c(context.colors.black),
                              Spacer(),
                              Icon(
                                Icons.qr_code_scanner,
                                color: context.colors.black,
                              ),
                              16.kw,
                              Icon(
                                CupertinoIcons.search,
                                color: context.colors.black,
                              )
                            ],
                          ),
                          GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio:
                                          state.isMenu == false ? 2 : 3),
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: menuList.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return state.isMenu == false
                                    ? ProductItem(
                                        onPressed: () {
                                          bloc.add(AddOrder(
                                              ProductModel(
                                                  name: productList[index],
                                                  cost: 12,
                                                  roomNumber: menuList[index],
                                                  productType: widget.type),
                                              widget.type));
                                        },
                                        title: productList[index],
                                      )
                                    : MenuItem(
                                        onPressed: () {
                                          bloc.add(ChangeMenu(false));
                                        },
                                        title: menuList[index]);
                              })
                        ],
                      ),
                    ),
                  ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
