import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pos/core/utils/app_colors.dart';
import 'package:pos/core/utils/app_text_styles.dart';


enum PopUpState { SUCCESS, ERROR, WARNING }

class CustomPopUp
{

  static callMyPopUp({
    required String massage,
    required PopUpState state
  })
  {
    callMyToast(massage: massage, state: state);
  }

  static Color choosePopUpColor(PopUpState state) {
    Color color;
    switch (state) {
      case PopUpState.SUCCESS:
        color = AppColors.success;
        break;
      case PopUpState.ERROR:
        color = AppColors.error;
        break;
      case PopUpState.WARNING:
        color = AppColors.warning;
        break;
    }
    return color;
  }

  static void callMyToast({
    required String massage,
    required PopUpState state,
  }) =>
      Fluttertoast.showToast(
        msg: massage,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: choosePopUpColor(state),
        textColor: Colors.white,
        fontSize: 16.0,
      );

  static void callMySnackBar({
    required context,
    required String text,
    PopUpState? state,
    Color? backgroundColor = Colors.black,
    Color textColor = AppColors.white

  })
  {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: state != null ?
        choosePopUpColor(state) :
        backgroundColor,
        content: Text(
          text,
          style: AppTextStyles.btnText(color: AppColors.black),
        ),
        duration:const Duration(seconds: 2) ,
      ),

    );
  }
}
