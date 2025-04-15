import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pos/core/cache/cache_data.dart';
import 'package:pos/core/helper/service_loactor.dart';
import 'package:pos/core/translation/translation_helper.dart';
import 'package:pos/core/translation/translation_keys.dart';
import 'package:pos/core/utils/app_colors.dart';
import 'package:pos/core/utils/app_constants.dart';
import 'package:pos/core/utils/app_text_styles.dart';
import 'package:pos/features/auth/views/login_view.dart';
import 'package:pos/features/categories/manager/get_categories/get_categories_cubit.dart';
import 'package:pos/features/home/views/home_view.dart';
import 'package:pos/features/permissions/cubit/get_permissions/get_permissions_cubit.dart';
import 'package:pos/features/permissions/data/repo/permissions_repo.dart';
import 'package:pos/features/selling_points/presentation/selling_point_cubit/selling_point_cubit.dart';
import 'package:pos/features/users/cubit/get_users/get_users_cubit.dart';
import 'package:pos/features/users/data/repo/users_repo.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget startView;
    if (CacheData.accessToken == null) {
      startView = const LoginView();
    } else {
      startView = const HomeView();
    }
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(create: (context) => GetCategoriesCubit()..getCategories()),
        BlocProvider(create: (context) => GetPermissionsCubit(MyServiceLocator.getSingleton<PermissionsRepo>())..getPermissions()),
        BlocProvider(create: (context) => GetUsersCubit(MyServiceLocator.getSingleton<UsersRepo>())..getUsers()),
        BlocProvider(create: (context) => SellingPointCubit()),
      ],
      child: GetMaterialApp(
        translations: TranslationHelper(),
        locale: CacheData.lang != null? Locale( CacheData.lang!): TranslationsKeys.localeEN,
        navigatorKey: Get.key,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          scaffoldBackgroundColor: AppColors.scaffoldBackground,
          appBarTheme:  AppBarTheme(
            titleSpacing: 20,
            titleTextStyle: AppTextStyles.appBarTitle,
            backgroundColor: AppColors.scaffoldBackground,
            elevation: 0,
            scrolledUnderElevation: 0,
          ),
          textSelectionTheme: const TextSelectionThemeData(
              cursorColor: AppColors.primary,
              selectionHandleColor: AppColors.primary
          ),
          canvasColor: AppColors.primary,
          fontFamily: AppConstants.fontFamily,
        ),
        home: startView,
      ),
    );
  }
}
