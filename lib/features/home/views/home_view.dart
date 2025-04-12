
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:pos/core/translation/translation_keys.dart';
import 'package:pos/core/utils/app_constants.dart';
import 'package:pos/core/widgets/custom_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    int getColumnCount() {
      double width = Get.width;
      if (width >= 1200) return 6;
      if (width >= 1000) return 5;
      if (width >= 800) return 4;
      if (width >= 600) return 3;
      return 2;
    }
    int columnCount = getColumnCount();
    return Scaffold(
      appBar: CustomAppBar(title: TranslationsKeys.home,),
      body: ListView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: [
          AnimationLimiter(
            child: GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(15),
              crossAxisCount: columnCount,
              children: List.generate(
                AppConstants.gridItems.length,
                    (int index) {
                  return AnimationConfiguration.staggeredGrid(
                    position: index,
                    duration: Duration(seconds: 1),
                    columnCount: columnCount,
                    child: ScaleAnimation(
                      duration: Duration(seconds: 2),
                      curve: Curves.fastLinearToSlowEaseIn,
                      child: FadeInAnimation(
                        child: AppConstants.gridItems[index],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

