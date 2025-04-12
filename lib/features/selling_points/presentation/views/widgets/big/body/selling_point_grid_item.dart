import 'package:flutter/material.dart';
import 'package:pos/core/utils/app_colors.dart';


class SellingPointGridItem extends StatelessWidget {
  const SellingPointGridItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {},
        child: Material(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(20),
          elevation: 2,
          //shadowColor: ColorsManager.secondary,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primary,
                borderRadius: BorderRadius.circular(20),
                // border: Border.all(
                //   width: 0.5,
                //   color: ColorsManager.secondary,
                // )
            ),
            //height: SizeManager.screenWidth <= 800 ? 200 : 400,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://tse1.mm.bing.net/th?id=OIP.2m86YwVZYHm4kb2zXVO19AHaKy&pid=Api&rs=1&c=1&qlt=95&w=85&h=124"),
                            fit: BoxFit.fill)),
                  ),
                ),
                SizedBox(height: 5,),
                Text(
                  "Coffee Latte",
                  // style: StyleManager.textStyle15.copyWith(
                  //   height: 1.2,
                  //   fontWeight: FontWeight.w600,
                  // ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2,),
                Text(
                  "\$ 21.20",
                    // style: StyleManager.textStyle15.copyWith(
                    //   color: ColorsManager.secondary,
                    //   height: 1.2,
                    //   fontWeight: FontWeight.bold,
                    // )
                ),
                SizedBox(height: 2,),
              ],
            ),
          ),
        ));
  }
}
