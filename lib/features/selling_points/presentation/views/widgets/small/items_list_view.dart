import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/features/selling_points/presentation/selling_point_cubit/selling_point_cubit.dart';
import 'package:pos/features/selling_points/presentation/selling_point_cubit/selling_point_states.dart';

import 'item_builder.dart';

class ItemsListView extends StatelessWidget {
  const ItemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SellingPointCubit, SellingPointStates>(
        listener: (context, state){},
        builder: (context, state)
        {
          var cubit = SellingPointCubit.get(context);
          return Expanded(
            child: ListView.builder(
                itemCount: cubit.collections[cubit.collectionCurrentIndex].items.length,
                itemBuilder: (context, index) => ItemBuilder(
                    itemModel: cubit.collections[cubit.collectionCurrentIndex].items[index], index: index,)),
          );
        }
      );
  }
}
