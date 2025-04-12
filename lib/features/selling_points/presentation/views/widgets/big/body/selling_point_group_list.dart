import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pos/core/utils/app_colors.dart';
import 'package:pos/features/selling_points/presentation/selling_point_cubit/selling_point_cubit.dart';
import 'package:pos/features/selling_points/presentation/selling_point_cubit/selling_point_states.dart';

class SellingPointGroupList extends StatelessWidget {
  const SellingPointGroupList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SellingPointCubit, SellingPointStates>(
      builder: (context, state) {
        var cubit = SellingPointCubit.get(context);
        return SizedBox(
          width: double.infinity,
          height: 100,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                cubit.groupTapped(index);
              },
              child: Material(
                borderRadius: BorderRadius.circular(10),
                shadowColor: Colors.black,
                elevation: index == cubit.itemIndex ? 5 : 0,
                child: Container(
                  width: 85,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                      color: index == cubit.itemIndex
                          ? AppColors.yellow.withOpacity(.3)
                          : AppColors.white,
                      border: Border.all(
                        color:index == cubit.itemIndex?AppColors.yellow:AppColors.grey,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Image.network(
                          //   "https://tse1.mm.bing.net/th?id=OIP.2m86YwVZYHm4kb2zXVO19AHaKy&pid=Api&rs=1&c=1&qlt=95&w=85&h=124"
                          // ,height: 30, width: 30, fit: BoxFit.cover,),
                       ///   SvgPicture.asset(AssetsManager.pizza,height: 20,width: 20,),
                          SizedBox(height: 15,),
                          Text(
                            "Pizza",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                    //         style: StyleManager.textStyle18.copyWith(
                    //       color: index == cubit.itemIndex?ColorsManager.white:ColorsManager.textColor,
                    //       height: 1
                    // ),
                  ),
                        ],
                      )),
                ),
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(
              width: 15,
            ),
            itemCount: 20,
          ),
        );
      },
    );
  }
}
