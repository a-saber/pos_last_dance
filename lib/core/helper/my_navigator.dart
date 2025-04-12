import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_transition.dart';

class MyNavigator {
  static goBack<T>({T? result}) async
  {
     return Get.back<T>(result: result);
  }
  static Future<dynamic> goTo({
    required Widget Function() destinationBuilder,
    bool isReplace = false,
    Transition transition = AppTransition.defaultTransition,
    Duration duration = AppDuration.defaultDuration
      })  async
  {
    print("Navigating to ${destinationBuilder.toString()}");
    if(isReplace)
    {
      return await Get.offAll(destinationBuilder,
          transition: transition,
          duration: duration
      );
    }
    else
    {
      return await Get.to(destinationBuilder,
          transition: transition,
          duration: duration
      );
    }
  }
}
