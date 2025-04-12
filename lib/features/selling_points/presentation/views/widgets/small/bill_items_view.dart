import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/core/utils/app_colors.dart';
import 'package:pos/features/selling_points/presentation/selling_point_cubit/selling_point_cubit.dart';
import 'package:pos/features/selling_points/presentation/selling_point_cubit/selling_point_states.dart';

import 'item_builder.dart';

class BillItemsView extends StatelessWidget {
  const BillItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<SellingPointCubit, SellingPointStates>(
        listener: (context, state){},
        builder: (context, state)
        {
          var cubit = SellingPointCubit.get(context);
          return Column(
            children:
            [
              Row(
                children: [
                  Text(
                    'عدد الاصناف',
                //    style: StyleManager.textStyle18.copyWith(color: ColorsManager.secondary,fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Text(
                    '${cubit.orderItemsNumber}',
                  //  style: StyleManager.textStyle18.copyWith(color: ColorsManager.secondary,fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Divider(
                  color: AppColors.grey,
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: cubit.order.length,
                    itemBuilder: (context, index) =>
                        ItemBuilder(itemModel: cubit.order[index], index: index,
                          fromBill: true,
                        )
                ),
              ),
            ],
          );
        });
  }
}
