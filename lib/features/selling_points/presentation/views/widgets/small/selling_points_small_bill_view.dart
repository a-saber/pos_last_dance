import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pos/core/widgets/custom_fields/custom_btn.dart';
import 'package:pos/core/widgets/custom_fields/custom_form_field.dart';
import 'package:pos/features/selling_points/presentation/selling_point_cubit/selling_point_cubit.dart';
import 'package:pos/features/selling_points/presentation/selling_point_cubit/selling_point_states.dart';

import '../../sell_points_small_view.dart';
import 'bill_items_view.dart';

class SellPointMobileBillView extends StatefulWidget{
  const SellPointMobileBillView({Key? key}) : super(key: key);

  @override
  State<SellPointMobileBillView> createState() => _SellPointMobileBillViewState();
}

class _SellPointMobileBillViewState extends State<SellPointMobileBillView> {
  double orderTotalPercent = 0;
  var discount = TextEditingController();
  var add = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bill of sale',
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            )),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: BlocConsumer<SellingPointCubit, SellingPointStates>(
            listener: (context, state){},
            builder: (context, state)
            {
              var cubit = SellingPointCubit.get(context);
              return Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Total',
                     //   style: StyleManager.textStyle18.copyWith(color: ColorsManager.secondary,fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Text(
                        '${orderTotalPercent == 0 ? cubit.orderTotal : orderTotalPercent} \$',
                     //   style: StyleManager.textStyle18.copyWith(color: ColorsManager.secondary,fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Divider(
                      // color: Get.isDarkMode?ColorsManager.whiteOpacity:ColorsManager.primaryOpacity,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'الضريبة',
                   //     style: StyleManager.textStyle15.copyWith(fontWeight: FontWeight.bold),

                      ),
                      const Spacer(),
                      Text(
                        '8 \$',
                     //   style: StyleManager.textStyle15.copyWith(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DefaultSmallTitleField(
                      title: 'الخصم بنسبة',
                      controller: discount
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DefaultSmallTitleField(
                      title: 'الاضافة بنسبة',
                      controller: add
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                      height: 50,
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: CustomFilledBtn(onPressed: (){}, text: 'اتمام العملية')),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(child: BillItemsView())
                ],
              );
            }
        ),
      ),
    );
  }
}



class DefaultSmallTitleField extends StatelessWidget {
  const DefaultSmallTitleField({super.key, required this.title, required this.controller});

  final String title;
  final TextEditingController controller;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
     //     style: StyleManager.textStyle15.copyWith(fontWeight: FontWeight.bold),
        ),
        Spacer(),
        SizedBox(
          height: 30,
          width: 60,
          child: CustomFormField(
            labelText: '',
            controller: controller,
            keyboardType: TextInputType.number,
          ),
        ),
        SizedBox(width: 5,),
        Icon(Icons.percent)
      ],
    );
  }
}

