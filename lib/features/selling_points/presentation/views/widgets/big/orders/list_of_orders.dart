import 'package:flutter/material.dart';

import 'list_of_orders_item.dart';

class ListOfOrders extends StatelessWidget {
  const ListOfOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        itemBuilder: (context, index) => const ListOfOrdersItem(),
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
        itemCount: 10,
      ),
    );
  }
}
