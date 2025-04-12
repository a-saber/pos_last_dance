import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/core/translation/translation_keys.dart';
import 'package:pos/core/utils/app_colors.dart';
import 'package:pos/core/widgets/custom_loading.dart';

import 'custom_pop_up.dart';

Future<bool?> showDeleteConfirmationDialog({
  required BuildContext context,
  required String title,
  required String content,
  required Widget Function(
          BuildContext context,
          Widget Function({required void Function() onPressed}) deleteButton,
          Widget loading
      ) deleteButtonBuilder,
}) async{
  return await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(title),
      content:
          Text('${TranslationsKeys.areYouSureWantToDelete.tr} "$content" ?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(ctx).pop(false),
          child: Text(TranslationsKeys.cancel.tr),
        ),
        deleteButtonBuilder(ctx, confirmButtonBuilder, deleteConfirmationDialogLoading()),
      ],
    ),
  );
}

Widget confirmButtonBuilder({required void Function() onPressed}) {
  return TextButton(
    onPressed: onPressed,
    child: Text(TranslationsKeys.delete.tr,
        style: TextStyle(color: AppColors.error)),
  );
}

void deleteConfirmationDialogSuccess(BuildContext ctx) {
  Navigator.of(ctx).pop(true);
  CustomPopUp.callMyToast(
      massage: TranslationsKeys.deletedSuccess.tr, state: PopUpState.SUCCESS);
}

void deleteConfirmationDialogError(String error) {
  CustomPopUp.callMyToast(massage: error, state: PopUpState.ERROR);
}

Widget deleteConfirmationDialogLoading() => CustomLoading();
