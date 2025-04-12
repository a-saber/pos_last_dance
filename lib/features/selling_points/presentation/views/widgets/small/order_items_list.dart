import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pos/core/utils/app_colors.dart';
import 'package:pos/features/selling_points/presentation/selling_point_cubit/selling_point_cubit.dart';
import 'package:pos/features/selling_points/presentation/selling_point_cubit/selling_point_states.dart';

class OrderItemsList extends StatelessWidget {
  const OrderItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SellingPointCubit,SellingPointStates>(
      builder: (context, state)
      {
        var cubit=SellingPointCubit.get(context);
        if (cubit.order.isNotEmpty)
          return  Container(
            color: Colors.grey.shade300,
            height: 35,
            margin: const EdgeInsetsDirectional.only(
                start: 10.0, top: 5, bottom: 5, end: 5),
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cubit.order.length,
                      itemBuilder: (context, index) => Stack(
                        alignment: AlignmentDirectional.topStart,
                        children: [
                          Container(
                            height: 35,
                            width: 35,
                            margin: const EdgeInsetsDirectional.only(
                                end: 5, start: 5, top: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                    image: AssetImage(cubit.order[index].image),
                                    fit: BoxFit.cover)),
                            // child: Text(order[index].title),
                          ),
                          InkWell(
                              onTap: () {
                                cubit.deleteItemFromOrder(index);
                              },
                              child: const CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 5,
                                child: Icon(
                                  Icons.cancel,
                                  size: 14,
                                  color: AppColors.primary,
                                ),
                              ))
                        ],
                      )),
                ),
                Container(
                    height: 35,
                    // width: 30,
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: AppColors.yellow,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Total : ${SellingPointCubit.get(context).orderTotal}',
                          style: const TextStyle(
                              height: 1, fontWeight: FontWeight.bold),
                        ),
                        Text('${SellingPointCubit.get(context).orderItemsNumber} items',
                            style: const TextStyle(
                                height: 1,
                                fontWeight: FontWeight.bold,
                                fontSize: 12)),
                      ],
                    ))
              ],
            ),
          );
        return SizedBox();
      }, listener:  (context, state){});
  }
}
