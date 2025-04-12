import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/core/widgets/custom_fields/custom_form_field.dart';
import 'package:pos/features/home/views/home_view.dart';


class SellingPointCustomAppbar extends StatelessWidget {
  const SellingPointCustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            Get.off(() => HomeView());
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: SizedBox(
              //width: SizeManager.screenWidth / 2.6,
              height: 39,
              child: Material(
                borderRadius: BorderRadius.circular(20),
                elevation: 10,
                child: CustomFormField(
                  prefixIcon: Icon(Icons.search),
                  //fillColor: Get.isDarkMode?ColorsManager.primaryLight:ColorsManager.whiteOpacity,
                  controller: searchController,
                  labelText: "Search menu",
                ),
              ),
            ),
          ),
        ),
        const Icon(
          Icons.menu,
        ),
      ],
    );
  }
}
