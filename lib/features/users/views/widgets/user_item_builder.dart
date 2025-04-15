import 'package:flutter/material.dart';
import 'package:pos/core/helper/my_copy_to_clipboard.dart';
import 'package:pos/core/helper/my_navigator.dart';
import 'package:pos/core/utils/app_borders.dart';
import 'package:pos/core/utils/app_colors.dart';
import 'package:pos/core/utils/app_text_styles.dart';
import 'package:pos/core/widgets/custom_network_image.dart';
import 'package:pos/features/users/data/models/user_model.dart';
import 'package:pos/features/users/views/edit_user_view.dart';

import 'delete_user_confirm_dialog.dart';

class UserItemBuilder extends StatelessWidget {
  const UserItemBuilder({super.key, required this.user});

  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()
      {
        MyNavigator.goTo(destinationBuilder: ()=>EditUserView(userModel: UserModel.from(user)));
      },
      onLongPress: ()
      {
        myCopyToClipboard(context, user.phone.toString());
      },
      child: Dismissible(
        onDismissed: (direction)
        {
          print("object");
        },
        confirmDismiss: (direction) async {
          return await showDeleteUserConfirmDialog(
              context: context,
              user: user,
          );
        },
        key: UniqueKey(),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withAlpha(25),
                  blurRadius: 7,
                  blurStyle: BlurStyle.outer,
                ),
              ]
          ),
          child: Row(
            children:
            [
              CustomCachedNetworkImage(
                imageUrl: user.image ?? 'https://www.hitsa.com.au/wp-content/uploads/types-of-chefs.jpg',
                borderRadius: BorderRadius.circular(15),
                imageBuilder: (imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover
                    )
                  ),
                ),
                width: 75,
                height: 75,
              ),
              const SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  Text( user.name ?? '',
                  style: AppTextStyles.itemsTitle(),),
                  Text( user.phone ?? '',),
                  Text( user.permission?.name ?? '',),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
