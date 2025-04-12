import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pos/features/selling_points/presentation/selling_point_cubit/selling_point_cubit.dart';
import 'package:pos/features/selling_points/presentation/selling_point_cubit/selling_point_states.dart';
import 'widgets/big/body/selling_point_group_list.dart';
import 'widgets/small/items_list_view.dart';
import 'widgets/small/order_items_list.dart';



class SellingPointsSmallView extends StatelessWidget {
  const SellingPointsSmallView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text(
          'Selling Point',
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: BlocConsumer<SellingPointCubit, SellingPointStates>(
          listener: (context, state){},
          builder: (context, state)
          {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Text(
                  "Categories",
                 // style: StyleManager.textStyle20.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                const SellingPointGroupList(),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Items",
                //  style: StyleManager.textStyle20.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                ItemsListView(),
                OrderItemsList(),
             //   DefaultButtonBar(),
              ],
            );
          }
        ),
      ),
    );
  }
}


