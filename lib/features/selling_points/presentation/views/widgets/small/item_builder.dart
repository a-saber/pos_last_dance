import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/core/utils/app_colors.dart';
import 'package:pos/features/selling_points/presentation/selling_point_cubit/selling_point_cubit.dart';

class ItemBuilder extends StatelessWidget {
  const ItemBuilder({super.key, required this.itemModel, this.fromBill = false, required this.index});

  final bool fromBill;
  final int index;
  final ItemModel itemModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topStart,
      children:
      [
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 8.0,top: 8.0),
          child: InkWell(
            onTap: () {
              if(!fromBill)
              SellingPointCubit.get(context).addItemToOrder(itemModel);
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color:AppColors.grey.withOpacity(0.2),
                  ),
                  color:AppColors.grey.withOpacity(0.2)
              ),
              padding: const EdgeInsets.all(10),
              margin:
              const EdgeInsetsDirectional.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage(itemModel.image),
                            fit: BoxFit.cover)),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Row(

                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              itemModel.title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600),
                            ),
                            // const SizedBox(
                            //   width: 13,
                            // ),
                            // Text(itemModel.title,
                            //   style: TextStyle(
                            //       color: ColorsManager.whiteOpacity,
                            //       fontWeight: FontWeight.w600),
                            // ),
                            const Spacer(),
                            Text(
                              '${(itemModel.count * itemModel.pricePerOne) + itemModel.tax} \$',
                              // style: StyleManager.textStyle18.copyWith(
                              //   color: ColorsManager.secondary,
                              // ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Row(
                          crossAxisAlignment:
                          CrossAxisAlignment.end,
                          //mainAxisAlignment:
                         // MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${itemModel.pricePerOne} \$',
                                  // style:StyleManager.textStyle15,
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  'الضريبة: ${itemModel.tax}\$',
                                  // style: StyleManager.textStyle15,
                                ),
                              ],
                            ),
                            // DefaultNumberPicker(
                            //   minValue: 1,
                            //   maxValue: 1000,
                            //   value: itemModel.count.toInt(),
                            //   onChanged: (val) {
                            //       SellingPointCubit.get(context).changeItemCount(
                            //           val:val,
                            //           index:index,
                            //           fromBill: fromBill
                            //       );
                            //     }
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if(fromBill)
        InkWell(
            onTap: () {
              SellingPointCubit.get(context).deleteItemFromOrder(index);
            },
            child: Icon(
              Icons.cancel,
              size: 30,
              color: AppColors.yellow,
            ))
      ],
    );
  }
}
