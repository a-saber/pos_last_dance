import 'package:flutter/material.dart';
import 'package:pos/core/helper/my_copy_to_clipboard.dart';
import 'package:pos/core/helper/my_navigator.dart';
import 'package:pos/core/utils/app_colors.dart';
import 'package:pos/core/utils/app_text_styles.dart';
import 'package:pos/core/widgets/custom_network_image.dart';
import 'package:pos/features/clients/data/models/client_model.dart';
import 'package:pos/features/clients/views/edit_client_view.dart';

import 'delete_client_confirm_dialog.dart';


class ClientItemBuilder extends StatelessWidget {
  const ClientItemBuilder({super.key, required this.client});

  final ClientModel client;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()
      {
        MyNavigator.goTo(destinationBuilder: ()=>EditClientView(client: ClientModel.from(client)));
      },
      onLongPress: ()
      {
        myCopyToClipboard(context, client.phone.toString());
      },
      child: Dismissible(
        onDismissed: (direction)
        {
          print("object");
        },
        confirmDismiss: (direction) async {
          return await showDeleteClientConfirmDialog(
              context: context,
              client: client,
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children:
            [
              CustomCachedNetworkImage(
                imageUrl: client.imagePath ?? 'https://www.hitsa.com.au/wp-content/uploads/types-of-chefs.jpg',
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
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                  Text(
                    client.name ?? '',
                    style: AppTextStyles.itemsTitle(),
                  ),
                  if(client.phone != null && client.phone!.isNotEmpty)
                  Text( client.phone ?? ''),
                  if(client.address != null && client.address!.isNotEmpty)
                  Text( client.address??'' ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
