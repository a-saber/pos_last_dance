import 'package:flutter/material.dart';
import 'package:pos/core/cache/cache_helper.dart';
import 'package:pos/core/helper/service_loactor.dart';

import 'core/app/app.dart';
import 'core/translation/translation_helper.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await TranslationHelper.init();
  MyServiceLocator.init();
  runApp(const MyApp());
}
