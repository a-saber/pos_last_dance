import 'package:flutter/material.dart';
import 'package:pos/core/utils/app_colors.dart';
import 'package:pos/core/utils/app_text_styles.dart';

class CustomFilledBtn extends StatelessWidget {
  const CustomFilledBtn({super.key,
    required this.text,
    this.icon,
    required this.onPressed,
  });

  final String text;
  final Widget? icon;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)
        ),
        backgroundColor: AppColors.primary,
        padding:  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      ),
      onPressed: onPressed,
      child: icon == null ? Text(text, style: AppTextStyles.btnText(),) :
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:
        [
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 8.0),
            child: icon,
          ),
          Text(
            text,
            style: AppTextStyles.btnText(),
          ),

        ],
      )
    );
  }
}

class CustomTextBtn extends StatelessWidget {
  const CustomTextBtn({super.key,
    required this.text,
    this.icon,
    required this.onPressed,
  });

  final String text;
  final Widget? icon;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:
            [
              if(icon != null) Padding(
                padding: const EdgeInsetsDirectional.only(end: 8.0),
                child: icon,
              ),
              Text(
                text,
                style: AppTextStyles.deleteBtnText(),
              ),

            ],
          ),
        )
    );
  }
}
