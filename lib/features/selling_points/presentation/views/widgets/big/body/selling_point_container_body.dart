import 'package:flutter/material.dart';


import '../selling_point_custom_appbar.dart';
import 'selling_point_grid_item.dart';
import 'selling_point_group_list.dart';

class SellingPointContainerBody extends StatelessWidget {
  const SellingPointContainerBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SellingPointCustomAppbar(),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Categories",
                // style: StyleManager.textStyle20.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              const SellingPointGroupList(),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Select Item",
                // style: StyleManager.textStyle20.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: 1,
                  physics: const BouncingScrollPhysics(),
                  crossAxisCount: ((MediaQuery.of(context).size.width/2)/150).round(),
                  children: List.generate(
                    14,
                    (index) => const SellingPointGridItem(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
