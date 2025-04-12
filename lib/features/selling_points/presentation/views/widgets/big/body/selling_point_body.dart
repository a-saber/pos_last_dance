import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/core/utils/app_colors.dart';

import 'details_container_list_item_child.dart';
import 'selling_point_container_body.dart';

class SellingPointBody extends StatelessWidget {
  const SellingPointBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 440,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadiusDirectional.only(
                topEnd: Radius.circular(20),
                bottomEnd: Radius.circular(20),
              )),
          child: const DetailsContainerListItemBody(),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            color:  AppColors.scaffoldBackground,
            child: const SellingPointContainerBody(),
          ),
        ),
        Container(
          height: double.infinity,
          width: 80,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(20),
                bottomStart: Radius.circular(20),
              )),
          child: SingleChildScrollView(
            child: Column(
              children:
              [
                Text('Mali',//style: StyleManager.textStyle24,
                ),
                SizedBox(height: 50,),
                IconButton(
                  color: AppColors.yellow,
                  onPressed: (){},
                  icon: Icon(Icons.restaurant)
                ),
                SizedBox(height: 15,),
                IconButton(

                  onPressed: (){},
                  icon: Icon(Icons.restaurant, color: Color(0xffa9a9a9),)
                ),
                SizedBox(height: 15,),IconButton(

                  onPressed: (){},
                  icon: Icon(Icons.restaurant, color: Color(0xffa9a9a9),)
                ),
                SizedBox(height: 15,),
                IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.restaurant)
                ),
                SizedBox(height: 15,),
                IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.restaurant)
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
