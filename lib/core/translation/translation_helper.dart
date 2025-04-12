
import 'dart:ui';

import 'package:get/get.dart';
import 'package:pos/core/cache/cache_data.dart';
import 'package:pos/core/cache/cache_helper.dart';
import 'package:pos/core/cache/cache_keys.dart';
import 'package:pos/core/translation/translation_keys.dart';

import 'ar.dart';
import 'en.dart';

// enum for languages
enum AppLanguages { ar,  en}

class TranslationHelper implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    CacheKeys.keyAR: ar,
    CacheKeys.keyEN: en,
  };

  static Future init() async {
    CacheData.lang = await CacheHelper.getData(key: CacheKeys.langKey);
    if (CacheData.lang == null) {
      await changeLanguage(language: AppLanguages.en);
    }
  }

  static Future changeLanguage({required AppLanguages language}) async
  {
    String value;
    Locale locale;
    switch (language) {
      case AppLanguages.ar:
        value = CacheKeys.keyAR;
        locale = TranslationsKeys.localeAR;
        break;
      case AppLanguages.en:
        value = CacheKeys.keyEN;
        locale = TranslationsKeys.localeEN;
        break;
    }

    await CacheHelper.saveData(key: CacheKeys.langKey, value: value);
    CacheData.lang = value;

    await Get.updateLocale(locale);
  }
}