import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/core/helper/my_navigator.dart';
import 'package:pos/core/translation/translation_keys.dart';
import 'package:pos/core/utils/app_assets.dart';
import 'package:pos/core/utils/app_colors.dart';
import 'package:pos/core/utils/app_text_styles.dart';
import 'package:pos/core/widgets/show_delete_confirm_dialog.dart';
import 'package:pos/features/auth/views/login_view.dart';

import '../profile_view.dart';
import '../settings_view.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: AppColors.primary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                      child: SizedBox(
                        height: 60,
                        width: 60,
                        child: Image.asset(
                          AppAssets.logo,
                          fit: BoxFit.cover,
                          //color: ColorsManager.white,
                        ),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: (){scaffoldKey.currentState?.closeDrawer();},
                      icon: const Icon(Icons.cancel, color: AppColors.white,)
                    )
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            TranslationsKeys.hello.tr,
                            style: AppTextStyles.itemsTitle(color: AppColors.white),
                          ),
                          Text(
                            'Ahmed Saber',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.itemsTitle(color: AppColors.white),
                          )
                        ],
                      ),
                    ),
                    IconButton(
                        splashColor: AppColors.white,
                        onPressed: ()
                        {
                          MyNavigator.goTo(destinationBuilder: ()=>ProfileView());
                        },
                        icon: const Icon(Icons.edit_square, color: AppColors.white,)
                    )
                  ],
                ),
              ],
            ),
          ),

          ListTile(
            leading: const Icon(Icons.settings),
            title:  Text(TranslationsKeys.settings.tr),
            onTap: () {
              MyNavigator.goTo( destinationBuilder:()=> const SettingsView() );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text(TranslationsKeys.logout.tr),
            onTap: () {
              showDeleteConfirmationDialog(
                context: context,
                title: TranslationsKeys.logout.tr,
                content: TranslationsKeys.sureWannaLogOut.tr,
                deleteButtonBuilder: (ctx, button, loading) => button(
                  onPressed: () => MyNavigator.goTo(
                    destinationBuilder: () => LoginView(),
                    isReplace: true
                  )
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}