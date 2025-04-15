import 'package:flutter/services.dart';
import 'package:pos/core/widgets/custom_pop_up.dart';

void myCopyToClipboard(context, String text) async
{
  await Clipboard.setData(ClipboardData(text: text));
  CustomPopUp.callMySnackBar(context: context, text: '$text Copied to clipboard');
}