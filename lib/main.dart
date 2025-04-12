import 'package:flutter/material.dart';
import 'package:pos/core/cache/cache_helper.dart';

import 'core/app/app.dart';
import 'core/translation/translation_helper.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await TranslationHelper.init();
  runApp(const MyApp());
}
