import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palomaps_project/extensions/text_extensions.dart';
import 'package:palomaps_project/extensions/theme_extensions.dart';
import 'package:palomaps_project/presentation/screens/order_list/bloc/order_show_bloc.dart';
import 'package:palomaps_project/presentation/screens/order_list/widget/order_show_widgets.dart';

class OrderListPage extends StatefulWidget {
  const OrderListPage({super.key});

  @override
  State<OrderListPage> createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  final bloc = OrderShowBloc();

  @override
  void initState() {
    bloc.add(GetAllProducts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: "Order list".s(20).w(400).c(context.colors.black),
          backgroundColor: context.colors.onPrimary,
          centerTitle: true,
          leading: IconButton(
              onPressed: () {

              },
              icon: Icon(
                Icons.menu,
                color: context.colors.black,
              )),
          elevation: 0,
          bottom: TabBar(
            dividerColor: context.colors.display,
            indicatorColor: context.colors.primary2,
            tabs: const <Widget>[
              Tab(text: "Unpaid"),
              Tab(text: "Paid"),
              Tab(text: "Closed"),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 8),
          child: TabBarView(
            children: [
              for(int i=0; i<3; i++)
              BlocProvider.value(
                value: bloc,
                child: BlocBuilder<OrderShowBloc, OrderShowState>(
                  builder: (context, state) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return OrderShowWidgets(
                            productModel: (state.products ?? [])[index]);
                      },
                      itemCount: (state.products ?? []).length,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
